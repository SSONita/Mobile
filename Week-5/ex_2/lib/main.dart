import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Favorite Cards', style: TextStyle(fontWeight: FontWeight.bold),),
          backgroundColor: Colors.blue,
          centerTitle: false,
        ),
        body: Column(
          children: [
            FavoriteCard(title: 'Love', description: 'Love is Food.'),
            FavoriteCard(title: 'Food', description: 'Food is Love.')

          ],
        ),
      ),
    ),
  );
}

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;
  void setFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10),
                Text(widget.description),
              ],
            ),
          ),
          IconButton(
            onPressed: setFavorite,
            icon: Icon(isFavorite? Icons.favorite: Icons.favorite_border, 
            color: isFavorite? Colors.red: Colors.grey),
          ),
        ],
      ),
    );
  }
}
