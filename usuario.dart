class Usuario {
  String _nombre = "pablo";
  String _contrasena = "contrasena";
  int _edad = 24;
  String? _apellidos;
  double? _altura;
  double? _peso;

  String get nombre => _nombre;
  String get contrasena => _contrasena;
  int get edad => _edad;
  String? get apellidos => _apellidos;
  double? get altura => _altura;
  double? get peso => _peso;

  set nombre(String nombre) {
    _nombre = nombre;
  }

  set contrasena(String contrasena) {
    _contrasena = contrasena;
  }

  set edad(int edad) {
    _edad = edad;
  }

  set apellidos(String? apellidos) {
    _apellidos = apellidos;
  }

  set altura(double? altura) {
    _altura = altura;
  }

  set peso(double? peso) {
    _peso = peso;
  }

  double calcularIMC() {
    return _peso! / (_altura! * _altura!);
  }
}
