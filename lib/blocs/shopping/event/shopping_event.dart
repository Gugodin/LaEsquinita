// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../bloc/shopping_bloc.dart';

abstract class ShoppingEvent extends Equatable {
  const ShoppingEvent();

  @override
  List<Object> get props => [];
}

class FillShoppingCar extends ShoppingEvent{
  const FillShoppingCar();
  @override
  List<Object> get props => [];
}
class WhatchShoppinCar extends ShoppingEvent{
  const WhatchShoppinCar();
  @override
  List<Object> get props => [];
}
class AddOneProduct extends ShoppingEvent{
  String id;
  AddOneProduct({required this.id});
  @override
  List<Object> get props => [];
}
class RestartShopping extends ShoppingEvent{
  RestartShopping();
  @override
  List<Object> get props => [];
}
class RemoveOneProduct extends ShoppingEvent{
  String id;
  RemoveOneProduct({required this.id});
  @override
  List<Object> get props => [];
}



class AddAmountOfProduct extends ShoppingEvent {
  String id;
  int amount;
  AddAmountOfProduct({
    required this.id,
    required this.amount,
  });
  @override
  List<Object> get props => [];
}
class SendOrder extends ShoppingEvent {
  const SendOrder();
  @override
  List<Object> get props => [];
}


