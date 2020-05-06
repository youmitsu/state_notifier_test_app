import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SubmitLoadingPage extends StatelessWidget {
  static const String routeName = '/submit_loading';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: Lottie.asset('lottie/loading.json'),
        ),
      ),
    );
  }
}
