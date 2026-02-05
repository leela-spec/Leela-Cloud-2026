import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/pages/lab_playground.dart';

@NowaGenerated()
class LeelaHome extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const LeelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: const Alignment(0.0, 0.0),
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LabPlayground()),
          );
        },
        tooltip: 'Lab Playground',
        child: const Icon(Icons.science),
      ),
    );
  }
}
