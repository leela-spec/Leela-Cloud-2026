import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/chunk_isometric_button.dart';
import 'package:leela_cloud_2026/cube_size.dart';

@NowaGenerated()
class LabPlayground extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const LabPlayground({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab Playground'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: ChunkIsometricButton(
          icon: Icons.science,
          outlineColor: Theme.of(context).colorScheme.primary,
          size: CubeSize.large,
          onTap: () {
            print('Isometric button tapped!');
          },
        ),
      ),
    );
  }
}
