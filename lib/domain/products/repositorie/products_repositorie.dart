import 'package:laesquina/domain/products/entities/product.dart';

abstract class ProductsRepositorie {
  Future<List<ProductEntitie>> getAllProducts();
  Future<void> addProduct(ProductEntitie productToSend);
  Future<void> deleteProduct(String id);
  Future<void> modifyProduct(String id,ProductEntitie productToModify);
}