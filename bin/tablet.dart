import 'dispositivo.dart';
import 'vibrar.dart';
import 'conectividad_wifi.dart';

class Tablet extends Dispositivo with Vibrar, ConectividadWifi{
  
  String sistemaOperativo;

  Tablet(
    this.sistemaOperativo,
    super.id, super.marca, super.modelo, super.anyoFabricacion);

  void modoNoche(){
    print("Modo noche activado. ");
  }
}