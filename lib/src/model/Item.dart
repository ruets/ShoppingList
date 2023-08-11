class Item {
  final int? id;
  final String name;
  final bool inCart;
  final double? price;
  final int? count;

  Item(this.id, this.name, this.inCart, this.price, this.count) {
    if (inCart) {
      assert(price != null);
      assert(count != null);
    }
  }

  Item.fromJson(Map<String, dynamic> json)
    : id = json['_id'],
      name = json['name'],
      inCart = json['inCart'],
      price =  json['price'] == null ? null : json['price'].toDouble(),
      count = json['count'];

  Map<String, dynamic> toMap() => {
    '_id': id,
    'name': name,
    'inCart': inCart,
    'price': price,
    'count': count,
  };

  int? getId() { return id; }
  String getName() { return name; }
  bool getInCart() { return inCart; }
  double? getPrice() { return price; }
  int? getCount() { return count; }

  @override
  String toString() {
    return '{\n'
        '  "_id": $id,\n'
        '  "name": "$name",\n'
        '  "inCart": $inCart,\n'
        '  "price": $price,\n'
        '  "count": $count\n'
        '}';
  }
}