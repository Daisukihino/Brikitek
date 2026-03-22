class CartItem {
  final String name;
  final String image;
  final String subtitle;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.subtitle,
    required this.price,
    required this.quantity,
  });
}

class CartService {
  CartService._();

  static final CartService instance = CartService._();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem({
    required String name,
    required String image,
    required String subtitle,
    required double price,
    required int quantity,
  }) {
    final int index = _items.indexWhere((item) => item.name == name);

    if (index != -1) {
      _items[index].quantity += quantity;
      return;
    }

    _items.add(
      CartItem(
        name: name,
        image: image,
        subtitle: subtitle,
        price: price,
        quantity: quantity,
      ),
    );
  }

  void removeAt(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
    }
  }

  void clear() {
    _items.clear();
  }
}
