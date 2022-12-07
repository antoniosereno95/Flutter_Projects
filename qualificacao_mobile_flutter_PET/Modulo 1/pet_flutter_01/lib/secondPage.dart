import 'package:flutter/material.dart';
import 'package:pet_flutter_01/pessoa.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.values});

  final List<Pessoa> values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: values.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text(values[index].nome+ ", "+ values[index].idade.toString()),
                  subtitle: Text("Peso: "+ values[index].peso.toString()+"  Altura: "+ values[index].altura.toString()),
                )
                );
          }),
    );
  }
}


