// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:designapp/productview.dart';
import "package:flutter/material.dart";

import 'package:designapp/constant.dart';

class ItemWidget extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final int price;
  final String fulldescription;
  const ItemWidget(
      {Key? key,
      required this.image,
      required this.name,
      required this.description,
      required this.price,
      required this.fulldescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 5,
        child: ListTile(
          leading: SizedBox(
            height: 90,
            width: 90,
            child: Image.asset("assets/$image"),
          ),
          title: Text(name),
          subtitle: Text(description),
          trailing: Column(
            children: [
              Text(
                "Rs $price",
                style: TextStyle(
                    color: colorblue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (Iphone13(
                              description: description,
                              name: name,
                              image: image,
                              price: price,
                              fulldescription: fulldescription,
                            ))),
                  );
                },
                child: Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                      color: colorblue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(
                      "BUY",
                      style: buttontextstyle,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
