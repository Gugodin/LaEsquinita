part of '../bloc/navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class GoToShopping extends NavigationEvent{
  const GoToShopping();
}
class GoToPurchases extends NavigationEvent{
  const GoToPurchases();
}
class GoToProducts extends NavigationEvent{
  const GoToProducts();
}