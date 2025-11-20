import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ScoreBar(title: 'Dart'), 
              SizedBox(height: 20,),
              ScoreBar(title: 'Flutter')
            ],
          )
        )
      ),
    )
  );
}

class ScoreBar extends StatefulWidget {
  const ScoreBar({super.key, required this.title});
  final String title;

  @override
  State<ScoreBar> createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  int score = 0;
  void decrement() {
    setState(() {
      if (score > 0) score--;
    });
  }

  void increment() {
    setState(() {
      if (score < 10) score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'My Score In ${widget.title}',
            style: TextStyle(
              color: Colors.blue[600],
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: decrement, icon: Icon(Icons.remove)),
              IconButton(onPressed: increment, icon: Icon(Icons.add)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SizedBox(
              height: 20,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: score / 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: score == 10 ? Colors.purple[400] : Colors.purple[100],
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
