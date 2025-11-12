import 'dispositivo.dart';
import 'ordenador.dart';
import 'tablet.dart';
import 'servidor.dart';
import 'reloj_inteligente.dart';

// Mapas que simulan una base de datos, para la persistencia de los datos.

// Se crea una general de dispositivos con todos los dispositivos.
Map<int, Dispositivo> dispositivos = {};

// Y las otras con el tipo especifico para que se guarden las caracteristicas
// propias de sus clases.
Map<int, Ordenador> ordenadores = {};
Map<int, Tablet> tablets = {};
Map<int, Servidor> servidores = {};
Map<int, RelojInteligente> relojesInteligentes = {};