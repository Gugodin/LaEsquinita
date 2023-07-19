import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
   TitleSection({super.key,required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                        height: 1,
                      ),
                    ),
                     Expanded(
                        flex: 3,
                        child: Center(
                            child: Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ))),
                    Expanded(
                      flex: 7,
                      child: Container(
                        color: Colors.grey,
                        height: 1,
                      ),
                    ),
                  ],
                );
  }
}