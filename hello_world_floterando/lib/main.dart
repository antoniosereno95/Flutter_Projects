import 'package:flutter/material.dart';

import 'myApp.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

//Esse [e o codigo sem o scafold, onde utilizei somente POO e o MaterialApp
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   //essa classe [e onde fica todas as coisas do app
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomeWidget(),
//     );
//   }
// }

// class HomeWidget extends StatelessWidget {
//   const HomeWidget({super.key});

//   //essa classe era uma propriedade do MAterialApp e criamos uma classe propria para utilizar o principio da modularizacao ou componentizacao.
//   @override
//   Widget build(BuildContext context) {
//     return const Material(
//         child: Center(
//           child: Text("Meu Primeiro App com o Curso Flutterando")
//           )
//           );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   //essa classe [e onde fica todas as coisas do app
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   //essa classe era uma propriedade do MAterialApp e criamos uma classe propria para utilizar o principio da modularizacao ou componentizacao.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Home")),
//       body:
//           const Center(child: Text("Meu Primeiro App com o Curso Flutterando")),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.ac_unit_sharp),
//         onPressed: () {
//           print('clicou');
//         },
//       ),
//     );
//   }
// }
