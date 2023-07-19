// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:laesquina/blocs/blocs.dart';

import '../../../commons/commons.dart';

class ShoppingItem extends StatelessWidget {
  // const ProductItem({super.key});
  String id;
  String name;
  double price;
  bool isFood;
  ShoppingItem({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.isFood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateOfshop = context.watch<ShoppingBloc>().state as ShoppingReady;
    TextEditingController controller = TextEditingController(text: stateOfshop.order[id].toString());
    Size size = MediaQuery.of(context).size;
    return BlocListener<ShoppingBloc, ShoppingState>(
      listener: (context, state) {
        if(state is ShoppingInitial){
          controller.text = '0';
        }
        else{
          final currentState = state as ShoppingReady;
          controller.text = currentState.order[id];
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: InkWell(
          onTap: () {
            context.read<ShoppingBloc>().add(AddOneProduct(id: id));
            controller.text = (int.parse(controller.text) + 1).toString();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: size.width / 2,
                  child: Text(name, style: Styles.normalText)),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<ShoppingBloc>().add(AddOneProduct(id: id));
                      controller.text =
                          (int.parse(controller.text) + 1).toString();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: const Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 50,
                    height: 30,
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          context.read<ShoppingBloc>().add(AddAmountOfProduct(
                              id: id, amount: int.parse(controller.text)));
                        }
                      },
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.amber),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<ShoppingBloc>()
                          .add(RemoveOneProduct(id: id));
                      controller.text =
                          (int.parse(controller.text) - 1).toString();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: const Center(
                          child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20,
                      )),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
