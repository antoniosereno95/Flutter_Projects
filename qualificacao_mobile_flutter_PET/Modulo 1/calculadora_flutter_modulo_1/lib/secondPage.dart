
import 'package:flutter/material.dart';

import 'op.dart';


class secondPage4 extends StatelessWidget {
  const secondPage4({super.key , required this.values});
  
  final List<op> values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historico'),
      ),
      body: ListView.builder(
        itemCount: values.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                title: Text(values[index].operacao),
                subtitle: Text(values[index].resultado),
              ));
        },
      ),
    );
  }
}