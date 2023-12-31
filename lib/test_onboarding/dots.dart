
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final bool isSelected;

  const DotIndicator({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding:   EdgeInsets.symmetric(horizontal: 0,vertical: 60),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isSelected ?7.0:3.0,
          width: 20.0,

          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            borderRadius:  BorderRadius.circular(50),
            color: isSelected ? Colors.white : Colors.white38,
          ),
        ),
      );
  }
}