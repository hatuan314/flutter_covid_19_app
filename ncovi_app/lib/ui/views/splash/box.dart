import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

import 'splash.dart';

class Box extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: 80.0),
      builder: (context, height) {
        return ControlledAnimation(
          duration: Duration(milliseconds: 5000),
          delay: Duration(milliseconds: 500),
          tween: Tween(begin: 2.0, end: 300.0),
          builder: (context, width) {
            return Container(
              color: Colors.transparent,
              child: isEnoughRoomForTypewriter(width)
                  ? TypewriterText("Việt Nam ta\nquyết thắng đại dịch")
                  : Container(),
            );
          },
        );
      },
    );
  }

  isEnoughRoomForTypewriter(width) => width > 20;
}
