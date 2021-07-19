import 'package:flutter/material.dart';
import 'package:ncoviapp/ui/multi_screen.dart';
import 'package:simple_animations/simple_animations.dart';

class TypewriterText extends StatelessWidget {
  final String text;

  TypewriterText(this.text);

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    TextStyle TEXTSTYLE = TextStyle(
//        letterSpacing: 1,
        fontSize: ScUtil.getInstance().setSp(28),
//        fontWeight: FontWeight.w300,
        color: Colors.white);
    return ControlledAnimation(
        duration: Duration(milliseconds: 800),
        delay: Duration(milliseconds: 800),
        tween: IntTween(begin: 0, end: text.length),
        builder: (context, textLength) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text.substring(0, textLength), style: TEXTSTYLE, textAlign: TextAlign.center,maxLines: 2,),
              ControlledAnimation(
                playback: Playback.LOOP,
                duration: Duration(milliseconds: 600),
                tween: IntTween(begin: 0, end: 1),
                builder: (context, oneOrZero) {
                  return Opacity(
                      opacity: oneOrZero == 1 ? 1.0 : 0.0,
                      child: Text("", style: TEXTSTYLE));
                },
              )
            ],
          );
        });
  }
}
