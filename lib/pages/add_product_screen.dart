import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String title = "";
    String description = "";
    String image = "";
    double price = 0;
    String category = "";

    Future<void> addProduct(context) async {
      var url = Uri.parse("https://fakestoreapi.com/products");
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "title": title,
          "price": price,
          "description": description,
          "image": image,
          "category": category,
        }),
      );
      if (response.statusCode == 200) {
        print("Response success $response");
        Navigator.pop(context);
      } else {
        print("Error: ${response.statusCode}");
        print("Response failed ${response.body}");
        const snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Failed to add product',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(.8),
        title: const Text(
          "Add Product",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Product Title"),
              onChanged: (value) {
                title = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Product Price"),
              onChanged: (value) {
                price = double.parse(value);
              },
            ),
            TextField(
              decoration:
                  const InputDecoration(labelText: "Product Description"),
              onChanged: (value) {
                description = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Product Image URL"),
              onChanged: (value) {
                image = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Product Category"),
              onChanged: (value) {
                category = value;
              },
            ),
            const Gap(32),
            ElevatedButton(
              onPressed: () {
                if (title.isEmpty ||
                    description.isEmpty ||
                    category.isEmpty ||
                    image.isEmpty ||
                    price == 0) {
                  const snackBar = SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      'Vous devez tout les champs du formulaire',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                } else {
                  addProduct(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                elevation: 5.0,
                minimumSize: const Size(double.infinity, 50.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              child: const Text("Add Product"),
            ),
          ],
        ),
      ),
    );
  }
}
