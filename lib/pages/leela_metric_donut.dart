import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/custom_widgets/leela_metric_donut.dart';

@NowaGenerated()
class TestDonutNewAlexv2 extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const TestDonutNewAlexv2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: const Alignment(0.0, 0.0),
          children: [
            const Positioned(
              top: 76.0,
              left: 0.0,
              width: 400.0,
              height: 400.0,
              child: LeelaMetricDonut(),
            ),
          ],
        ),
      ),
    );
  }
}
