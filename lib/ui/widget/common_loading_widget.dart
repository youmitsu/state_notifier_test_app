import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black.withOpacity(0.7),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Lottie.asset('lottie/loading.json'),
      ),
    );
  }
}
