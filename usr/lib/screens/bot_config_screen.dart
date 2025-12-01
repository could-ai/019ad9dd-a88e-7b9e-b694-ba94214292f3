import 'package:flutter/material.dart';

class BotConfigScreen extends StatefulWidget {
  const BotConfigScreen({super.key});

  @override
  State<BotConfigScreen> createState() => _BotConfigScreenState();
}

class _BotConfigScreenState extends State<BotConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildStrategyCard(
          context,
          'Grid Trading Bot',
          'Profits from volatility by placing buy/sell orders at predefined intervals.',
          true,
        ),
        const SizedBox(height: 16),
        _buildStrategyCard(
          context,
          'DCA Bot',
          'Dollar Cost Averaging strategy to accumulate assets over time.',
          true,
        ),
        const SizedBox(height: 16),
        _buildStrategyCard(
          context,
          'Arbitrage Bot',
          'Exploits price differences between exchanges.',
          false,
        ),
        const SizedBox(height: 16),
        _buildStrategyCard(
          context,
          'AI Trend Follower',
          'Uses machine learning to predict and follow market trends.',
          false,
        ),
      ],
    );
  }

  Widget _buildStrategyCard(BuildContext context, String title, String description, bool isEnabled) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Switch(
                  value: isEnabled,
                  onChanged: (value) {
                    // TODO: Implement toggle logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${value ? "Starting" : "Stopping"} $title...')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Navigate to configuration
                  },
                  icon: const Icon(Icons.settings, size: 18),
                  label: const Text('Configure'),
                ),
                const SizedBox(width: 12),
                if (isEnabled)
                  Chip(
                    label: const Text('Active', style: TextStyle(color: Colors.white, fontSize: 12)),
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
