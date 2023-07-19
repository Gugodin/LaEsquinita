part of '../bloc/products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetAllProducts extends ProductsEvent{
  const GetAllProducts();

  @override
  List<Object> get props => [];
}
class GetProductById extends ProductsEvent{
  String id;
  GetProductById({required this.id});
  @override
  List<Object> get props => [];
}
class DeleteProduct extends ProductsEvent{
  String id;
  DeleteProduct({required this.id});
  @override
  List<Object> get props => [];
}
class AddProduct extends ProductsEvent{
  ProductEntitie productEntitie;
  AddProduct({required this.productEntitie});
  @override
  List<Object> get props => [];
}
class ModifyProduct extends ProductsEvent{
  String id;
  ProductEntitie productToModify;
  ModifyProduct({required this.id,required this.productToModify});

  @override
  List<Object> get props => [];
}

