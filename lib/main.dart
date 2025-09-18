import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '';
  String result = '';

  void onButtonClick(String value) {
    setState(() {
      if (value == '=') {
        try {
          result = (double.parse(display)).toString();
        } catch (e) {
          result = "Error";
        }
      } else if (value == 'C') {
        display = '';
        result = '';
      } else {
        display += value;
      }
    });
  }

  Widget buildButton(String text) {
    return ElevatedButton(
      onPressed: () => onButtonClick(text),
      child: Text(text, style: const TextStyle(fontSize: 24)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(display, style: const TextStyle(fontSize: 32)),
          Text(result, style: const TextStyle(fontSize: 28, color: Colors.grey)),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var b in ['1','2','3','+','4','5','6','-','7','8','9','*','0','=','C','/'])
                buildButton(b),
            ],
          ),
        ],
      ),
    );
  }
}
