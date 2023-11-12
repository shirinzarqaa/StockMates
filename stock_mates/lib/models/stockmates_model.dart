import 'package:flutter/material.dart';

class Stock {
  String? name;
  int? price;
  int? amount;
  String? description;

  Stock({
    required this.name,
    required this.price,
    required this.amount,
    required this.description,
  });

  Widget show() {
      return Card(
        color: const Color.fromARGB(255, 253, 253, 253),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          
          side: const BorderSide(
            color: Color.fromARGB(255, 156, 156, 156),
          ),
        ),
        elevation: 2,
        shadowColor: Colors.black,
        child: ListTile(
          title: Text(
            "$name",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 3, 3, 3)
            ),
          ),
          subtitle: Text(
            "$description\nJumlah: $amount \nHarga: $price"
            )
        ),
      );
    }
}