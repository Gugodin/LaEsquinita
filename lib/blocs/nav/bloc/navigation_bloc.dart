import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '../event/navigation_event.dart';
part '../state/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(InShopping()) {
    on<GoToPurchases>(_goToPurchase);
    on<GoToShopping>(_goToShopping);
    on<GoToProducts>(_goToProducts);
  }

  FutureOr<void> _goToPurchase(GoToPurchases event, Emitter<NavigationState> emit) {
    emit(const InPurchases());
  }

  FutureOr<void> _goToShopping(GoToShopping event, Emitter<NavigationState> emit) {
    emit(const InShopping());
  }

  FutureOr<void> _goToProducts(GoToProducts event, Emitter<NavigationState> emit) {
    emit(const InProducts());
  }
}
