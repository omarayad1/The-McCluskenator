from flask import Flask
from modules.booleanFunctionGenerator import *
from modules.maxTerms import *
from modules.minTerms import *
from modules.minimizationFunction import *
from modules.primeImplicantFilter import *
from modules.truthTableGen import *

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

if __name__ == "__main__":
    app.run()