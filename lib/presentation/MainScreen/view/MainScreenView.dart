import 'package:expendable_fab/expendable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:laesquina/presentation/MainScreen/widgets/FloatingActionButtonProducts.dart';

import '../../../blocs/blocs.dart';
import '../../Shopping/view/ShoppingView.dart';
import '../../views.dart';
import '../widgets/widets.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductsBloc, ProductsState>(
      listener: (context, state) {
        if(state is ProductsFilled){
          
        }
        // TODO: implement listener
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('La Esquinita'),
          ),
          body: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              if (state is InShopping) {
                return const ShoppingView();
              }
              if (state is InPurchases) {
                return const Center(
                  child: Text('Estamos en purchases;'),
                );
              }

              return const ProductView();
            },
          ),
          floatingActionButton: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              // return Container();

              if (state is InProducts) {
                return FABProducts();
              } else if (state is InShopping) {
                return const FABShopping();
              } else {
                return Container();
              }
            },
          ),
          bottomNavigationBar: const NavigationBarCustom(),
        ),
      ),
    );
  }
}
