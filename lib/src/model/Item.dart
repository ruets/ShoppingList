class Item {
  final String name;
  final bool inCart;
  final double? price;
  final int? count;

  Item(this.name, this.inCart, this.price, this.count) {
    if (inCart) {
      assert(price != null);
      assert(count != null);
    }
  }

  Item.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      inCart = json['inCart'],
      price = json['price'],
      count = json['count'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'inCart': inCart,
    'price': price,
    'count': count,
  };

  String getName() { return name; }
  bool getInCart() { return inCart; }
  double? getPrice() { return price; }
  int? getCount() { return count; }

  @override
  String toString() {
    return name;
  }
}