import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorteador App',
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define a cor primária do tema
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,  // Remove a faixa de debug da interface
    );
  }
}
