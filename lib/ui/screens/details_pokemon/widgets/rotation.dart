

import 'package:flutter/material.dart';
import 'dart:math' as math;

class Rotation extends StatefulWidget {
  const Rotation({super.key});

  @override
  State<Rotation> createState() => _RotationState();
}

class _RotationState extends State<Rotation> with SingleTickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
  @override

  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_,child) { 
          return Transform.rotate(
            angle: _controller.value*2*math.pi,
            child: SizedBox(
                          width: 330,
                          child: Opacity(
                              opacity: 0.4,
                              child: Image.asset('assets/pokeball.png')
                              )
                              ),
            );
         },),
    );
  }
}