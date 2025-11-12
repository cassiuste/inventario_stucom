import 'dispositivo.dart';
import 'vibrar.dart';
import 'conectividad_wifi.dart';

class RelojInteligente extends Dispositivo with Vibrar, ConectividadWifi{
  
  List<String> notificaciones;
  
  RelojInteligente(
    this.notificaciones,
    super.id, super.marca, super.modelo, super.anyoFabricacion);


  // Muestra todas las notificaciones del Reloj
  void mostrarNotificaciones(){
    for (String notificacion in notificaciones) {
      print(notificacion);
    }
  }
}