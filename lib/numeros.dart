import 'dart:math';

import 'package:flutter/material.dart';

class NumberPickerPage extends StatefulWidget {
  @override
  _NumberPickerPageState createState() => _NumberPickerPageState();
}

class _NumberPickerPageState extends State<NumberPickerPage> {
  final _random = Random();
  List<int> _selectedNumbers = [];
  int _minRange = 1; // Valor inicial para o mínimo
  int _maxRange = 100; // Valor inicial para o máximo
  int _numberOfNumbersToPick = 1; // Quantos números sortear

  void _pickRandomNumbers() {
    if (_numberOfNumbersToPick > (_maxRange - _minRange + 1)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Erro"),
            content: Text(
                "A quantidade de números a sortear excede o intervalo disponível."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      _selectedNumbers.clear();
    } else {
      setState(() {
        _selectedNumbers.clear();
        List<int> range =
            List.generate(_maxRange - _minRange + 1, (i) => _minRange + i);
        range.shuffle(_random);
        _selectedNumbers.addAll(range.take(_numberOfNumbersToPick));
      });
    }
  }

Widget _numberInputField(String label, ValueChanged<String> onChanged) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, 
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( 
              label,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(width: 10), 
            Container(
              width: 50,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sorteador de Números'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(400, 20, 400, 20),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:[BoxShadow(color: Colors.grey, offset: Offset(-4, 8), blurRadius: 10, spreadRadius: 5),],
                ),
                child: Column(
                  children: [
                    _numberInputField("Mínimo", (value) {
                      int? val = int.tryParse(value);
                      if (val != null) {
                        setState(() {
                          _minRange = val;
                        });
                      }
                    }),
                    _numberInputField("Máximo", (value) {
                      int? val = int.tryParse(value);
                      if (val != null) {
                        setState(() {
                          _maxRange = val;
                        });
                      }
                    }),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:[BoxShadow(color: Colors.grey, offset: Offset(-4, 8), blurRadius: 10, spreadRadius: 5),],
                ),
                child: _numberInputField("Quantos números", (value) {
                  int? val = int.tryParse(value);
                  if (val != null) {
                    setState(() {
                      _numberOfNumbersToPick = val;
                    });
                  }
                }),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: _pickRandomNumbers,
                  child: Text(
                    'Sortear Números',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  )),
              if (_selectedNumbers.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Divider(),
                ),
              if (_selectedNumbers.isNotEmpty)
                Text(
                  'Números Sorteados:',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              if (_selectedNumbers.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple[100],
                  ),
                  child: Text(
                    _selectedNumbers.join(', '),
                    style: TextStyle(fontSize: 24),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
