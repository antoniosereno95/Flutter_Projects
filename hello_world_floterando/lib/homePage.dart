import 'package:flutter/material.dart';

/*
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //essa classe era uma propriedade do MAterialApp e criamos uma classe propria para utilizar o principio da modularizacao ou componentizacao.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Click Click Game"),
        backgroundColor: Colors.lightGreen
        ),
    
      body:
          const Center(child: 
          Text("contador: 0")
          ),
          backgroundColor: Colors.blueGrey,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('clicou');
        },
        backgroundColor: Colors.lightGreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return 0;
  }
}


