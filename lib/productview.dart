import 'package:designapp/constant.dart';
import 'package:flutter/material.dart';

class Iphone13 extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final int price;
  final String fulldescription;
  const Iphone13(
      {Key? key,
      required this.fulldescription,
      required this.image,
      required this.name,
      required this.description,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset("assets/$image"),
            const SizedBox(height: 15),
            Text(
              name,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              description,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              fulldescription,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 15),
            Text(
              "Price Rs $price",
              style: TextStyle(
                  color: colorblue, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
