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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sorteador de Nomes'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Adicione um nome',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _addName,
                  ),
                ),
                onSubmitted: (_) => _addName(),
              ),
            ),
            if (_names.isNotEmpty) // Show the slider only if there are names
              Column(
                children: [
                  Text(
                    'Selecione quantos nomes sortear:',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.deepPurple[700],
                      inactiveTrackColor: Colors.deepPurple[100],
                      trackHeight: 4.0,
                      thumbColor: Colors.deepPurple,
                      overlayColor: Colors.deepPurple.withAlpha(32),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.deepPurple[700],
                      inactiveTickMarkColor: Colors.deepPurple[100],
                    ),
                    child: Slider(
                      value: _numberOfNamesToPick.toDouble(),
                      min: 1,
                      max: _names.length.toDouble(),
                      divisions: _names.length,
                      label: _numberOfNamesToPick.toString(),
                      onChanged: (double value) {
                        setState(() {
                          _numberOfNamesToPick = value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: _names.isNotEmpty ? _pickRandomNames : null,
                child: Text('Sortear Nome(s)'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(),
            ),
            Text('Todos os Nomes Adicionados:',
                style: TextStyle(fontSize: 18, color: Colors.grey[700])),
            ListView.builder(
              shrinkWrap: true, // Important to prevent infinite height error
              itemCount: _names.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ListTile(
                    title: Text(_names[index]),
                    tileColor: Colors.deepPurple[50],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(),
            ),
            Text('Nome(s) Sorteados:',
                style: TextStyle(fontSize: 18, color: Colors.grey[700])),
            ..._selectedNames.map(
              (name) => Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListTile(
                  title: Text(name, style: TextStyle(fontSize: 24)),
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
