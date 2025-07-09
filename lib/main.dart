import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final MethodChannel _platform = MethodChannel('com.example.math');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operaciones Matemáticas',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter + Swift (MethodChannel)')),
        body: MathForm(platform: _platform),
      ),
    );
  }
}

class MathForm extends StatefulWidget {
  final MethodChannel platform;

  const MathForm({super.key, required this.platform});

  @override
  State<MathForm> createState() => _MathFormState();
}

class _MathFormState extends State<MathForm> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();

  String _sum = '';
  String _subtract = '';
  String _multiply = '';
  String _divide = '';
  String _error = '';

  Future<void> _calculate() async {
    final aText = _aController.text.trim();
    final bText = _bController.text.trim();

    if (aText.isEmpty || bText.isEmpty) {
      setState(() {
        _error = 'Por favor ingresa ambos números.';
      });
      return;
    }

    final double? a = double.tryParse(aText);
    final double? b = double.tryParse(bText);

    if (a == null || b == null) {
      setState(() {
        _error = 'Entrada inválida. Usa solo números.';
      });
      return;
    }

    try {
      final results = await Future.wait([
        widget.platform.invokeMethod('sum', {'a': a, 'b': b}),
        widget.platform.invokeMethod('subtract', {'a': a, 'b': b}),
        widget.platform.invokeMethod('multiply', {'a': a, 'b': b}),
        widget.platform.invokeMethod('divide', {'a': a, 'b': b}),
      ]);

      setState(() {
        _sum = results[0].toString();
        _subtract = results[1].toString();
        _multiply = results[2].toString();
        _divide = results[3].toString();
        _error = '';
      });
    } on PlatformException catch (e) {
      setState(() {
        _error = e.message ?? 'Error desconocido.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _aController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Número A'),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _bController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Número B'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _calculate, child: const Text('Calcular')),
          const SizedBox(height: 20),
          if (_error.isNotEmpty) ...[
            Text(_error, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 10),
          ],
          if (_sum.isNotEmpty) ...[
            Text('Suma: $_sum'),
            Text('Resta: $_subtract'),
            Text('Multiplicación: $_multiply'),
            Text('División: $_divide'),
          ],
        ],
      ),
    );
  }
}
