import 'package:flutter/material.dart';
import 'nomes.dart';
import 'numeros.dart';
import 'youtube.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicativo de Sorteios'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(color: Colors.deepPurple[400],
            boxShadow:[BoxShadow(color: Colors.grey, offset: Offset(-12, 8), blurRadius: 10, spreadRadius: 8),],
            borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Icon(Icons.abc),
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NamePickerPage()),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            textStyle: TextStyle(fontSize: 22),
                            elevation:
                                8, // Aumentando a elevação para uma sombra mais perceptível
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Borda arredondada
                            ), // Cor de fundo mais destacada
                          ),
                          child: Text(
                            'Sorteador de Nomes',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15, left: 5),
                            child: Icon(Icons.numbers),
                          ),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NumberPickerPage()),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              textStyle: TextStyle(fontSize: 22),
                              elevation:
                                  8, // Aumentando a elevação para uma sombra mais perceptível
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(30), // Borda arredondada
                              ),
                            ),
                            child: Text(
                              'Sorteador de Números',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Icon(Icons.video_camera_back),
                          ),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => YoutubeRedirectPage()),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              textStyle: TextStyle(fontSize: 22),
                              elevation:
                                  8, // Aumentando a elevação para uma sombra mais perceptível
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Borda arredondada
                              ),
                            ),
                            child: Text(
                              'Vídeo no YouTube',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
