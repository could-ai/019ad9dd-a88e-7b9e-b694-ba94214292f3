import 'package:flutter/material.dart';
import '../models/trade.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data
    final List<Trade> trades = [
      Trade(
        id: '1',
        pair: 'BTC/USDT',
        type: 'SELL',
        price: 64500.00,
        amount: 0.05,
        timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
        status: 'CLOSED',
      ),
      Trade(
        id: '2',
        pair: 'ETH/USDT',
        type: 'BUY',
        price: 3420.00,
        amount: 1.5,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        status: 'CLOSED',
      ),
      Trade(
        id: '3',
        pair: 'SOL/USDT',
        type: 'BUY',
        price: 142.50,
        amount: 10.0,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        status: 'CLOSED',
      ),
      Trade(
        id: '4',
        pair: 'BTC/USDT',
        type: 'BUY',
        price: 63800.00,
        amount: 0.05,
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 4)),
        status: 'CLOSED',
      ),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: trades.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final trade = trades[index];
        final isBuy = trade.type == 'BUY';
        
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: isBuy ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
            child: Icon(
              isBuy ? Icons.arrow_downward : Icons.arrow_upward,
              color: isBuy ? Colors.green : Colors.red,
            ),
          ),
          title: Text(
            trade.pair,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            DateFormat('MMM dd, HH:mm').format(trade.timestamp),
            style: TextStyle(color: Colors.grey[600]),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isBuy ? "+" : "-"}${trade.amount} ${trade.pair.split('/')[0]}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isBuy ? Colors.green : Colors.red,
                ),
              ),
              Text(
                '@ ${trade.price}',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}
