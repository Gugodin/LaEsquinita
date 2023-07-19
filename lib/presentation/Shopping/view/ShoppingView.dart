import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import '../../../domain/domain.dart';
import '../../Products/widgets/widget.dart';
import '../widgets/ShoppingItem.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(

      builder: (context, state) {
        if (state is ProductsEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        } else {
          final currentState = state as ProductsFilled;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TitleSection(title: 'Comidas'),
                  Builder(
                    builder: (context) {
                      List<ShoppingItem> pl = [];
                    
                      for (ProductEntitie element
                          in currentState.currentProducts) {
                        if (element.isFood) {
                          pl.add(ShoppingItem(
                            id: element.id.toString(),
                            name: element.name,
                            price: element.price,
                            isFood: element.isFood,
                          ));
                        }
                      }
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: pl,
                      );
                    },
                  ),
                  TitleSection(title: 'Bebidas'),
                  Builder(
                    builder: (context) {
                      List<ShoppingItem> pl = [];
                    
                      for (ProductEntitie element
                          in currentState.currentProducts) {
                        if (!element.isFood) {
                          pl.add(ShoppingItem(
                            id: element.id.toString(),
                            name: element.name,
                            price: element.price,
                            isFood: element.isFood,
                          ));
                        }
                      }
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: pl,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
    
  }
}
