// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:laesquina/blocs/blocs.dart';
import 'package:laesquina/presentation/Products/widgets/product_item/EditModal.dart';

import '../../../commons/commons.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({super.key});
  String id;
  String name;
  double price;
  bool isFood;

  bool isForResume;
  int? amount;
  ProductItem({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.isFood,
    required this.isForResume,
    this.amount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: !isForResume ?() {
          showDialog(
            context: context,
            builder: (context) =>
                EditModal(name: name, price: price, isFood2: isFood, id: id,),
          );
        }:null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: Styles.normalText),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  isForResume?amount.toString():'\$ ${price.toString()}',
                  style: Styles.normalText,
                ),
                const SizedBox(
                  width: 10,
                ),
                !isForResume ? InkWell(
                  onTap: () {
                    context.read<ProductsBloc>().add(DeleteProduct(id: id));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: const Center(
                        child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 20,
                    )),
                  ),
                ) : const SizedBox(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
