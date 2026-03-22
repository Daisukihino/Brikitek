import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/all_orders_page.dart';
import 'package:flutter_application_1/pages/Onboarding.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/order_page.dart';
import 'package:flutter_application_1/pages/order_success_page.dart';
import 'package:flutter_application_1/pages/payment_method_page.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/pages/wallet_page.dart';
import 'package:flutter_application_1/pages/wallet_transactions_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Upang Express',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0C7233)),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const Onboarding(),
      routes: {
        "/login": (context) => const LoginPage(),
        "/signup": (context) => const SignUpPage(),
        "/home": (context) => const Home(),
        "/order": (context) => const OrderPage(),
        "/payment-method": (context) => const PaymentMethodPage(
              selectedMethod: "Upang Wallet",
              total: 0,
            ),
        "/order-success": (context) => const OrderSuccessPage(),
        "/wallet": (context) => const WalletPage(),
        "/wallet-transactions": (context) => const WalletTransactionsPage(),
        "/all-orders": (context) => const AllOrdersPage(),
      },
    );
  }
}
