import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
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
                  Text("Wallet", style: AppWidget.boldTextFeildStyle()),
                  _roundButton(icon: Icons.more_horiz_rounded, onTap: () {}),
                ],
              ),
              const SizedBox(height: 24.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF163F20), Color(0xFF0C7233)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Upang Wallet Balance",
                          style: TextStyle(color: Colors.white70, fontSize: 15.0),
                        ),
                        Image.asset("images/wallet.png", height: 48.0, fit: BoxFit.contain),
                      ],
                    ),
                    const SizedBox(height: 18.0),
                    const Text(
                      "PHP 850.00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      "Available for food orders and delivery charges.",
                      style: TextStyle(color: Colors.white70, fontSize: 14.0),
                    ),
                    const SizedBox(height: 22.0),
                    Row(
                      children: const [
                        Expanded(child: _WalletAction(label: "Top Up", icon: Icons.add_rounded)),
                        SizedBox(width: 12.0),
                        Expanded(child: _WalletAction(label: "Transfer", icon: Icons.swap_horiz_rounded)),
                        SizedBox(width: 12.0),
                        Expanded(child: _WalletAction(label: "Pay", icon: Icons.qr_code_scanner_rounded)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/wallet-transactions"),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDF6EE),
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.receipt_long_rounded, color: Color(0xFF0C7233)),
                      SizedBox(width: 12.0),
                      Expanded(
                        child: Text(
                          "View All Transactions",
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, size: 16.0, color: Color(0xFF0C7233)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Text("Payment Methods", style: AppWidget.boldTextFeildStyle()),
              const SizedBox(height: 14.0),
              _cardTile(
                icon: Icons.account_balance_wallet_outlined,
                title: "Main Wallet",
                subtitle: "Default payment method",
                trailing: "PHP 850.00",
              ),
              const SizedBox(height: 12.0),
              _cardTile(
                icon: Icons.credit_card_outlined,
                title: "Visa Card",
                subtitle: "**** **** **** 2034",
                trailing: "Connected",
              ),
              const SizedBox(height: 24.0),
              Text("Recent Activity", style: AppWidget.boldTextFeildStyle()),
              const SizedBox(height: 14.0),
              const _WalletActivity(
                title: "Top Up Successful",
                subtitle: "Today, 09:40 AM",
                amount: "+ PHP 500.00",
                positive: true,
              ),
              const SizedBox(height: 12.0),
              const _WalletActivity(
                title: "Order Payment",
                subtitle: "Yesterday, 07:18 PM",
                amount: "- PHP 184.97",
                positive: false,
              ),
              const SizedBox(height: 12.0),
              const _WalletActivity(
                title: "Order Payment",
                subtitle: "Mar 20, 01:10 PM",
                amount: "- PHP 129.99",
                positive: false,
              ),
            ],
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

  Widget _cardTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String trailing,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Row(
        children: [
          Container(
            width: 52.0,
            height: 52.0,
            decoration: BoxDecoration(
              color: const Color(0xFFEDF6EE),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Icon(icon, color: const Color(0xFF0C7233)),
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
          Text(
            trailing,
            style: const TextStyle(
              color: Color(0xFF0C7233),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletAction extends StatelessWidget {
  final String label;
  final IconData icon;

  const _WalletAction({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _WalletActivity extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final bool positive;

  const _WalletActivity({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.positive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Row(
        children: [
          Container(
            width: 48.0,
            height: 48.0,
            decoration: BoxDecoration(
              color: positive ? const Color(0xFFEDF6EE) : const Color(0xFFFFF2F0),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Icon(
              positive ? Icons.south_west_rounded : Icons.north_east_rounded,
              color: positive ? const Color(0xFF0C7233) : const Color(0xFFD35400),
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
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: positive ? const Color(0xFF0C7233) : const Color(0xFFD35400),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
