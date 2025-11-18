import 'package:flutter/material.dart';

enum SeasonImage {
  spring('assets/spring.jpeg'),
  summer('assets/summer.jpeg'),
  autumn('assets/autumn.jpeg'),
  winter('assets/winter.jpeg');

  final String imagePath;
  const SeasonImage(this.imagePath);
}

List<SeasonImage> seasonCycle = [
  SeasonImage.spring,
  SeasonImage.summer,
  SeasonImage.autumn,
  SeasonImage.winter,
];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text(
        'Seasons', 
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SeasonCard(country: 'Cambodia'),
          SeasonCard(country: 'Paris')
        ],
      ),
    ),
  ));
}

class SeasonCard extends StatefulWidget {
  const SeasonCard({super.key, required this.country});
  final String country;

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  int currentIndex = 0;
  void changeSeason() {
    setState(() {
      currentIndex = (currentIndex + 1) % seasonCycle.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentSeason = seasonCycle[currentIndex];
    return GestureDetector(
      onTap: changeSeason,
      child: SizedBox(
        width: 250,
        height: 500,
        child: Card(
          elevation: 8,
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 400,
                width: 250,
                child: Image.asset(
                  currentSeason.imagePath,fit: BoxFit.cover,
                )
              ),
              Text(widget.country, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 5,)
            ],
          ),
        ),
      )
    );
  }
}
