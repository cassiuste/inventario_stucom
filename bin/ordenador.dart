import 'dispositivo.dart';
class Ordenador extends Dispositivo
{
  Ordenador(super.id, super.marca, super.modelo, super.anyoFabricacion);

  void compilarCodigo(){
    print("Compilando codigo");   
  }
}