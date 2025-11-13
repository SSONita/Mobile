import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.white),
            ),
          ],
          backgroundColor: Colors.blue[300],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(children: [
            WeatherCard(
              city: 'Phnom Penh', 
              current: 12.2, 
              min: 10.0, 
              max: 30.0, 
              weatherImage: 'assets/cloudy.png', 
              start: Colors.purple.shade300, 
              end: Colors.purple.shade100
            ),
            SizedBox(
              height: 20,
            ),
            WeatherCard(
              city: 'Paris', 
              current: 22.2, 
              min: 10.0, 
              max: 40.0, 
              weatherImage: 'assets/sunnyCloudy.png', 
              start: Colors.cyanAccent, 
              end: Colors.cyan
            ),
            SizedBox(
              height: 20,
            ),
            WeatherCard(
              city: 'Rome', 
              current: 45.2, 
              min: 10.0, 
              max: 40.0, 
              weatherImage: 'assets/sunny.png', 
              start: Colors.red.shade200, 
              end: Colors.red
            ),
            SizedBox(
              height: 20,
            ),
            WeatherCard(
              city: 'Toulouse', 
              current: 45.2, 
              min: 10.0, 
              max: 40.0, 
              weatherImage: 'assets/veryCloudy.png', 
              start: Colors.orangeAccent, 
              end: Colors.orange
            ),
            SizedBox(
              height: 20,
            ),
            WeatherCard(
              city: 'Phnom Penh', 
              current: 12.2, 
              min: 10.0, 
              max: 30.0, 
              weatherImage: 'assets/sunny.png', 
              start: Colors.pink.shade50, 
              end: Colors.pink.shade200
            ),
            SizedBox(
              height: 20,
            ),
            WeatherCard(
              city: 'Phnom Penh', 
              current: 12.2, 
              min: 10.0, 
              max: 30.0, 
              weatherImage: 'assets/veryCloudy.png', 
              start: Colors.green.shade100, 
              end: Colors.green.shade300
            ),
          ]),
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  final String city;
  final double current;
  final double min;
  final double max;
  final String weatherImage;
  final Color start;
  final Color end;

  const WeatherCard({
    super.key,
    required this.city,
    required this.current,
    required this.min,
    required this.max,
    required this.weatherImage,
    required this.start,
    required this.end
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              start,
              end,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        
          child: Stack(
            children: [
              Positioned(
                right: -40,
                top: -10,
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: Image.asset(
                              weatherImage,
                              fit: BoxFit.fill, 
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                city,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                              Text(
                                'Min $min°C',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12
                                ),
                              ),
                              Text(
                                'Max $max°C',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12
                                ),
                              )
                            ],
                          ),
                        )
                        
                      ],
                    ),
                    Text(
                      '$current°C',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        
      ),
    );
  }
}
