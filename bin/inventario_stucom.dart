import 'dart:io';
import 'dispositivo.dart';
import 'globals.dart';
import 'ordenador.dart';
import 'tablet.dart';
import 'servidor.dart';
import 'reloj_inteligente.dart';

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
            crearDispositivoMenu();
          }
          else if (num == 2){
            eliminarDispositivoMenu();
          }
          else if (num == 3){
            modificarDispositivoMenu();
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

  // Cuando lo crea que lo mande a la funcion globals que tenga todos los dispositivos
  // y actue como una base de datos
  void crearDispositivoMenu(){
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
            crearOrdenador();
            print("Ordenador creado exitosamente. ");
            break;
          }
          else if (num == 2) {
            crearTablet();
            print("Tablet creado exitosamente. ");
            break;
          }
          else if (num == 3) {
            crearRelojInteligente();
            print("Reloj Inteligente creado exitosamente. ");
            break;
          }
          else if (num == 4) {
            crearServidor();
            print("Servidor creado exitosamente. ");
            break;
          }
          else if (num == 5) {
            print("Volviendo al menu..");
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
    
        
    void crearOrdenador() {
        print("---- Crear Ordenador ----");
        var datos = crearDispositivoGenerico();

        print("Modelo del procesador: ");
        String modeloProcesador = stdin.readLineSync()!;
          if (datos == null) return;

          // Se crea el Ordenador con el tipo especifico
            Ordenador ordenador = Ordenador(
            modeloProcesador,
            datos["id"],
            datos["marca"],
            datos["modelo"],
            datos["anyo"],
          );

          // Se almacena en los mapas de dispositivos y los ordenadores
          dispositivos[datos["id"]] = ordenador;
          ordenadores[datos["id"]] = ordenador;

          // Cuando lo crea que implemete la funcion del mixin que tiene la clase
          ordenador.compilarCodigo();
          ordenador.conectarRed("RED_STUCOM");
          ordenador.sincronizarDatos();
    }

    void crearTablet() {
      print("---- Crear Tablet ----");
      var datos = crearDispositivoGenerico();
      if (datos == null) return;
      
      print("Sistema operativo: ");
       String sistemaOperativo = stdin.readLineSync()!;
        
        // Se crea la tablet
          Tablet tablet = Tablet(
          sistemaOperativo,
          datos["id"],
          datos["marca"],
          datos["modelo"],
          datos["anyo"],
        );

        // Se almacena en los mapas de dispositivos y tablets
        dispositivos[datos["id"]] = tablet;
        tablets[datos["id"]] = tablet;

        // Se realizan las funciones de la clase
        tablet.activarVibracion("SSN");
        tablet.conectarRed("RED_STUCOM");
        tablet.modoNoche();
    }

    void crearRelojInteligente() {
      print("---- Crear Reloj ----");

        var datos = crearDispositivoGenerico();
        if (datos == null) return;
        
        // Verifica el atributo de reloj inteligente
        print("¿Tiene GPS integrado? (s/n): ");
        String resp = stdin.readLineSync()!.toLowerCase();
        bool gpsIntegrado = resp == "s";

        // Se crea el reloj inteligente
          RelojInteligente relojInteligente = RelojInteligente(
          gpsIntegrado,
          datos["id"],
          datos["marca"],
          datos["modelo"],
          datos["anyo"],
        );

        // Se almacena en los mapas de dispositivos y los relojes
        dispositivos[datos["id"]] = relojInteligente;
        relojesInteligentes[datos["id"]] = relojInteligente;

        // Se realizan las funciones de la clase
        relojInteligente.activarVibracion("SSN");
        relojInteligente.conectarRed("RED_STUCOM");
        relojInteligente.mostrarNotificaciones();
    }

    void crearServidor() {
      print("---- Crear Servidor ----");

        // se pide los atributos de Dispositivo
        var datos = crearDispositivoGenerico();
        if (datos == null) return;

        // Se pide el atributo que le cree que es el espacio de
        // almacenamiento
        print("Almacenamiento (GB): ");
        double? almacenamiento = double.tryParse(stdin.readLineSync()!);
        if (almacenamiento == null) {
          print("Valor inválido.");
          return;
        }
        // Se crea el servidor
          Servidor servidor = Servidor(
          almacenamiento,
          datos["id"],
          datos["marca"],
          datos["modelo"],
          datos["anyo"],
        );

        // Se almacena en los mapas de dispositivos y los servidores
        dispositivos[datos["id"]] = servidor;
        servidores[datos["id"]] = servidor;

        // Se realizan las funciones de la clase
        servidor.actualizarLibrerias();
        servidor.conectarRed("RED_STUCOM");
        servidor.sincronizarDatos();
    }

    // Esta funcion se utiliza en todos las funciones de creación de Dispositivo
    // para recabar toda la entrada de la informacion que comparten todos los dispositivos
    // y retorna un mapa con una key que es el nombre del atributo y un dynamic para
    // poder retornar del tipo String e int.
    Map<String, dynamic>? crearDispositivoGenerico() {
      print("ID del dispositivo: ");
      int? id = int.tryParse(stdin.readLineSync() ?? "");

      if (id == null) {
        print("ID inválido.");
        return null;
      }

      if (dispositivos.containsKey(id)) {
        print("Ya existe un dispositivo con ese ID.");
        return null;
      }

      print("Marca: ");
      String marca = stdin.readLineSync() ?? "";

      print("Modelo: ");
      String modelo = stdin.readLineSync() ?? "";

      print("Año de fabricación: ");
      int? anyo = int.tryParse(stdin.readLineSync() ?? "");
      if (anyo == null) {
        print("Año inválido.");
        return null;
      }

      return {
        "id": id,
        "marca": marca,
        "modelo": modelo,
        "anyo": anyo,
      };
}


    // Se elimina del map de globals.dart de dispositivos y el propio
    void eliminarDispositivoMenu() {
      while(true){
        try {
          print("----Eliminar Dispositivo----");
          print("--Seleccione el ID del Dispositivo--");
          mostrarDispositivos();
          if (dispositivos.isEmpty) {
            break;
          }

          // si es una letra "a" o "A", que vuelva al menu
          print("A) Volver al menu");
          String opcion = stdin.readLineSync()!;
          if(opcion.toLowerCase() == "a"){
            print("Volviendo al menu..");
            break;
          }

          // Sino que escoja el indice
          int? num = int.tryParse(opcion);
          
          // Si lo encuentra que lo elimine de la lista general de dispositivos
          if (dispositivos.keys.contains(num)) {
            dispositivos.remove(num);
            // y la lista particular a la que pertenece
            if (ordenadores.containsKey(num)) {
              ordenadores.remove(num);
            }
            else if(tablets.containsKey(num)){
              tablets.remove(num);
            }
            else if(relojesInteligentes.containsKey(num)){
              relojesInteligentes.remove(num);
            }
            else if(servidores.containsKey(num)){
              servidores.remove(num);
            }
            print("Se ha eliminado correctamente el dispositivo. ");
            break;
          }
          else{
            print("Indice invalido. ");
          }

        } catch (e) {
          print("Opción invalida. ");
        }
      }
  }
  
  void modificarDispositivoMenu(){
      while(true){
        try {
          print("----Modificar Dispositivo----");
          print("--Seleccione el ID del Dispositivo--");
          mostrarDispositivos();
          if (dispositivos.isEmpty) {
            break;
          }

          // si es una letra "a" o "A", que vuelva al menu
          print("A) Volver al menu");
          String opcion = stdin.readLineSync()!;
          if(opcion.toLowerCase() == "a"){
            print("Volviendo al menu..");
            break;
          }

          // Sino que escoja el indice
          int? num = int.tryParse(opcion);

          if (num == null || !dispositivos.containsKey(num)) {
          print("ID no válido.");
          return;
  }

          Dispositivo dispositivo = dispositivos[num]!;

          // Que modifique los campos que comparten en Dispositivo
          print("Nueva marca (actual: ${dispositivo.marca}): ");
          String nuevaMarca = stdin.readLineSync()!;
          if (nuevaMarca.isNotEmpty) dispositivo.marca = nuevaMarca;

          print("Nuevo modelo (actual: ${dispositivo.modelo}): ");
          String nuevoModelo = stdin.readLineSync()!;
          if (nuevoModelo.isNotEmpty) dispositivo.modelo = nuevoModelo;

          print("Nuevo Año de fabricación:  (actual: ${dispositivo.anyoFabricacion}): ");
          int anyoFabricacion = int.parse(stdin.readLineSync()!);
          dispositivo.anyoFabricacion = anyoFabricacion;


          // Ahora que lo modifique dentro de su Map particular, y con sus atributos
          // particulares de cada clase
          if (ordenadores.containsKey(num)) {
              // Atributos generales
              ordenadores[num]?.marca = nuevaMarca;
              ordenadores[num]?.modelo = nuevoModelo;
              ordenadores[num]?.anyoFabricacion = anyoFabricacion;
              // Atributo particular
              print("Nuevo modelo de procesador (actual: ${ordenadores[num]!.modeloProcesador}): ");
              String nuevoProcesador = stdin.readLineSync()!;
              if (nuevoProcesador.isNotEmpty) ordenadores[num]!.modeloProcesador = nuevoProcesador;
            }
            else if(tablets.containsKey(num)){
              // Atributos generales
              tablets[num]?.marca = nuevaMarca;
              tablets[num]?.modelo = nuevoModelo;
              tablets[num]?.anyoFabricacion = anyoFabricacion;
              // Atributo particular
              print("Nuevo sistema operativo (actual: ${tablets[num]!.sistemaOperativo}): ");
              String nuevoSO = stdin.readLineSync()!;
              if (nuevoSO.isNotEmpty) tablets[num]!.sistemaOperativo = nuevoSO;
            }
            else if(relojesInteligentes.containsKey(num)){
              // Atributos generales
              relojesInteligentes[num]?.marca = nuevaMarca;
              relojesInteligentes[num]?.modelo = nuevoModelo;
              relojesInteligentes[num]?.anyoFabricacion = anyoFabricacion;
              // Atributo particular
              print("GPS integrado (actual: ${relojesInteligentes[num]!.gpsIntegrado ? "Tiene GPS" : "No Tiene GPS"}) (s/n): ");
              String resp = stdin.readLineSync()!.toLowerCase();
              if (resp == "s") relojesInteligentes[num]!.gpsIntegrado = true;
              if (resp == "n") relojesInteligentes[num]!.gpsIntegrado = false;
            }
            else if(servidores.containsKey(num)){
               // Atributos generales
              servidores[num]?.marca = nuevaMarca;
              servidores[num]?.modelo = nuevoModelo;
              servidores[num]?.anyoFabricacion = anyoFabricacion;
              // Atributo particular
              print("Nuevo almacenamiento en GB (actual: ${servidores[num]!.almacenamiento}): ");
              double? nuevoAlm = double.tryParse(stdin.readLineSync()!);
              if (nuevoAlm != null) servidores[num]!.almacenamiento = nuevoAlm;
            }
            print("Se ha modificado correctamente el dispositivo. ");
            break;

        } catch (e) {
          print("Opción invalida. ");
        }
      }
  }

  void mostrarDispositivos() {
    if(dispositivos.isEmpty){
      print("No hay dispositivos");
    }
    else{
      dispositivos.forEach((indice, dispositivo){
        print("Indice: $indice - Dispositivo: $dispositivo");
      });
  }
}
