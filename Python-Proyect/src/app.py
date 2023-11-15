from flask import Flask,jsonify,request,render_template,redirect, url_for
from flask_mysqldb import MySQL
from config import config
import os

template_dir = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))
template_dir = os.path.join(template_dir, 'src','templates')
app=Flask(__name__, template_folder = template_dir) #saber si se esta ejecutando el archivo como manin

conexion = MySQL(app)

#@app.route('/')
#def home():
#    return render_template('index.html')


@app.route('/', methods=['GET'])
def listarPersonajes():
    try:
        cursor = conexion.connection.cursor()
        sql = "SELECT ID_Personaje, Nombre, Edad, Ocupacion, Relacion FROM personajes" #Sentencia SQL
        cursor.execute(sql)
        datos = cursor.fetchall()
        personajes=[]
        for fila in datos:
            personaje ={'ID_Personaje':fila[0],'Nombre':fila[1],'Edad':fila[2], 'Ocupacion':fila[3], 'Relacion':fila[4]}
            personajes.append(personaje)
        print(personajes)
        return render_template('index.html',data=personajes)
        #return jsonify({'Personajes':personajes,'mensaje':"Personajes listados"})
    except Exception as ex:
        return "Error"

#Si se quiere crear unicamente un metodo que traiga solo uno de los personajes se debe hacer lo siguiente:
@app.route('/Personajes/<nombre>',methods=['GET'])
def leer_personaje(nombre):
    try:
        cursor = conexion.connection.cursor()
        sql = "SELECT ID_Personaje, Nombre, Edad, Ocupacion, Relacion FROM personajes WHERE Nombre = '{0}'".format(nombre)
        cursor.execute(sql)
        datos=cursor.fetchone()
        if datos != None:
            personaje ={'Nombre':datos[0],'Edad':datos[1], 'Ocupacion':datos[2], 'Relacion':datos[3]}
            return jsonify({'Personaje':personaje,'mensaje':"Personaje listado"})
        else:
            return jsonify({'mensaje':"Error, personaje no encontrado"})
    except Exception as ex:
        return jsonify({'mensaje':"Error, personaje no encontrado"})
    
@app.route('/Personajes', methods=['POST'])
def registrar_personaje():
#print(request.json)
    try:

        cursor = conexion.connection.cursor()
        sql = """INSERT INTO personajes (ID_Personaje, Nombre, Edad, Ocupacion, Relacion)VALUES ('{0}', '{1}', '{2}', '{3}', '{4}')""".format(request.json['ID_Personaje'], request.json['Nombre'],request.json['Edad'],request.json['Ocupacion'],request.json['Relacion'])
        cursor.execute(sql)
        conexion.connection.commit()#Se confirma la inserción
        #return redirect(url_for('/Personajes'))
        return jsonify({'mensaje':"Notificacion, personaje registrado"})
    except conexion.connection.IntegrityError as e:
        # Manejar el error de llave duplicada
        return jsonify({'mensaje': "Error, ya existe un personaje con ese ID_Personaje"})
    except Exception as ex:
        print(ex)
        return jsonify({'mensaje':"Error, No es posible registrar personaje"})

@app.route('/Personajes/<ID_Personaje>', methods=['PUT'])
def modificar_personaje(ID_Personaje):
#print(request.json)
    try:
        cursor = conexion.connection.cursor()
        sql = """UPDATE personajes SET Nombre = '{0}', Edad = '{1}', Ocupacion = '{2}', Relacion = '{3}' WHERE ID_Personaje = '{4}'""".format(request.json['Nombre'],request.json['Edad'],request.json['Ocupacion'],request.json['Relacion'],ID_Personaje)
        cursor.execute(sql)
        conexion.connection.commit()#Se confirma la inserción
        return jsonify({'mensaje':"Notificacion, personaje actualizado"})
    except Exception as ex:
        print(ex)
        return jsonify({'mensaje':"Error, No es posible registrar personaje"})

@app.route('/Personajes/<ID_Personaje>', methods=['DELETE'])
def eliminar_personaje(ID_Personaje):
    try:
        cursor = conexion.connection.cursor()
        sql = "DELETE FROM personajes WHERE ID_Personaje = '{0}'".format(ID_Personaje)
        cursor.execute(sql)
        conexion.connection.commit()
        return jsonify({'mensaje':"Notificacion, personaje eliminado"})
    except Exception as ex:
        return jsonify({'mensaje':'Error'})

def page_not_found(error):
    return "<h1> Estas buscando una página que no se puede encontrar </h1>",404

if __name__ == '__main__':
    app.config.from_object(config['development']) #acceder a la clase para saber si está en debug o no
    app.register_error_handler(404,page_not_found)
    app.run()