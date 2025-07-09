import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final platform = MethodChannel('com.example.math');

  Future<double> _callNative(String method, double a, double b) async {
    try {
      final result = await platform.invokeMethod(method, {'a': a, 'b': b});
      return result.toDouble();
    } on PlatformException catch (e) {
      print("Error: '${e.message}'.");
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double a = 8, b = 4;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Operaciones Básicas')),
        body: FutureBuilder(
          future: Future.wait([
            _callNative('sum', a, b),
            _callNative('subtract', a, b),
            _callNative('multiply', a, b),
            _callNative('divide', a, b),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            final results = snapshot.data as List<double>;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Suma: ${results[0]}"),
                  Text("Resta: ${results[1]}"),
                  Text("Multiplicación: ${results[2]}"),
                  Text("División: ${results[3]}"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
