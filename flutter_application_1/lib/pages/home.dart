import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/burger_model.dart';
import 'package:flutter_application_1/model/category_model.dart';
import 'package:flutter_application_1/model/chinese_model.dart';
import 'package:flutter_application_1/model/mexican_model.dart';
import 'package:flutter_application_1/model/pizza_model.dart';
import 'package:flutter_application_1/pages/food_detail.dart';
import 'package:flutter_application_1/service/burger_data.dart';
import 'package:flutter_application_1/service/category_data.dart';
import 'package:flutter_application_1/service/chinese_data.dart';
import 'package:flutter_application_1/service/mexican_data.dart';
import 'package:flutter_application_1/service/pizza_data.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<PizzaModel> pizza = [];
  List<BurgerModel> burger = [];
  List<ChineseModel> chinese = [];
  List<MexicanModel> mexican = [];
  final TextEditingController searchController = TextEditingController();
  String track = "0";
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    pizza = getPizza();
    burger = getBurger();
    chinese = getChinese();
    mexican = getMexican();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWide = screenWidth >= 700;
    final bool isCompact = screenWidth < 420;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/logo.png",
                        width: isWide ? 150.0 : 120.0,
                        height: isWide ? 84.0 : 70.0,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: isWide ? 320.0 : screenWidth * 0.5,
                        child: Text(
                          "Order your favorite food!",
                          style: AppWidget.SimpleTextFeildStyle(),
                        ),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      "images/boy.png",
                      width: isWide ? 82.0 : 62.0,
                      height: isWide ? 82.0 : 62.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 206, 206, 206),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value.trim().toLowerCase();
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Food....",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 12, 114, 51),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(Icons.search, color: Colors.grey[400], size: 30.0),
                  ),
                ],
              ),
              const SizedBox(height: 17.0),
              Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final int quickColumns = constraints.maxWidth >= 420 ? 3 : 1;
                    final double quickCardWidth = quickColumns == 1
                        ? constraints.maxWidth
                        : (constraints.maxWidth - ((quickColumns - 1) * 12.0)) /
                            quickColumns;

                    return Wrap(
                      spacing: 12.0,
                      runSpacing: 12.0,
                      children: [
                        SizedBox(
                          width: quickCardWidth,
                          child: _quickActionCard(
                            icon: Icons.shopping_bag_outlined,
                            title: "Order",
                            subtitle: "Current cart",
                            color: const Color(0xFF0C7233),
                            onTap: () => Navigator.pushNamed(context, "/order"),
                          ),
                        ),
                        SizedBox(
                          width: quickCardWidth,
                          child: _quickActionCard(
                            icon: Icons.account_balance_wallet_outlined,
                            title: "Wallet",
                            subtitle: "Balance",
                            color: const Color(0xFFCC8B00),
                            onTap: () => Navigator.pushNamed(context, "/wallet"),
                          ),
                        ),
                        SizedBox(
                          width: quickCardWidth,
                          child: _quickActionCard(
                            icon: Icons.receipt_long_outlined,
                            title: "Orders",
                            subtitle: "History",
                            color: const Color(0xFFC0392B),
                            onTap: () => Navigator.pushNamed(context, "/all-orders"),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 70.0,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.trackpad,
                    },
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        categories[index].name!,
                        categories[index].image!,
                        index.toString(),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              _currentGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currentGrid() {
    final List<PizzaModel> filteredPizza = pizza
        .where((item) => _matchesSearch(item.name ?? ""))
        .toList();
    final List<BurgerModel> filteredBurger = burger
        .where((item) => _matchesSearch(item.name ?? ""))
        .toList();
    final List<ChineseModel> filteredChinese = chinese
        .where((item) => _matchesSearch(item.name ?? ""))
        .toList();
    final List<MexicanModel> filteredMexican = mexican
        .where((item) => _matchesSearch(item.name ?? ""))
        .toList();

    if (track == "0") {
      return _buildFoodGrid(
        itemCount: filteredPizza.length,
        itemBuilder: (index) => FoodTile(
          filteredPizza[index].name!,
          filteredPizza[index].image!,
          filteredPizza[index].price!,
          "Pizza",
        ),
      );
    }
    if (track == "1") {
      return _buildFoodGrid(
        itemCount: filteredBurger.length,
        itemBuilder: (index) => FoodTile(
          filteredBurger[index].name!,
          filteredBurger[index].image!,
          filteredBurger[index].price!,
          "Burger",
        ),
      );
    }
    if (track == "2") {
      return _buildFoodGrid(
        itemCount: filteredChinese.length,
        itemBuilder: (index) => FoodTile(
          filteredChinese[index].name!,
          filteredChinese[index].image!,
          filteredChinese[index].price!,
          "Chinese",
        ),
      );
    }
    if (track == "3") {
      return _buildFoodGrid(
        itemCount: filteredMexican.length,
        itemBuilder: (index) => FoodTile(
          filteredMexican[index].name!,
          filteredMexican[index].image!,
          filteredMexican[index].price!,
          "Mexican",
        ),
      );
    }
    return const SizedBox.shrink();
  }

  bool _matchesSearch(String value) {
    if (searchQuery.isEmpty) {
      return true;
    }

    return value.toLowerCase().contains(searchQuery);
  }

  Widget _buildFoodGrid({
    required int itemCount,
    required Widget Function(int index) itemBuilder,
  }) {
    final double width = MediaQuery.of(context).size.width;
    final int crossAxisCount = width >= 900 ? 4 : width >= 700 ? 3 : 2;
    final double aspectRatio = width < 380 ? 0.64 : 0.72;

    return Expanded(
      child: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: aspectRatio,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) => itemBuilder(index),
        ),
    );
  }

  Widget _quickActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    final bool compact = MediaQuery.of(context).size.width < 380;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: compact ? 8.0 : 12.0, vertical: 14.0),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 26.0),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: compact ? 13.0 : 15.0,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2.0),
            Text(
              subtitle,
              style: TextStyle(color: Colors.black54, fontSize: compact ? 11.0 : 12.0),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget FoodTile(String name, String image, String price, String category) {
    final Color accentColor = _getAccentColor(category);
    final Map<String, dynamic> details = _getFoodDetails(name, category);
    final double width = MediaQuery.of(context).size.width;
    final bool isCompactCard = width < 420;
    final double imageSize = width >= 700 ? 120.0 : width < 380 ? 96.0 : 110.0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetail(
              name: name,
              image: image,
              price: price,
              category: category,
              description: details["description"] as String,
              ingredients: List<String>.from(details["ingredients"] as List),
              accentColor: accentColor,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          left: isCompactCard ? 12.0 : 10.0,
          right: isCompactCard ? 12.0 : 0.0,
          top: 10.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: "$category-$name",
                child: Image.asset(
                  image,
                  height: imageSize,
                  width: imageSize,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              name,
              style: AppWidget.boldTextFeildStyle(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4.0),
            Text("PHP $price", style: AppWidget.priceTextFeildStyle()),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: width < 380 ? 44.0 : 50.0,
                width: width < 380 ? 68.0 : 80.0,
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getAccentColor(String category) {
    switch (category) {
      case "Pizza":
        return const Color(0xFFE86A33);
      case "Burger":
        return const Color(0xFF0C7233);
      case "Chinese":
        return const Color(0xFFC0392B);
      case "Mexican":
        return const Color(0xFFCC8B00);
      default:
        return const Color(0xFF0C7233);
    }
  }

  Map<String, dynamic> _getFoodDetails(String name, String category) {
    final Map<String, Map<String, dynamic>> detailMap = {
      "Cheese Pizza": {
        "description": "A rich cheese pizza with a soft crust and a warm oven-baked finish.",
        "ingredients": ["Mozzarella", "Tomato Sauce", "Oregano", "Crust"],
      },
      "Margherita pizza": {
        "description": "A lighter pizza with basil, tomato, and creamy cheese in every slice.",
        "ingredients": ["Basil", "Mozzarella", "Tomato", "Olive Oil"],
      },
      "Cheese Burger": {
        "description": "A juicy grilled burger stacked with melted cheese and fresh toppings.",
        "ingredients": ["Beef Patty", "Cheddar", "Lettuce", "Bun"],
      },
      "Margherita Burger": {
        "description": "A signature burger with rich sauce, layered cheese, and a bold bite.",
        "ingredients": ["Patty", "Cheese", "Tomato", "Special Sauce"],
      },
      "Chow Mein": {
        "description": "Savory stir-fried noodles tossed with vegetables and a flavorful glaze.",
        "ingredients": ["Noodles", "Carrots", "Cabbage", "Soy Sauce"],
      },
      "Sweet and Sour": {
        "description": "A sweet and tangy dish with bright flavor and a glossy, satisfying sauce.",
        "ingredients": ["Bell Peppers", "Pineapple", "Sauce", "Chicken"],
      },
      "Fried Rice": {
        "description": "Comforting wok-fried rice with vegetables and balanced seasoning.",
        "ingredients": ["Rice", "Egg", "Spring Onion", "Vegetables"],
      },
      "Dim Sum": {
        "description": "Soft and savory bites inspired by classic dim sum favorites.",
        "ingredients": ["Wrapper", "Pork Filling", "Shrimp", "Sesame Oil"],
      },
      "Beef Tacos": {
        "description": "Crunchy tacos loaded with seasoned beef and fresh toppings.",
        "ingredients": ["Beef", "Taco Shell", "Lettuce", "Salsa"],
      },
      "Chicken Burrito": {
        "description": "A hearty burrito wrapped with chicken, rice, and creamy filling.",
        "ingredients": ["Chicken", "Rice", "Beans", "Cheese"],
      },
      "Nachos": {
        "description": "Crispy chips covered with cheese and punchy toppings.",
        "ingredients": ["Corn Chips", "Cheese", "Jalapeno", "Tomato Salsa"],
      },
      "Quesadilla": {
        "description": "A toasted tortilla folded around melty cheese and savory filling.",
        "ingredients": ["Tortilla", "Cheese", "Chicken", "Peppers"],
      },
    };

    return detailMap[name] ??
        {
          "description": "A freshly prepared $category dish made for a satisfying meal.",
          "ingredients": ["Fresh Ingredients", "Seasoning", "Chef Special", "Sauce"],
        };
  }

  Widget CategoryTile(String name, String image, String categoryindex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          track = categoryindex;
        });
      },
      child: track == categoryindex
          ? Container(
              margin: const EdgeInsets.only(right: 20.0, bottom: 10.0),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 35, 102, 4),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    children: [
                      Image.asset(image, height: 40.0, width: 40.0, fit: BoxFit.cover),
                      const SizedBox(width: 10.0),
                      Text(name, style: AppWidget.whiteTextFeildStyle()),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(right: 20.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: const Color(0xFFececf8),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Image.asset(image, height: 40.0, width: 40.0, fit: BoxFit.cover),
                  const SizedBox(width: 10.0),
                  Text(name, style: AppWidget.SimpleTextFeildStyle()),
                ],
              ),
            ),
    );
  }
}
