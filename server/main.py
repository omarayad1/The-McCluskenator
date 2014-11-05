from flask import Flask, request, jsonify
from modules.booleanFunctionGenerator import *
from modules.maxTerms import *
from modules.minTerms import *
from modules.minimizationFunction import *
from modules.primeImplicantFilter import *
from modules.truthTableGen import TruthTable

app = Flask(__name__)

@app.route("/")
def rawa7():
    return "rawa7 le omak"

@app.route("/terms", methods=['POST'])
def getTruthTable():
	json = request.json
	truth_table = TruthTable(json["terms"],json["cares"],json["type"],json["numberOfBits"])
	return jsonify(truth_table.table)

if __name__ == "__main__":
    app.run()