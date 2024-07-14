import 'dart:math';
import 'package:flutter/material.dart';

class GradientBackgroundScreen extends StatelessWidget {
  const GradientBackgroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: List.generate(30, (index) {
          final random = Random();
          final size = random.nextDouble() * 100 + 50;
          final top = random.nextDouble() * MediaQuery.of(context).size.height;
          final left = random.nextDouble() * MediaQuery.of(context).size.width;

          return Positioned(
            top: top,
            left: left,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange.withOpacity(random.nextDouble()),
                    Colors.pink.withOpacity(random.nextDouble()),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(size / 2),
              ),
            ),
          );
        }),
      ),
    );
  }
}
