import zipfile
import tabula

tabula.io.convert_into("Anexo_I_Rol_2021RN_465.2021_RN473_RN478_RN480_RN513_RN536.pdf",'Teste_Gabriela.csv',output_format='csv', pages='all')

reader = open("Teste_Gabriela.csv", "r")
reader = ''.join([i for i in reader]).replace(",OD,", ",Seg. Odontológica,").replace(",AMB,", ",Seg. Ambulatorial,") 
writer = open("Teste_Gabriela.csv","w")
writer.writelines(reader)
writer.close()

with zipfile.ZipFile ('Teste_Gabriela.zip', 'w') as zipObj:
  zipObj.write('Teste_Gabriela.csv')