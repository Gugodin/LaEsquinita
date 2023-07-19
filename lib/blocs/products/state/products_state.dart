// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../bloc/products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
  
  @override
  List<Object> get props => [];
}

class ProductsEmpty extends ProductsState {}
class ProductsFilled extends ProductsState {
  
  List<ProductEntitie> currentProducts;

  ProductsFilled({
    required this.currentProducts,
  });

  @override
  List<Object> get props => [currentProducts];
}
