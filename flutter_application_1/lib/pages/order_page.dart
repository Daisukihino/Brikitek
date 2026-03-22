import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/order_success_page.dart';
import 'package:flutter_application_1/pages/payment_method_page.dart';
import 'package:flutter_application_1/service/cart_service.dart';
import 'package:flutter_application_1/service/order_history_service.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<CartItem> items = [];
  String selectedPaymentMethod = "Upang Wallet";

  @override
  void initState() {
    super.initState();
    _refreshCart();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isWide = width >= 720;
    const Color primary = Color(0xFF0C7233);
    final double subtotal = items.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
    final double deliveryFee = items.isEmpty ? 0 : 20;
    final double discount = items.isEmpty ? 0 : 15;
    final double total = subtotal + deliveryFee - discount;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760.0),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _roundButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () => Navigator.pop(context),
                  ),
                  Text("Your Order", style: AppWidget.boldTextFeildStyle()),
                  _roundButton(icon: Icons.receipt_long_rounded, onTap: () {}),
                ],
              ),
              const SizedBox(height: 24.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0C7233), Color(0xFF4FA05B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Wrap(
                  spacing: 12.0,
                  runSpacing: 12.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SizedBox(
                      width: isWide ? 480.0 : width - 76.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Delivery in 18-25 min",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "Your food is being prepared fresh and will arrive warm at your doorstep.",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14.0,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "images/delivery-man.png",
                      height: isWide ? 130.0 : 110.0,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              Text("Items", style: AppWidget.boldTextFeildStyle()),
              const SizedBox(height: 14.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  icon: const Icon(
                    Icons.add_circle_outline_rounded,
                    color: Color(0xFF0C7233),
                  ),
                  label: const Text(
                    "Order More",
                    style: TextStyle(
                      color: Color(0xFF0C7233),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              if (items.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: const Text(
                    "No items left in your order. Add something tasty from the home page.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 15.0, height: 1.5),
                  ),
                )
              else
                ...items.asMap().entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: _OrderItemCard(
                      image: entry.value.image,
                      title: entry.value.name,
                      subtitle: entry.value.subtitle,
                      price: entry.value.price.toStringAsFixed(2),
                      quantity: entry.value.quantity,
                      compact: width < 400,
                      onRemove: () {
                        setState(() {
                          CartService.instance.removeAt(entry.key);
                          _refreshCart();
                        });
                      },
                    ),
                  ),
                ),
              const SizedBox(height: 24.0),
              Text("Delivery Address", style: AppWidget.boldTextFeildStyle()),
              const SizedBox(height: 12.0),
              _infoCard(
                child: Wrap(
                  spacing: 12.0,
                  runSpacing: 8.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined, color: primary, size: 28.0),
                    SizedBox(
                      width: isWide ? 480.0 : width - 120.0,
                      child: const Text(
                        "Block 7, San Vicente Road, Tarlac City\nNear Upang Campus Gate 2",
                        style: TextStyle(color: Colors.black87, fontSize: 15.0, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18.0),
              Text("Payment Method", style: AppWidget.boldTextFeildStyle()),
              const SizedBox(height: 12.0),
              GestureDetector(
                onTap: items.isEmpty
                    ? null
                    : () async {
                        final String? method = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentMethodPage(
                              selectedMethod: selectedPaymentMethod,
                              total: total,
                            ),
                          ),
                        );

                        if (method != null) {
                          setState(() {
                            selectedPaymentMethod = method;
                          });
                        }
                      },
                child: _infoCard(
                  child: Wrap(
                    spacing: 12.0,
                    runSpacing: 8.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.account_balance_wallet_outlined, color: primary, size: 28.0),
                      SizedBox(
                        width: isWide ? 420.0 : width - 140.0,
                        child: Text(
                          selectedPaymentMethod,
                          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Text(
                        "Change",
                        style: TextStyle(
                          color: primary,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28.0),
                ),
                child: Column(
                  children: [
                    _SummaryRow(label: "Subtotal", value: "PHP ${subtotal.toStringAsFixed(2)}"),
                    const SizedBox(height: 12.0),
                    _SummaryRow(label: "Delivery Fee", value: "PHP ${deliveryFee.toStringAsFixed(2)}"),
                    const SizedBox(height: 12.0),
                    _SummaryRow(label: "Discount", value: "- PHP ${discount.toStringAsFixed(2)}"),
                    const Divider(height: 30.0),
                    _SummaryRow(
                      label: "Total Payment",
                      value: "PHP ${total.toStringAsFixed(2)}",
                      isBold: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: items.isEmpty
                      ? null
                      : () async {
                          final String? method = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentMethodPage(
                                selectedMethod: selectedPaymentMethod,
                                total: total,
                              ),
                            ),
                          );

                          if (method != null) {
                            selectedPaymentMethod = method;
                          }

                          if (!mounted) return;

                          OrderHistoryService.instance.addOrder(
                            cartItems: List<CartItem>.from(items),
                            total: total,
                          );

                          CartService.instance.clear();
                          _refreshCart();

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderSuccessPage(),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  child: const Text(
                    "Place Order",
                    style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _roundButton({required IconData icon, required VoidCallback onTap}) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.0),
        child: SizedBox(
          width: 46.0,
          height: 46.0,
          child: Icon(icon, color: Colors.black87),
        ),
      ),
    );
  }

  Widget _infoCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: child,
    );
  }

  void _refreshCart() {
    items = CartService.instance.items.toList();
  }
}

class _OrderItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final int quantity;
  final VoidCallback onRemove;
  final bool compact;

  const _OrderItemCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
    required this.onRemove,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Wrap(
        spacing: 14.0,
        runSpacing: 12.0,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            width: compact ? 72.0 : 82.0,
            height: compact ? 72.0 : 82.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F5F2),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),
          SizedBox(
            width: compact ? 150.0 : 180.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: compact ? 16.0 : 18.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6.0),
                Text(subtitle, style: const TextStyle(color: Colors.black54), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 10.0),
                Text(
                  "PHP $price",
                  style: const TextStyle(
                    color: Color(0xFF0C7233),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDF6EE),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  "x$quantity",
                  style: const TextStyle(
                    color: Color(0xFF0C7233),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: onRemove,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF2F0),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: const Text(
                    "Remove",
                    style: TextStyle(
                      color: Color(0xFFC0392B),
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      fontSize: isBold ? 18.0 : 15.0,
      fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
      color: Colors.black87,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: style),
      ],
    );
  }
}
