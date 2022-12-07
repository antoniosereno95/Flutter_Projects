class Pessoa {
  String nome;
  int idade;
  double peso;
  double altura;
  
  Pessoa({required this.nome, required this.idade, required this.peso, required this.altura});

  double calculaIMC() {
    return (this.peso /
        (this.altura * this.altura));
  }

  String situacaoIMC() {
    double imc = calculaIMC();
    String situacao;
    if (imc > 20) {
      situacao = "Peso normal";
    } else {
      situacao = "Acima do peso";
    }

    return situacao;
  }

}
