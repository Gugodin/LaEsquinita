import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:laesquina/blocs/blocs.dart';

class NavigationBarCustom extends StatelessWidget {
  const NavigationBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      padding: const EdgeInsets.all(10),
      child: GNav(
        selectedIndex: 1,
        backgroundColor: Colors.amber,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: const Color(0xFF806000).withOpacity(0.5),
        padding: const EdgeInsets.all(15),
        // tabActiveBorder: Border.all(color: Colors.white),
        tabBorder: Border.all(color: Colors.white.withOpacity(0.5)),
        gap: 8,
        tabs: [
          GButton(
            icon: Icons.monetization_on,
            text: 'Pedidos',
            onPressed: () {
              context.read<NavigationBloc>().add(const GoToPurchases());
            },
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Nueva Orden',
            onPressed: () {
              context.read<NavigationBloc>().add(const GoToShopping());
            },
          ),
          GButton(
            icon: Icons.restaurant,
            text: 'Productos',
            onPressed: () {
              context.read<NavigationBloc>().add(const GoToProducts());
            },
          )
        ],
      ),
    );
  }
}
