import 'package:flutter_application_1/service/cart_service.dart';

class OrderHistoryItem {
  final String image;
  final String title;
  final String detail;
  final String price;
  final String status;
  final String deliveryLocation;

  OrderHistoryItem({
    required this.image,
    required this.title,
    required this.detail,
    required this.price,
    required this.status,
    required this.deliveryLocation,
  });
}

class OrderHistoryService {
  OrderHistoryService._();

  static final OrderHistoryService instance = OrderHistoryService._();

  final List<OrderHistoryItem> _orders = [];

  List<OrderHistoryItem> get orders => List.unmodifiable(_orders);

  void addOrder({
    required List<CartItem> cartItems,
    required double total,
    required String deliveryLocation,
  }) {
    final String summaryTitle = cartItems.length == 1
        ? cartItems.first.name
        : "${cartItems.first.name} + ${cartItems.length - 1} more";

    final String summaryDetail = cartItems
        .map((item) => "${item.quantity}x ${item.name}")
        .join(", ");

    _orders.insert(
      0,
      OrderHistoryItem(
        image: cartItems.first.image,
        title: summaryTitle,
        detail: summaryDetail,
        price: "PHP ${total.toStringAsFixed(2)}",
        status: "Preparing",
        deliveryLocation: deliveryLocation,
      ),
    );
  }
}
