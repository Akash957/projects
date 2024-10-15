import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projects/singuppage.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _currentIndex = 0;
  final List<String> _imageList = [
    'assets/img.png',
    'assets/proman.png',
    'assets/images.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 100),
          Center(
            child: Column(
              children: const <Widget>[
                Text(
                  'Discover something new',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Special new arrivals just for you',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              autoPlay: false,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: _imageList.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        alignment: Alignment.center,
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _imageList.map((url) {
              int index = _imageList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.black : Colors.grey,
                ),
              );
            }).toList(),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MySignPage(),
                  ));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black12,
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
            ),
            child: const Text(
              'Shopping now',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
