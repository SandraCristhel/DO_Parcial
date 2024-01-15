import json
import zipfile
import os

api_token = {"username":"sandraperezballon","key":"0799691c33dd391b6d75d77886aa72c1"} ##contenido de archivo kaggle.jason

##conectar a Kaggle
with open("C:/Users/sancp/.kaggle/kaggle.json","w") as file:
    json.dump(api_token,file)
location = "C:/Users/sancp/OneDrive/Documentos/Proyecto_Parcial/Dataset"

##Validar que la carpeta exista
if not os.path.exists(location):
    ##Si no existe la carpeta dataset entonces la creo
    os.mkdir(location)
else:
    ##Si la carpeta si existe, entonces voy a borrar su contenido 
    for root, dirs, files in os.walk(location,topdown=False):
        for name in files:
            os.remove(os.path.join(root,name)) ##Elimino todos los archivos
        for name in dirs:
            os.rmdir(os.path.join(root,name)) ##Elimino todas las carpetas

##Descargar dataset de Kaggle
os.system("kaggle datasets download -d henryshan/starbucks -p C:/Users/sancp/OneDrive/Documentos/Proyecto_Parcial/Dataset")

##Descomprimir el archivo de Kaggle
os.chdir(location)
for file in os.listdir():
    zip_ref = zipfile.ZipFile(file,"r") ##Lee archivo .zip
    zip_ref.extractall() ##Extrae contenido de archivo.zip
    zip_ref.close() ##cierra archivo


 
 
 
 
 