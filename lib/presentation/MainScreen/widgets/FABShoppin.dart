import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laesquina/blocs/blocs.dart';
import 'package:laesquina/routes/routes.dart' as route;

class FABShopping extends StatelessWidget {
  const FABShopping({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      // color: Colors.red,
      // width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              context.read<ShoppingBloc>().add(RestartShopping());
            },
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              // context.read<ShoppingBloc>().add(const WhatchShoppinCar());
              Navigator.pushNamed(context, route.orderResume);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
