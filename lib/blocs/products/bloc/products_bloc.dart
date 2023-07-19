// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:laesquina/data/products/products_data.dart';
import 'package:laesquina/domain/products/entities/product.dart';

part '../event/products_event.dart';
part '../state/products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductData productData;
  ProductsBloc(
    this.productData,
  ) : super(ProductsEmpty()) {
    on<GetAllProducts>(_getAllProducts);
    on<AddProduct>(_addProduct);
    on<DeleteProduct>(_deleteProduct);
    on<ModifyProduct>(_modifyProduct);
  }

  Future<FutureOr<void>> _getAllProducts(GetAllProducts event, Emitter<ProductsState> emit) async {
    if(state is ProductsEmpty){
      List<ProductEntitie> listOfProducts = [];

    listOfProducts = await productData.getAllProducts();
    if(listOfProducts.isEmpty){
      emit(ProductsEmpty());
    }else{
      emit(ProductsFilled(currentProducts: listOfProducts));
    }
    } 
  }

  Future<FutureOr<void>> _addProduct(AddProduct event, Emitter<ProductsState> emit) async {
    emit(ProductsEmpty());
    await productData.addProduct(event.productEntitie);
    add(const GetAllProducts());
  }

  Future<FutureOr<void>> _deleteProduct(DeleteProduct event, Emitter<ProductsState> emit) async {
    emit(ProductsEmpty());
    await productData.deleteProduct(event.id);
    add(const GetAllProducts());
  }

  Future<FutureOr<void>> _modifyProduct(ModifyProduct event, Emitter<ProductsState> emit) async {
    emit(ProductsEmpty());
    await productData.modifyProduct(event.id,event.productToModify);
    add(const GetAllProducts());
  }
}
