import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class SCR_Picker_Duration extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const SCR_Picker_Duration({super.key});

  @override
  State<SCR_Picker_Duration> createState() {
    return _SCR_Picker_DurationState();
  }
}

@NowaGenerated()
class _SCR_Picker_DurationState extends State<SCR_Picker_Duration> {
  int selectedSeconds = 1800;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlexSizedBox(
              width: 393.0,
              height: 394.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.shadow.withValues(alpha: 0.2),
                      blurRadius: 16.0,
                      offset: const Offset(0.0, -4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 12.0),
                        width: 40.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select Duration',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                          ),
                          const SizedBox(height: 24.0),
                          _DurationOption(
                            label: '15 Minutes',
                            seconds: 900,
                            isSelected: selectedSeconds == 900,
                            onTap: () {
                              setState(() {
                                selectedSeconds = 900;
                              });
                            },
                          ),
                          const SizedBox(height: 12.0),
                          _DurationOption(
                            label: '30 Minutes',
                            seconds: 1800,
                            isSelected: selectedSeconds == 1800,
                            onTap: () {
                              setState(() {
                                selectedSeconds = 1800;
                              });
                            },
                          ),
                          const SizedBox(height: 12.0),
                          _DurationOption(
                            label: '1 Hour',
                            seconds: 3600,
                            isSelected: selectedSeconds == 3600,
                            onTap: () {
                              setState(() {
                                selectedSeconds = 3600;
                              });
                            },
                          ),
                          const SizedBox(height: 12.0),
                          _DurationOption(
                            label: '2 Hours',
                            seconds: 7200,
                            isSelected: selectedSeconds == 7200,
                            onTap: () {
                              setState(() {
                                selectedSeconds = 7200;
                              });
                            },
                          ),
                          const SizedBox(height: 24.0),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context, null);
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context, -1);
                                  },
                                  child: const Text('No Limit'),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context, selectedSeconds);
                                  },
                                  child: const Text('Apply'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@NowaGenerated()
class _DurationOption extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const _DurationOption({
    required this.label,
    required this.seconds,
    required this.isSelected,
    this.onTap,
  });

  final String label;

  final int seconds;

  final bool isSelected;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.15)
              : Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(8.0),
          border: isSelected
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2.0,
                )
              : Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.outline.withValues(alpha: 0.3),
                ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
