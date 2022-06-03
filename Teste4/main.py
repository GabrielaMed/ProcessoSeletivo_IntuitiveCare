from flask import Flask, jsonify, request
import pandas as pd
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

data = pd.read_csv('Relatorio_cadopTeste4.csv', header=2, sep=';', encoding='ISO-8859-1')
operadoras = data['Razão Social'].to_list()


@app.route('/', methods=['GET'])
def homepage():
  show = {'operadoras': operadoras}
  return jsonify(show)

@app.route('/search', methods=['GET'])
def searchOperadora():
  razaoSocial = request.args.get('razaoSocial')
  print(razaoSocial)
  filtered = filter(lambda name: str(name).find(razaoSocial) >= 0, operadoras)
  show = {'operadoras': list(filtered)}
  return jsonify(show)

if __name__ == '__main__':
    app.run()