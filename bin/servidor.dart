import 'dispositivo.dart';
import 'conectividad_wifi.dart';
import 'sincronizacion_nube.dart';

class Servidor extends Dispositivo with ConectividadWifi, SincronizacionNube{
  
  double almacenamiento;

  Servidor(
    this.almacenamiento,
    super.id, super.marca, super.modelo, super.anyoFabricacion);

  void actualizarLibrerias(){
    print("Actualizando las librerias del servidor...");
  }
}