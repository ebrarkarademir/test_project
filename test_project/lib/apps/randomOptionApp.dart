import 'dart:math';
import 'package:flutter/material.dart';

class RandomOptionApp extends StatefulWidget {
  @override
  _RandomOptionAppState createState() => _RandomOptionAppState();
}

class _RandomOptionAppState extends State<RandomOptionApp> {
  final TextEditingController _optionController = TextEditingController();
  List<String> _options = [];
  String _selectedOption = '';

  void _addOption() {
    setState(() {
      _options.add(_optionController.text);
      _optionController.clear();
    });
  }

  void _pickRandomOption() {
    if (_options.isNotEmpty) {
      final random = Random();
      final index = random.nextInt(_options.length);
      setState(() {
        _selectedOption = _options[index];
      });
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Selected Option"),
              content: Text(_selectedOption),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Option App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ..._options.map((option) => Text(option)).toList(),
            TextField(
              controller: _optionController,
              decoration: InputDecoration(
                hintText: 'Enter an option',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _addOption,
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: _pickRandomOption,
                  child: Text('Pick Random'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
