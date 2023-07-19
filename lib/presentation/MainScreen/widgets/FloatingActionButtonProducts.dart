import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laesquina/blocs/blocs.dart';
import 'package:laesquina/domain/products/entities/product.dart';

import 'widets.dart';

class FABProducts extends StatefulWidget {
  FABProducts({super.key});

  @override
  State<FABProducts> createState() => _FABProductsState();
}

class _FABProductsState extends State<FABProducts> {
  TextEditingController TECname = TextEditingController();

  TextEditingController TECprice = TextEditingController();
  bool isFood = true;
  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) setState2) {
                
                return AlertDialog(
                  title: const Center(child: Text('Agrega Un Producto')),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.amber),
                            ),
                            hintText: 'Nombre del producto'),
                        controller: TECname,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.amber),
                            ),
                            hintText: 'Precio del producto'),
                        controller: TECprice,
                      ),
                      const SizedBox(height: 10),
                      SlideIsFood(
                        onChanged: (isDrink) {
                          setState(() {
                            isFood = !isDrink;
                          });
                        },
                      ),
                      hasError
                          ? const Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text('Llene todos los campos',
                                  style: TextStyle(color: Colors.red)),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar')),
                    ElevatedButton(
                        onPressed: () {
                          if (TECname.text.isEmpty || TECprice.text.isEmpty) {
                            setState2(() {
                              hasError = true;
                            });
                          } else {
                            print('Name: ${TECname.text}');
                            print('price: ${TECprice.text}');
                            print('IsFood? $isFood');

                            ProductEntitie productToAdd = ProductEntitie(
                                name: TECname.text,
                                price: double.parse(TECprice.text),
                                isFood: isFood);
                            context.read<ProductsBloc>().add(AddProduct(productEntitie: productToAdd));
                            context.read<ShoppingBloc>().add(RestartShopping());

                            Navigator.pop(context);
                          }

                          // print();
                        },
                        child: Text('Agregar')),
                  ],
                );
              },
            );
          },
        );
        TECname.clear();
        TECprice.clear();
        hasError = false;
      },
      backgroundColor: Colors.amber,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
