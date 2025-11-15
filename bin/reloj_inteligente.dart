import 'dispositivo.dart';
import 'vibrar.dart';
import 'conectividad_wifi.dart';

class RelojInteligente extends Dispositivo with Vibrar, ConectividadWifi{
  
  bool gpsIntegrado;

  RelojInteligente(
    this.gpsIntegrado,
    super.id, super.marca, super.modelo, super.anyoFabricacion);

  void mostrarNotificaciones(){
    print("Mostrando norificaciones...");
  }
}