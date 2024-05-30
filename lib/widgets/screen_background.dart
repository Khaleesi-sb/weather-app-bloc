import 'dart:ui';
import 'package:flutter/material.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(3, -0.3),
          child: Container(
            height: 300,
            width: 400,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFFB2EBF2)),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-3, -0.3),
          child: Container(
            height: 300,
            width: 600,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFF80DEEA)),
          ),
        ),
        // Align(
        //   alignment: const AlignmentDirectional(0, -1.2),
        //   child: Container(
        //     height: 300,
        //     width: 600,
        //     decoration: const BoxDecoration(color: Color(0xFFCFD8DC)),
        //   ),
        // ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
          ),
        ),
      ],
    );
  }
}
