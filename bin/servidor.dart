import 'dispositivo.dart';
import 'conectividad_wifi.dart';
import 'sincronizacion_nube.dart';

class Servidor extends Dispositivo with ConectividadWifi, SincronizacionNube{
  
  List<String> librerias;

  Servidor(
    this.librerias,
    super.id, super.marca, super.modelo, super.anyoFabricacion);

  // imprime las librerias que tiene, las selecciona el usuario
  // despues las actualiza
  void actualizarLibrerias(){
    for(String libreria in librerias){
      libreria;
    }
  }
}