// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../bloc/shopping_bloc.dart';

abstract class ShoppingState extends Equatable {
  const ShoppingState();
  @override
  List<Object> get props => [];
}

class ShoppingInitial extends ShoppingState {}

class ShoppingReady extends ShoppingState {
  Map order;

  ShoppingReady({
    required this.order,
  });

  List<Object> get props => [order];
}
