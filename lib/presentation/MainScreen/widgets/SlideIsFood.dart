import 'package:flutter/material.dart';

class SlideIsFood extends StatefulWidget {
  SlideIsFood({super.key, required this.onChanged,this.isDrink});
  final Function(bool) onChanged;
  bool? isDrink;
  @override
  State<SlideIsFood> createState() => _SlideIsFoodState();
}

class _SlideIsFoodState extends State<SlideIsFood> {
  double widthContainer = 100;
  double heightContainer = 40;
  @override
  Widget build(BuildContext context) {
  bool isDrink = widget.isDrink ?? false;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isDrink = false;
              widget.onChanged(isDrink);
            });
          },
          child: Container(
            height: heightContainer,
            width: widthContainer,
            decoration: BoxDecoration(
                color: !isDrink
                    ? Colors.amber
                    : const Color.fromARGB(255, 206, 206, 206),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.restaurant,
                  color: !isDrink
                      ? Color.fromARGB(255, 255, 255, 255)
                      : Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  'Comida',
                  style: TextStyle(
                    color: !isDrink
                        ? Color.fromARGB(255, 255, 255, 255)
                        : Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isDrink = true;
              widget.onChanged(isDrink);
            });
          },
          child: Container(
            height: heightContainer,
            width: widthContainer,
            decoration: BoxDecoration(
                color: isDrink
                    ? Colors.amber
                    : const Color.fromARGB(255, 206, 206, 206),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.liquor,
                  color: isDrink
                      ? Color.fromARGB(255, 255, 255, 255)
                      : Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  'Bebida',
                  style: TextStyle(
                    color: isDrink
                        ? Color.fromARGB(255, 255, 255, 255)
                        : Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
