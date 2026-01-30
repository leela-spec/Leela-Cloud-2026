import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/models/scope_selection_result.dart';

@NowaGenerated()
class SCR_Picker_Scope extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const SCR_Picker_Scope({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Scope')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Scope Picker (Placeholder)',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    const ScopeSelectionResult(
                      id: 'scope_1',
                      epicIds: const ['epic_1', 'epic_2'],
                      blockIds: const ['block_1'],
                      label: 'Selected Epics',
                    ),
                  );
                },
                child: const Text('Select Sample Scope'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, null);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
