from flask import Flask, jsonify, request
import pandas as pd

app = Flask(__name__)

@app.route('/',)
def searchOperadora():
  data = pd.read_csv('Relatorio_cadopTeste4.csv', header=2, sep=';', encoding='ISO-8859-1')
  operadoras = data['Representante'].to_list()
  operadora = request.args.get('Representante', type = str)
  show = {'operadoras': operadora}
  return jsonify(show)

if __name__ == '__main__':
    app.run()

# https://stackoverflow.com/questions/69823336/creating-search-function-on-csv-file-through-flask ngc do html talvez use para o vue