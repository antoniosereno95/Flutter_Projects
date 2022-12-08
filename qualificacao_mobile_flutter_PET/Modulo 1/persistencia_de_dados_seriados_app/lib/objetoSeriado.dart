/*
.
.
.
*/

class objetoSeriado {
  String nomeSeriado;
  String nomeServicodeStreaming;
  int? id;

  objetoSeriado(
      {this.id,
      required this.nomeSeriado,
      required this.nomeServicodeStreaming});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nomeSeriado': nomeSeriado,
      'nomeServicodeStreaming': nomeServicodeStreaming
    };
  }
}
