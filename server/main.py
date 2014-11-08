from flask import Flask, request, jsonify, make_response, current_app
from datetime import timedelta
from functools import update_wrapper
import json
from modules.essentialPrimeImplicant import get_essential
from modules.primeImplicants import PI
from modules.truthTableGen import TruthTable

app = Flask(__name__)
app.config["DEBUG"] = True
truth_table = None
primes = None
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
def rawa7():
    return "rawa7 le omak"

@app.route("/terms", methods=['POST'])
@crossdomain(origin='*')
def getTruthTable():
	json = request.form
	global truth_table
	truth_table = TruthTable(map(int,json.getlist('terms[]')),map(int,json.getlist("cares[]")),True if json["type"] == u"true" else False,int(json["numberOfBits"]))
	return jsonify(truth_table.table)

@app.route("/prime", methods=['GET'])
@crossdomain(origin='*')
def getPrimeImplicants():
	items = []
	for term, value in truth_table.table.iteritems():
		if value or value is None:
			items.append(str(bin(term)).replace('0b','').zfill(3))
	global primes
	primes = PI(items)
	return jsonify({'data': primes})

@app.route("/essential", methods=['GET'])
@crossdomain(origin='*')
def getEssentialPrimes():
	minimized = {prime[0]: prime[1::] for prime in primes}
	terms = truth_table.terms
	return jsonify({'data': get_essential(minimized,terms)})

if __name__ == "__main__":
    app.run()
