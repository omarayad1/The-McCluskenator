from flask import Flask, request, jsonify, make_response, current_app
from datetime import timedelta
from functools import update_wrapper
from copy import deepcopy
from math import log, ceil
from modules.essentialPrimeImplicant import get_essential, Dominating
from modules.primeImplicants import PI
from modules.truthTableGen import TruthTable
from os import environ
import os
import hashlib
import redis
import pickle

app = Flask(__name__)
app.config["DEBUG"] = True

def crossdomain(origin=None, methods=None, headers=None,
                max_age=21600, attach_to_all=True,
                automatic_options=True):
    if methods is not None:
        methods = ', '.join(sorted(x.upper() for x in methods))
    if headers is not None and not isinstance(headers, basestring):
        headers = ', '.join(x.upper() for x in headers)
    if not isinstance(origin, basestring):
        origin = ', '.join(origin)
    if isinstance(max_age, timedelta):
        max_age = max_age.total_seconds()

    def get_methods():
        if methods is not None:
            return methods

        options_resp = current_app.make_default_options_response()
        return options_resp.headers['allow']

    def decorator(f):
        def wrapped_function(*args, **kwargs):
            if automatic_options and request.method == 'OPTIONS':
                resp = current_app.make_default_options_response()
            else:
                resp = make_response(f(*args, **kwargs))
            if not attach_to_all and request.method != 'OPTIONS':
                return resp

            h = resp.headers

            h['Access-Control-Allow-Origin'] = origin
            h['Access-Control-Allow-Methods'] = get_methods()
            h['Access-Control-Max-Age'] = str(max_age)
            if headers is not None:
                h['Access-Control-Allow-Headers'] = headers
            return resp

        f.provide_automatic_options = False
        return update_wrapper(wrapped_function, f)
    return decorator

@app.route("/", methods=['POST', 'GET'])
def nothing():
    return "nothing here"

@app.route("/terms", methods=['POST'])
@crossdomain(origin='*')
def getTruthTable():
    redisconn = redis.Redis(
        host=environ['REDIS_HOST'], 
        port=environ['REDIS_PORT'], 
        password=environ['REDIS_PASSWORD']
        )
    json = request.form
    truth_table = TruthTable(
        map(int,json.getlist('terms[]')),
        map(int,json.getlist("cares[]")),
        True if json["type"] == u"true" else False,
        int(json["numberOfBits"])
        )
    token = hashlib.sha1(os.urandom(128)).hexdigest()
    redisconn.setex(token, pickle.dumps(truth_table), 3600)
    return jsonify({'table': truth_table.table, 'token': token})

@app.route("/prime", methods=['POST'])
@crossdomain(origin='*')
def getPrimeImplicants():
    redisconn = redis.Redis(
        host=environ['REDIS_HOST'], 
        port=environ['REDIS_PORT'], 
        password=environ['REDIS_PASSWORD']
        )
    items = []
    truth_table = pickle.loads(
        redisconn.get(
            request.form['token']
            )
        )
    for term, value in truth_table.table.iteritems():
        if value or value is None:
            items.append(str(bin(term)).replace('0b','').zfill(truth_table.variableNumber))
    truth_table.primes = PI(items)
    redisconn.setex(request.form['token'], pickle.dumps(truth_table), 3600)
    return jsonify({'data': truth_table.primes, 'number-of-bits': truth_table.variableNumber})

@app.route("/essential", methods=['POST'])
@crossdomain(origin='*')
def getEssentialPrimes():
    redisconn = redis.Redis(
        host=environ['REDIS_HOST'], 
        port=environ['REDIS_PORT'], 
        password=environ['REDIS_PASSWORD']
        )
    truth_table = pickle.loads(
        redisconn.get(
            request.form['token']
            )
        )
    truth_table.minimized = {prime[0]: prime[1::] for prime in truth_table.primes}
    terms = truth_table.terms
    terms_for_essential = deepcopy(terms)
    minimized_for_essential = deepcopy(truth_table.minimized)
    redisconn.setex(request.form['token'], pickle.dumps(truth_table), 3600)
    return jsonify({'data': get_essential(minimized_for_essential,terms_for_essential)})

@app.route("/dominating", methods=['POST'])
@crossdomain(origin='*')
def getDominating():
    redisconn = redis.Redis(
        host=environ['REDIS_HOST'], 
        port=environ['REDIS_PORT'], 
        password=environ['REDIS_PASSWORD']
        )
    truth_table = pickle.loads(
        redisconn.get(
            request.form['token']
            )
        )
    minimized_for_dominating = deepcopy(truth_table.minimized)
    terms_for_dominating = deepcopy(truth_table.terms)
    return jsonify({'data': Dominating(minimized_for_dominating, terms_for_dominating)})

if __name__ == "__main__":
    app.run()
