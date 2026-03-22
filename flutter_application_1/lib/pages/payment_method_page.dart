import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class PaymentMethodPage extends StatefulWidget {
  final String selectedMethod;
  final double total;

  const PaymentMethodPage({
    super.key,
    required this.selectedMethod,
    required this.total,
  });

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  late String selectedMethod;

  @override
  void initState() {
    super.initState();
    selectedMethod = widget.selectedMethod;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F5),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _roundButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () => Navigator.pop(context),
                  ),
                  Text("Payment Method", style: AppWidget.boldTextFeildStyle()),
                  _roundButton(icon: Icons.payments_outlined, onTap: () {}),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
                children: [
                  _paymentTile(
                    title: "Upang Wallet",
                    subtitle: "Balance: PHP 850.00",
                    icon: Icons.account_balance_wallet_outlined,
                    color: const Color(0xFF0C7233),
                  ),
                  const SizedBox(height: 12.0),
                  _paymentTile(
                    title: "Cash on Delivery",
                    subtitle: "Pay once your food arrives",
                    icon: Icons.money_rounded,
                    color: const Color(0xFFCC8B00),
                  ),
                  const SizedBox(height: 12.0),
                  _paymentTile(
                    title: "Visa Card",
                    subtitle: "**** **** **** 2034",
                    icon: Icons.credit_card_outlined,
                    color: const Color(0xFF1F5EFF),
                  ),
                  const SizedBox(height: 24.0),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Payment Summary", style: AppWidget.boldTextFeildStyle()),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Chosen Method", style: TextStyle(color: Colors.black54)),
                            Text(
                              selectedMethod,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Total", style: TextStyle(color: Colors.black54)),
                            Text(
                              "PHP ${widget.total.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0C7233),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, selectedMethod);
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
                    "Confirm Payment Method",
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    final bool isSelected = selectedMethod == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.0),
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 52.0,
              height: 52.0,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 14.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4.0),
                  Text(subtitle, style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
              color: color,
            ),
          ],
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
}
