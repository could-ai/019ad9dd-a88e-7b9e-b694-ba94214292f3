class Trade {
  final String id;
  final String pair;
  final String type; // BUY or SELL
  final double price;
  final double amount;
  final DateTime timestamp;
  final String status; // OPEN, CLOSED

  Trade({
    required this.id,
    required this.pair,
    required this.type,
    required this.price,
    required this.amount,
    required this.timestamp,
    required this.status,
  });
}
