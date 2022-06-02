from flask import Flask, jsonify, render_template, request
import pandas as pd

app = Flask(__name__)

data = pd.read_csv('Relatorio_cadopTeste4.csv', header=2, sep=';', encoding='ISO-8859-1')
operadoras = data['Nome Fantasia'].to_list()

@app.route('/', methods=['GET'])
def searchOperadora():
  nomeFantasia = request.args.get('NomeFantasia')
  filtered = filter(lambda name: str(name).find(nomeFantasia) >= 0, operadoras)
  show = {'operadoras': list(filtered)}
  return jsonify(show)

if __name__ == '__main__':
    app.run()