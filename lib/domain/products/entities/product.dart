import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductEntitie {
  String? id;
  String name;
  double price;
  bool isFood;
  
  ProductEntitie({
    this.id,
    required this.name,
    required this.price,
    required this.isFood,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'isFood': isFood,
    };
  }

  factory ProductEntitie.fromMap(Map<String, dynamic> map,String id) {
    return ProductEntitie(
      id: id,
      name: map['name'] as String,
      price: (map['price'] as num).toDouble(),
      isFood: map['isFood'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  // factory ProductEntitie.fromJson(String source) => ProductEntitie.fromMap(json.decode(source) as Map<String, dynamic>,String id);

  @override
  String toString() {
    return 'ProductEntitie(id: $id, name: $name, price: $price, isFood: $isFood)';
  }
}
