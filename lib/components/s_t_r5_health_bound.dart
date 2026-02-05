import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/w_g_t_s_t_epic_gauge.dart';
import 'package:leela_cloud_2026/components/w_g_t_s_t_t_p_balance.dart';

@NowaGenerated()
class ST_R5HealthBound extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const ST_R5HealthBound({
    super.key,
    required this.epicDiversification,
    required this.tpBalance,
  });

  final Map<String, dynamic> epicDiversification;

  final Map<String, dynamic> tpBalance;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Health',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: WGT_ST_EpicGauge(
                        score_0_1: epicDiversification['score_0_1'] ?? 0,
                        status: epicDiversification['status'] ?? 'ok',
                        label_short: epicDiversification['label_short'] ?? '',
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: WGT_ST_TPBalance(
                        tp_balance: tpBalance['tp_balance'] ?? 0,
                        tp_status: tpBalance['tp_status'] ?? 'ok',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
