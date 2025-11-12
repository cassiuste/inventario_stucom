class Dispositivo {

  int id;
  String marca;
  String modelo;
  int anyoFabricacion;

  Dispositivo(this.id, this.marca, this.modelo, this.anyoFabricacion);

  @override
  String toString() {
    return "Id: $id - Marca: $marca - Modelo: $modelo - Fabricacion: ($anyoFabricacion)";
  }
}