import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class WalletTransactionsPage extends StatelessWidget {
  const WalletTransactionsPage({super.key});

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
                  Text("Transactions", style: AppWidget.boldTextFeildStyle()),
                  _roundButton(icon: Icons.tune_rounded, onTap: () {}),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF163F20), Color(0xFF0C7233)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "This Month",
                      style: TextStyle(color: Colors.white70, fontSize: 14.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "PHP 1,249.96",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "3 top-ups and 6 order payments recorded.",
                      style: TextStyle(color: Colors.white70, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18.0),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
                children: const [
                  _TransactionTile(
                    title: "Top Up Successful",
                    subtitle: "Today, 09:40 AM",
                    amount: "+ PHP 500.00",
                    status: "Completed",
                    positive: true,
                  ),
                  SizedBox(height: 12.0),
                  _TransactionTile(
                    title: "Order Payment",
                    subtitle: "Today, 07:18 PM",
                    amount: "- PHP 184.97",
                    status: "Paid",
                    positive: false,
                  ),
                  SizedBox(height: 12.0),
                  _TransactionTile(
                    title: "Cashback Reward",
                    subtitle: "Yesterday, 01:22 PM",
                    amount: "+ PHP 35.00",
                    status: "Received",
                    positive: true,
                  ),
                  SizedBox(height: 12.0),
                  _TransactionTile(
                    title: "Order Payment",
                    subtitle: "Mar 20, 01:10 PM",
                    amount: "- PHP 129.99",
                    status: "Paid",
                    positive: false,
                  ),
                  SizedBox(height: 12.0),
                  _TransactionTile(
                    title: "Top Up Successful",
                    subtitle: "Mar 18, 10:05 AM",
                    amount: "+ PHP 300.00",
                    status: "Completed",
                    positive: true,
                  ),
                  SizedBox(height: 12.0),
                  _TransactionTile(
                    title: "Refund Processed",
                    subtitle: "Mar 15, 05:42 PM",
                    amount: "+ PHP 59.99",
                    status: "Refunded",
                    positive: true,
                  ),
                ],
              ),
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

class _TransactionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String status;
  final bool positive;

  const _TransactionTile({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.status,
    required this.positive,
  });

  @override
  Widget build(BuildContext context) {
    final Color accent = positive ? const Color(0xFF0C7233) : const Color(0xFFD35400);

    return Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Row(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Icon(
              positive ? Icons.south_west_rounded : Icons.north_east_rounded,
              color: accent,
            ),
          ),
          const SizedBox(width: 14.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4.0),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: accent, fontWeight: FontWeight.bold, fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(color: accent, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
