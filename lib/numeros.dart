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
            content: Text("A quantidade de números a sortear excede o intervalo disponível."),
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
        List<int> range = List.generate(_maxRange - _minRange + 1, (i) => _minRange + i);
        range.shuffle(_random);
        _selectedNumbers.addAll(range.take(_numberOfNumbersToPick));
      });
    }
  }

  Widget _numberInputField(String label, ValueChanged<String> onChanged) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          onChanged: onChanged,
        ),
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
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
                  _numberInputField("Quantos números", (value) {
                    int? val = int.tryParse(value);
                    if (val != null) {
                      setState(() {
                        _numberOfNumbersToPick = val;
                      });
                    }
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: _pickRandomNumbers,
                child: Text('Sortear Números'),
              ),
            ),
            if (_selectedNumbers.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Divider(),
              ),
            if (_selectedNumbers.isNotEmpty)
              Text(
                'Números Sorteados:',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ..._selectedNumbers.map(
              (number) => Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListTile(
                  title: Text(number.toString(), style: TextStyle(fontSize: 24)),
                  tileColor: Colors.deepPurple[100],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
