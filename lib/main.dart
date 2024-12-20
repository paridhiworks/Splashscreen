import 'package:flutter/material.dart';
import 'splashscreen.dart'; // Import SplashScreen from splashscreen.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tractor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Set SplashScreen as the home screen
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Duration for one full rotation
    );

    // Start the animation and stop after one rotation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Rotate the image using RotationTransition
            RotationTransition(
              turns: _controller, // Connect the animation controller
              child: Image.asset(
                "assets/tractor.png",
                height: 150, // Adjust height as needed
                width: 150,  // Adjust width as needed
                fit: BoxFit.cover, // Ensure the image fits well
              ),
            ),
            const SizedBox(height: 20), // Adds space between the image and text
            const Text(
              'Drive Now',
              style: TextStyle(
                  fontSize: 50, // Font size set to 20
                  fontWeight: FontWeight.bold,
                  color: Colors.blue// Bold font
              ),
            ),
          ],
        ),
      ),
    );
  }
}






