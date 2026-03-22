import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/cart_service.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class FoodDetail extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final String category;
  final String description;
  final List<String> ingredients;
  final Color accentColor;

  const FoodDetail({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    required this.description,
    required this.ingredients,
    required this.accentColor,
  });

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isWide = width >= 720;
    final bool isCompact = width < 420;
    final double total = double.parse(widget.price) * quantity;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720.0),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _iconButton(Icons.arrow_back_ios_new_rounded, () {
                    Navigator.pop(context);
                  }),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "Details",
                        textAlign: TextAlign.center,
                        style: AppWidget.boldTextFeildStyle(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  _iconButton(Icons.favorite_border_rounded, () {}),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [widget.accentColor.withValues(alpha: 0.16), Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: widget.accentColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        widget.category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    Hero(
                      tag: "${widget.category}-${widget.name}",
                      child: Image.asset(
                        widget.image,
                        height: isWide ? 280.0 : 230.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: [
                  SizedBox(
                    width: isWide ? 500.0 : double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name, style: AppWidget.HeadlineTextFeildStyle()),
                        const SizedBox(height: 8.0),
                        Text(
                          widget.description,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text(
                      "PHP ${widget.price}",
                      style: TextStyle(
                        color: widget.accentColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              LayoutBuilder(
                builder: (context, constraints) {
                  final double availableWidth = constraints.maxWidth;
                  final int infoColumns = availableWidth >= 620
                      ? 3
                      : availableWidth >= 360
                          ? 2
                          : 1;
                  final double tileWidth =
                      (availableWidth - ((infoColumns - 1) * 10.0)) / infoColumns;

                  return Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: [
                      SizedBox(
                        width: tileWidth,
                        child: _infoTile(
                          Icons.star_rounded,
                          "4.8",
                          "Rating",
                          Colors.amber.shade700,
                        ),
                      ),
                      SizedBox(
                        width: tileWidth,
                        child: _infoTile(
                          Icons.delivery_dining_rounded,
                          "20-30 min",
                          "Delivery",
                          widget.accentColor,
                        ),
                      ),
                      SizedBox(
                        width: tileWidth,
                        child: _infoTile(
                          Icons.local_fire_department_rounded,
                          "320 kcal",
                          "Energy",
                          Colors.deepOrange,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 12.0,
                  spacing: 12.0,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quantity", style: AppWidget.boldTextFeildStyle()),
                        const SizedBox(height: 4.0),
                        const Text(
                          "Choose how many you want.",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isCompact ? 10.0 : 12.0,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F5F2),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _qtyButton(
                            Icons.remove_rounded,
                            quantity > 1 ? () => setState(() => quantity--) : null,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: isCompact ? 10.0 : 12.0,
                            ),
                            child: Text(
                              quantity.toString(),
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _qtyButton(
                            Icons.add_rounded,
                            () => setState(() => quantity++),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22.0),
              Text("Ingredients", style: AppWidget.boldTextFeildStyle()),
              const SizedBox(height: 12.0),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: widget.ingredients
                    .map(
                      (ingredient) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                        ),
                        child: Text(ingredient),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 24.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: widget.accentColor,
                  borderRadius: BorderRadius.circular(28.0),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final bool stackActions = constraints.maxWidth < 360;

                    return Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: 14.0,
                      spacing: 14.0,
                      children: [
                        SizedBox(
                          width: stackActions ? constraints.maxWidth : null,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total Price",
                                style: TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(height: 6.0),
                              Text(
                                "PHP ${total.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: stackActions ? constraints.maxWidth : null,
                          child: InkWell(
                            onTap: () {
                              CartService.instance.addItem(
                                name: widget.name,
                                image: widget.image,
                                subtitle: widget.description,
                                price: double.parse(widget.price),
                                quantity: quantity,
                              );
                              Navigator.pushNamed(context, "/order");
                            },
                            borderRadius: BorderRadius.circular(18.0),
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 14.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Text(
                                "Order Now",
                                style: TextStyle(
                                  color: widget.accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
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

  Widget _iconButton(IconData icon, VoidCallback onTap) {
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

  Widget _infoTile(IconData icon, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24.0),
          const SizedBox(height: 8.0),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4.0),
          Text(label, style: const TextStyle(color: Colors.black54, fontSize: 12.0)),
        ],
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.0),
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: onTap == null ? Colors.grey.shade300 : Colors.white,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Icon(icon, color: Colors.black87),
      ),
    );
  }
}
