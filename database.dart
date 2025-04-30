








import 'package:mysql1/mysql1.dart';

var settings = ConnectionSettings(
  host: _host,
  port: _port,
  user: _user,
);
var conn = await MySqlConnection.connect(settings);
try{
  await _crearBBDD(conn);
  await _crearTablaUsuarios(conn);
} cacth