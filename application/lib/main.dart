import 'package:application/counter.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final CounterState _counterState = CounterState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("The Value Of Counter Is ${_counterState.counter}"),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         setState(() {
            _counterState.increment();
         });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
