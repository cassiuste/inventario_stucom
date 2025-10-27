import 'dart:io';
import 'dispositivo.dart';

  void main(List<String> arguments) {
    menu();
  }

  void menu(){
    while (true) {
      try{
          print("-------Menu--------");
          print("1) Crear dispositivo");
          print("2) Eliminar dispositivo");
          print("3) Modificar dispositivo");
          print("4) Salir");
          int? num = int.parse(stdin.readLineSync()!); 
          if (num == 1) {
            crearDispositivo();
          }
          else if (num == 2){
            print("Objeto numero 2");
          }
          else if (num == 3){
            print("Objeto numero 3");
          }
          else if (num == 4){
            print("Finalizando el programa");
            break;
          }
        }
        catch (e){
          print("Opción invalida. ");
        }
      }
  }
  void crearDispositivo(){
      while(true){
        try {
          print("----Crear Dispositivo----");
          print("1) Ordenador");
          print("2) Tablet");
          print("3) Reloj Inteligente");
          print("4) Servidor");
          print("5) Volver al menu");
          int? num = int.parse(stdin.readLineSync()!); 
          if (num == 1) {
            print("Ordenador");
            print("Ordenador creado exitosamente. ");
            break;
          }
          else if (num == 2) {
            print("Tablet");
            print("Tablet creado exitosamente. ");
            break;
          }
          else if (num == 3) {
            print("Reloj Inteligente");
            print("Reloj Inteligente creado exitosamente. ");
            break;
          }
          else if (num == 4) {
            print("Servidor");
            print("Servidor creado exitosamente. ");
            break;
          }
          else if (num == 5) {
            print("Servidor");
            break;
          }
          else{
            print("Opción Invalida. ");
          }

        } catch (e) {
          print("Opción invalida. ");
        }
      }
    }
