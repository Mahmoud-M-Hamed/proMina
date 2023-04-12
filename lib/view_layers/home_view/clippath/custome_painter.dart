import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 192, 180, 210)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.8125,size.height*0.99);
    path0.quadraticBezierTo(size.width*0.719,size.height*0.718,size.width*0.618,size.height*0.766);
    path0.cubicTo(size.width*0.39,size.height*0.84,size.width*0.36,size.height*0.64,size.width*0.29,size.height*0.499);
    path0.quadraticBezierTo(size.width*0.25,size.height*0.42,size.width*0.06,size.height*0.396);
    path0.lineTo(size.width*0.91,size.height*0.39);

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
