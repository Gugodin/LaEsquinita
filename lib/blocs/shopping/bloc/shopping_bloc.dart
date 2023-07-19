// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:laesquina/domain/domain.dart';
import 'package:rxdart/rxdart.dart';
import '../../../data/products/products_data.dart';

part '../event/shopping_event.dart';
part '../state/shopping_state.dart';

class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {
  ProductData productData;
  ShoppingBloc(
    this.productData,
  ) : super(ShoppingInitial()) {
    on<FillShoppingCar>(_fillShoppingCar);
    on<AddOneProduct>(_addOneProduct);
    on<RestartShopping>(_restartShopping);
    on<RemoveOneProduct>(_removeOneProduct);
    on<AddAmountOfProduct>(_addAmountProduct,transformer: debounceRestartable(const Duration(milliseconds: 1000)));
    on<WhatchShoppinCar>(_whatchSopping);
  }

  Future<FutureOr<void>> _fillShoppingCar(FillShoppingCar event, Emitter<ShoppingState> emit) async {
    Map<String,int> shoppingCarFilled = {};

    List <ProductEntitie> listOfProducts = await productData.getAllProducts();

    for (ProductEntitie element in listOfProducts) {
      shoppingCarFilled[element.id!] = 0;
    }
    emit(ShoppingReady(order: shoppingCarFilled));
  }

  FutureOr<void> _addOneProduct(AddOneProduct event, Emitter<ShoppingState> emit) {
    if(state is ShoppingReady){
      final currentState = state as ShoppingReady;
      currentState.order[event.id] = currentState.order[event.id]! + 1;
      emit(currentState);
    }else{
      add(const FillShoppingCar());
    } 
  }

  FutureOr<void> _whatchSopping(WhatchShoppinCar event, Emitter<ShoppingState> emit) {
    final currentState = state as ShoppingReady;
    print('Este es el carrito: ${currentState.order}');
  }

  FutureOr<void> _removeOneProduct(RemoveOneProduct event, Emitter<ShoppingState> emit) {
    if(state is ShoppingReady){
      final currentState = state as ShoppingReady;
      currentState.order[event.id] = currentState.order[event.id]! - 1;
      emit(currentState);
    }else{
      add(const FillShoppingCar());
    } 
  }

  FutureOr<void> _addAmountProduct(AddAmountOfProduct event, Emitter<ShoppingState> emit) {
    if(state is ShoppingReady){
      final currentState = state as ShoppingReady;
      currentState.order[event.id] = event.amount;
      emit(currentState);
    }else{
      add(const FillShoppingCar());
    } 
  }

  FutureOr<void> _restartShopping(RestartShopping event, Emitter<ShoppingState> emit) {
    emit(ShoppingInitial());
    add(const FillShoppingCar());
  }
}

  EventTransformer<RegistrationEvent> debounceRestartable<RegistrationEvent>(
    Duration duration,
  ) {
    return (events, mapper) => restartable<RegistrationEvent>()
        .call(events.debounceTime(duration), mapper);
  }
