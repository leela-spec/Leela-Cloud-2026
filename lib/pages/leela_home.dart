import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

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
          children: [
            Positioned(
              top: 129.0,
              left: 96.0,
              width: 115.0,
              height: 88.0,
              child: Container(
                decoration: const BoxDecoration(color: Color(0xffbe03be)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
