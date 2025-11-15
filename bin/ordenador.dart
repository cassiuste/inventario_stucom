import 'dispositivo.dart';
import 'conectividad_wifi.dart';
import 'sincronizacion_nube.dart';

class Ordenador extends Dispositivo with ConectividadWifi, SincronizacionNube{
  
  String modeloProcesador;

  Ordenador(
    this.modeloProcesador,
    super.id, super.marca, super.modelo, super.anyoFabricacion);

  void compilarCodigo(){
    print("Compilando codigo...");   
  }
}