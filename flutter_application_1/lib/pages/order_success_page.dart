import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F5),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDF6EE),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: const Icon(
                    Icons.check_circle_rounded,
                    color: Color(0xFF0C7233),
                    size: 74.0,
                  ),
                ),
                const SizedBox(height: 26.0),
                Text("Order Confirmed", style: AppWidget.HeadlineTextFeildStyle()),
                const SizedBox(height: 12.0),
                const Text(
                  "Your order has been placed successfully. You can track it from your all orders page.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 16.0, height: 1.5),
                ),
                const SizedBox(height: 32.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/all-orders", (route) => route.isFirst);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0C7233),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    child: const Text(
                      "View My Orders",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 14.0),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                  },
                  child: const Text(
                    "Back to Home",
                    style: TextStyle(
                      color: Color(0xFF0C7233),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
