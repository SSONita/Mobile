import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.purple[50],
          foregroundColor: Colors.black,
          title: Text('Products'),
          centerTitle: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Row(
              children: [
                Expanded(
                  child: ProductCard(product: Product.dart),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ProductCard(product: Product.flutter),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ProductCard(product: Product.firebase),
                ),
              ],
            ),
          ]),
        ),
      ),
    ),
  );
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.image,
              height: 100,
              fit: BoxFit.contain,
            ),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(product.description),
          ],
        ),
      )
    );
  }
}

enum Product {
  dart(title: 'Dart', description: 'The best object language', image: 'assets/dart.png'),
  flutter(
    title: 'Flutter',
    description: 'The best mobile widget libraries',
    image: 'assets/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'The best cloud database',
    image: 'assets/firebase.png',
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}
