// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:laesquina/domain/products/entities/product.dart';

import '../../domain/domain.dart';

class ProductData extends ProductsRepositorie {
  // FirebaseFirestore  dataBase;
  FirebaseFirestore db;

  ProductData({
    required this.db,
  });
  @override
  Future<List<ProductEntitie>> getAllProducts() async {
    List<ProductEntitie> productsFromDataBase = [];
    await db.collection('products').get().then((data) {
      for (QueryDocumentSnapshot element in data.docs) {
        productsFromDataBase.add(ProductEntitie.fromMap(
            element.data() as Map<String, dynamic>, element.id));
      }
    });
    return productsFromDataBase;
  }

  @override
  Future<void> addProduct(ProductEntitie productToSend) async {
    final productInMap = <String, dynamic>{
      "name": productToSend.name,
      "price": productToSend.price,
      "isFood": productToSend.isFood
    };
    await db.collection("products").add(productInMap);
  }
  
  @override
  Future<void> deleteProduct(String id) async {
    await db.collection("products").doc(id).delete();
  }
  
  @override
  Future<void> modifyProduct(String id, ProductEntitie productToModify) async{
    final productInMap = <String, dynamic>{
      "name": productToModify.name,
      "price": productToModify.price,
      "isFood": productToModify.isFood
    };
    await db.collection("products").doc(id).set(productInMap);
  }
  
  
}
