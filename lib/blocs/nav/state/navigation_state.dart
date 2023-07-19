part of '../bloc/navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();
  
  @override
  List<Object> get props => [];
}

// class NavigationInitial extends NavigationState {}
class InShopping extends NavigationState {
  const InShopping();
}
class InPurchases extends NavigationState {
    const InPurchases();
}
class InProducts extends NavigationState {
    const InProducts();
}
