import 'dispositivo.dart';

class Servidor extends Dispositivo{
  
  List<String> librerias;

  Servidor(
    this.librerias,
    super.id, super.marca, super.modelo, super.anyoFabricacion);

  void actualizarLibrerias(){

  }
}