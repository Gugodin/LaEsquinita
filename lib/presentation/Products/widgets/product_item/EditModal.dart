// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/blocs.dart';
import '../../../../domain/products/entities/product.dart';
import '../../../MainScreen/widgets/widets.dart';

class EditModal extends StatefulWidget {
  // const EditModal({super.key});
  String id;
  String name;
  double price;
  bool isFood2;
  EditModal({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.isFood2,
  }) : super(key: key);

  @override
  State<EditModal> createState() => _EditModalState();
}

class _EditModalState extends State<EditModal> {
  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController TECname = TextEditingController(text: widget.name);
    TextEditingController TECprice =
        TextEditingController(text: widget.price.toString());
    bool isFood = widget.isFood2;
    return StatefulBuilder(
      builder:
          (BuildContext context, void Function(void Function()) setState2) {
        return AlertDialog(
          title: const Center(child: Text('Agrega Un Producto')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.amber),
                    ),
                    hintText: 'Nombre del producto'),
                controller: TECname,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.amber),
                    ),
                    hintText: 'Precio del producto'),
                controller: TECprice,
              ),
              const SizedBox(height: 10),
              SlideIsFood(
                onChanged: (isDrink) {
                  setState2(() {
                    isFood = !isDrink;
                  });
                },
                isDrink: !isFood,
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

                    ProductEntitie productToModify = ProductEntitie(
                        name: TECname.text,
                        price: double.parse(TECprice.text),
                        isFood: isFood);
                    context.read<ProductsBloc>().add(ModifyProduct(
                        id: widget.id, productToModify: productToModify));
                    Navigator.pop(context);
                  }

                  // print();
                },
                child: Text('Editar')),
          ],
        );
      },
    );
  }
}
