import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/order_history_service.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class AllOrdersPage extends StatefulWidget {
  const AllOrdersPage({super.key});

  @override
  State<AllOrdersPage> createState() => _AllOrdersPageState();
}

class _AllOrdersPageState extends State<AllOrdersPage> {
  @override
  Widget build(BuildContext context) {
    final List<OrderHistoryItem> orders = OrderHistoryService.instance.orders;
    final List<OrderHistoryItem> ongoing =
        orders.where((order) => order.status == "Preparing" || order.status == "On the Way").toList();
    final List<OrderHistoryItem> delivered =
        orders.where((order) => order.status == "Delivered").toList();
    final List<OrderHistoryItem> canceled =
        orders.where((order) => order.status == "Canceled").toList();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                    Text("All Orders", style: AppWidget.boldTextFeildStyle()),
                    _roundButton(icon: Icons.filter_list_rounded, onTap: () {}),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const TabBar(
                    labelColor: Color(0xFF0C7233),
                    unselectedLabelColor: Colors.black54,
                    indicatorColor: Color(0xFF0C7233),
                    tabs: [
                      Tab(text: "Ongoing"),
                      Tab(text: "Delivered"),
                      Tab(text: "Canceled"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18.0),
              Expanded(
                child: TabBarView(
                  children: [
                    _ordersList(ongoing),
                    _ordersList(delivered),
                    _ordersList(canceled),
                  ],
                ),
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

  Widget _ordersList(List<OrderHistoryItem> orders) {
    if (orders.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "No orders in this section yet.",
            style: const TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
      itemBuilder: (context, index) {
        final order = orders[index];
        return _OrderStatusCard(
          image: order.image,
          title: order.title,
          status: order.status,
          detail: order.detail,
          price: order.price,
          deliveryLocation: order.deliveryLocation,
          statusColor: _statusColor(order.status),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 14.0),
      itemCount: orders.length,
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case "Preparing":
        return const Color(0xFF0C7233);
      case "On the Way":
        return const Color(0xFFE67E22);
      case "Delivered":
        return const Color(0xFF0C7233);
      case "Canceled":
        return const Color(0xFFC0392B);
      default:
        return const Color(0xFF0C7233);
    }
  }
}

class _OrderStatusCard extends StatelessWidget {
  final String image;
  final String title;
  final String status;
  final String detail;
  final String price;
  final String deliveryLocation;
  final Color statusColor;

  const _OrderStatusCard({
    required this.image,
    required this.title,
    required this.status,
    required this.detail,
    required this.price,
    required this.deliveryLocation,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        children: [
          Container(
            width: 82.0,
            height: 82.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F5F2),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(width: 14.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(detail, style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 8.0),
                Text(
                  deliveryLocation,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13.0,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF0C7233),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
