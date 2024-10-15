import 'package:flutter/material.dart';
import 'homescreen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/girlsimg.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 450,
              ),
              Text(
                'Welcome to GemStore!',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'The home for a fashionista',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black12,
                  backgroundColor: Colors.grey,
                  // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
