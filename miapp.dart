import "dart:io";
import "package:mysql1/mysql1.dart";
import "usuario.dart";
import "database.dart";
import "menus.dart";
main() async {
  var conn;
  try {
    var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
    );
    conn = await MySqlConnection.connect(settings);
    await conn.query('CREATE DATABASE IF NOT EXISTS miapp_db');
    print('Base de datos creada');
    await conn.query('USE miapp_db');
    print('Conectado a mi app_db');
    await conn.query('''CREATE TABLE IF NOT EXISTS usuarios(
 idusuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL UNIQUE,
 password VARCHAR(10) NOT NULL
)''');
    print('Tabla usuarios creada');
  } catch (e) {
    print(e);
  } finally {
    conn.close();
  }

  String?opcion;
  do {
    stdout.writeln("""Hola , selecciona una opción:
    1. Registro
    2. Log in""");
  opcion = stdin.readLineSync() ?? 'error';
} while (opcion != "1" && opcion != "2");
switch (opcion) {
 case "1":
    bool creado = false;
    do{
      creado = false;
      stdout.writeln("Introduce el nombre con el que te quieres registrar");
      String nombre = stdin.readLineSync() ?? 'error';
      stdout.writeln("Ahora introduce la que será tu contraseña");
      String password = stdin.readLineSync() ?? 'error';
      try{
        conn = await MySqlConnection.connect(setting);
        await conn.query('USE miapp_db');

        var registros = await conn
            .query("SELECT * FROM usuarios WHERE nombre = ?" , [nombre]);
    
        if (registros.length == 1) {
          stdout.writeln("El usuario ya existe, prueba con otro");
        } else {
          await conn.query(
              "INSERT INTO usuarios (nombre,password) VALUES(?,?)",
              [nombre, password]);
          stdout.writeln("Usuario insertado con éxito");
          creado = true;   
        }
      }
   } 
   }



  bool logueado = false;
  Usuario usuario = Usuario();
  do {
    stdout.writeln("Bienvenido!Introduce tu nombre de usuario");
    String nombre = stdin.readLineSync() ?? "error";
    stdout.writeln("Introduce la contrasena");
    String contrasena = stdin.readLineSync() ?? "error";
    if (nombre == usuario.nombre && contrasena == usuario.contrasena) {
      stdout.writeln("Login correcto");
      logueado = true;
    } else {
      stdout.writeln("Login incorrecto");
    }
  } while (logueado == false);
  stdout.writeln("""Bienvenido, ${usuario.nombre},elige una opción:
  1. Completar datos
  2. Calcular IMC""");

  int opcion = int.parse(stdin.readLineSync() ?? '0');
  if (opcion == 1) {
    stdout.writeln("Introduce tu edad");
    usuario.edad = int.parse(stdin.readLineSync() ?? '0');
    stdout.writeln("Introduce tus apellidos");
    usuario.apellidos = stdin.readLineSync() ?? '0';
    stdout.writeln("Introduce tu altura en metros");
    usuario.altura = double.parse(stdin.readLineSync() ?? '0');
    stdout.writeln("Introduce tu peso en kg");
    usuario.peso = double.parse(stdin.readLineSync() ?? '0');
  } else if (opcion == 2) {
    if (usuario.altura != null && usuario.peso != null) {
      double imc = usuario.calcularIMC();
      stdout.writeln("Tu IMC es $imc");
    } else {
      stdout.writeln("Debes completar tus datos primero");
    }
  }

 stdout.writeln = ("Introduce tu nombre");
 string respuesta = string.parse(stdin.readLineSync() ?? '0' );


