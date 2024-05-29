import 'dart:math';

import 'package:flutter/material.dart';

class NamePickerPage extends StatefulWidget {
  @override
  _NamePickerPageState createState() => _NamePickerPageState();
}

class _NamePickerPageState extends State<NamePickerPage> {
  final List<String> _names = [];
  final List<String> _selectedNames = [];
  final _controller = TextEditingController();
  final _numberController = TextEditingController();
  int _numberOfNamesToPick = 1;

  void _addName() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _names.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _pickRandomNames() {
    setState(() {
      _selectedNames.clear();
      final random = Random();
      List<String> tempNames = List.from(_names);
      for (int i = 0; i < _numberOfNamesToPick && tempNames.isNotEmpty; i++) {
        final index = random.nextInt(tempNames.length);
        _selectedNames.add(tempNames[index]);
        tempNames.removeAt(index); // Avoid picking the same name twice
      }
    });
  }

  void _updateNumberOfNamesToPick(String value) {
    int? val = int.tryParse(value);
    if (val != null && val > 0 && val <= _names.length) {
      setState(() {
        _numberOfNamesToPick = val;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sorteador de Nomes'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              style:
                  TextStyle(color: Colors.black), // Cor do texto do TextField
              decoration: InputDecoration(
                labelText: 'Adicione um nome',
                labelStyle:
                    TextStyle(color: Colors.black), // Cor do texto do labelText
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue.shade900), // Cor da borda do TextField
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addName,
                  color: Colors.black, // Cor do ícone do TextField
                ),
              ),
              onSubmitted: (_) => _addName(),
            ),
            SizedBox(height: 20),
            if (_names
                .isNotEmpty) 
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 142, 100,
                      214), 
                ),
                child: Column(
                  children: [
                    Text(
                      'Quantos nomes sortear:',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    TextField(
                      controller: _numberController,
                      style: TextStyle(
                          color: Colors.black), // Cor do texto do TextField
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Número de nomes',
                        labelStyle: TextStyle(
                            color: Colors.black), // Cor do texto do labelText
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black), // Cor da borda do TextField
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: _updateNumberOfNamesToPick,
                    ),
                  ],
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _names.isNotEmpty ? _pickRandomNames : null,
              child: Text(
                'Sortear Nome(s)',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Cor do fundo do botão
              ),
            ),
            if (_names.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Divider(),
                    Text(
                      'Todos os Nomes Adicionados:',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple,
                      ),
                      child: Text(
                        _names.join(', '),
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            if (_selectedNames.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Divider(),
                    Text(
                      'Nome(s) Sorteados:',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple[400],
                      ),
                      child: Text(
                        _selectedNames.join(', '),
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
