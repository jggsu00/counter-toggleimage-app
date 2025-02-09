import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterImageToggleApp(),
    );
  }
}

class CounterImageToggleApp extends StatefulWidget {
  @override
  _CounterImageToggleAppState createState() => _CounterImageToggleAppState();
}

class _CounterImageToggleAppState extends State<CounterImageToggleApp> {
  int _counter = 0;
  bool _showFirstImage = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleImage() {
    setState(() {
      _showFirstImage = !_showFirstImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter & Image Toggle"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Counter: $_counter",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Image.network(
              _showFirstImage
                  ? 'https://logosandtypes.com/wp-content/uploads/2023/01/Atlas-FC.png'
                  : 'https://understandingitaly.b-cdn.net/images/content/ac-milan-football-club.jpg',
              key: ValueKey<bool>(_showFirstImage),
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text("Increment"),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: _toggleImage,
                child: Text("Toggle Image"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
