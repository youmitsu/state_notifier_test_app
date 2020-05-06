import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'about/about_page.dart';
import 'signup/signup_form_page.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/welcome';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final backgroundImages = [
    'images/welcome_image1.jpg',
    'images/welcome_image2.jpg',
    'images/welcome_image3.jpg',
  ];

  int imageIndex = 0;
  PageController pageController;

  List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    _pages = [
      AboutPage(pageController),
      SignUpFormPage(pageController),
    ];
    Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() {
        if (imageIndex == backgroundImages.length - 1) {
          imageIndex = 0;
        } else if (imageIndex < backgroundImages.length - 1) {
          imageIndex++;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedSwitcher(
            duration: Duration(milliseconds: 800),
            child: Container(
              key: ValueKey<String>(backgroundImages[imageIndex]),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black45,
                backgroundBlendMode: BlendMode.darken,
                image: DecorationImage(
                  image: AssetImage(backgroundImages[imageIndex]),
                  fit: BoxFit.fitHeight,
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.darken),
                ),
              ),
            ),
          ),
          PageView.builder(
            controller: pageController,
            itemBuilder: (context, index) {
              return _pages[index];
            },
          ),
        ],
      ),
    );
  }
}
