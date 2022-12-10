/*
.
.
.
.
.
*/
import 'dart:ffi';

class GastoOb {
  GastoOb(
      {this.id, required this.categoria, required this.valor, required this.descricao});

  int? id;
  String categoria;
  double valor;
  String descricao;

  Map<String, Object?> toMap() {
    return {'categoria': categoria, 'valor': valor, 'descricao': descricao};
  }
}
