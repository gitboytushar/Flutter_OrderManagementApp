class Order {
  final String orderId;
  final String username;
  final Map<String, String> items; // Key: item name, Value: quantity

  Order({
    required this.orderId,
    required this.username,
    required this.items,
  });
}