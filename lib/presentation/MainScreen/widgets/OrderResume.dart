import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laesquina/blocs/blocs.dart';
import 'package:laesquina/domain/products/entities/product.dart';
import 'package:laesquina/presentation/Products/widgets/widget.dart';

class OrderResume extends StatelessWidget {
  const OrderResume({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Resumen de orden')),
        body: BlocBuilder<ShoppingBloc, ShoppingState>(
          builder: (context, state) {
            if (state is ShoppingInitial) {
              return const Center(
                child: Text('Orden Vacia'),
              );
            } else {
              final currentState = state as ShoppingReady;

              bool allCero = true;

              currentState.order.forEach((key, value) {
                if (value != 0) {
                  allCero = false;
                }
              });
              if (allCero) {
                return const Center(
                  child: Text('Carrito vacio'),
                );
              } else {
                return SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TitleSection(title: 'Comidas'),
                        Builder(
                          builder: (context) {
                            List<ProductItem> pl = [];
                            currentState.order.forEach((key, value) {
                              if (value != 0) {
                                final stateOfProducts = context
                                    .watch<ProductsBloc>()
                                    .state as ProductsFilled;
                                ProductEntitie dataProduct = stateOfProducts
                                    .currentProducts
                                    .firstWhere((element) => element.id == key);
                                if (dataProduct.isFood) {
                                  pl.add(ProductItem(
                                    id: dataProduct.id.toString(),
                                    name: dataProduct.name,
                                    price: dataProduct.price,
                                    isFood: dataProduct.isFood,
                                    isForResume: true,
                                    amount: value,
                                  ));
                                }
                              }
                            });
                            if (pl.isEmpty) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Center(
                                    child: Text(
                                  'Ninguna comida',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5)),
                                )),
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: pl,
                              );
                            }
                          },
                        ),
                        TitleSection(title: 'Bebidas'),
                        Builder(
                          builder: (context) {
                            List<ProductItem> pl = [];
                            currentState.order.forEach((key, value) {
                              if (value != 0) {
                                final stateOfProducts = context
                                    .watch<ProductsBloc>()
                                    .state as ProductsFilled;
                                ProductEntitie dataProduct = stateOfProducts
                                    .currentProducts
                                    .firstWhere((element) => element.id == key);
                                if (!dataProduct.isFood) {
                                  pl.add(ProductItem(
                                    id: dataProduct.id.toString(),
                                    name: dataProduct.name,
                                    price: dataProduct.price,
                                    isFood: dataProduct.isFood,
                                    isForResume: true,
                                    amount: value,
                                  ));
                                }
                              }
                            });
                            if (pl.isEmpty) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Center(
                                    child: Text(
                                  'Ninguna bebida',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5)),
                                )),
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: pl,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
          },
        ));
  }
}
