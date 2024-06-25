import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final Widget child;

  const TicketCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TicketShadowPainter(),
      child: ClipPath(
        clipper: TicketClipper(),
        child: Container(
          color: Colors.white,
          child: child,
        ),
      ),
    );
  }
}

class TicketShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);

    final path = Path()
      ..moveTo(20, 0)
      ..lineTo(size.width - 20, 0)
      ..arcToPoint(Offset(size.width, size.height / 3),
          radius: Radius.circular(20), clockwise: false)
      ..lineTo(size.width, 2 * size.height / 3)
      ..arcToPoint(Offset(size.width - 20, size.height),
          radius: Radius.circular(20), clockwise: false)
      ..lineTo(20, size.height)
      ..arcToPoint(Offset(0, 2 * size.height / 3),
          radius: Radius.circular(20), clockwise: false)
      ..lineTo(0, size.height / 3)
      ..arcToPoint(Offset(20, 0), radius: Radius.circular(20), clockwise: false)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0) // top line
      // ..arcToPoint(Offset(size.width, size.height / 3),
      //     radius: Radius.circular(20), clockwise: false)
      ..lineTo(size.width, 2 * size.height / 3) // bottom line
      ..arcToPoint(
        Offset(size.width - 20, size.height),
        radius: Radius.circular(20),
        clockwise: false,
      )
      ..lineTo(20, size.height)
      ..arcToPoint(
        Offset(0, 2 * size.height / 3),
        radius: Radius.circular(20),
        clockwise: false,
      )
      ..lineTo(0, size.height / 3)
      // ..arcToPoint(Offset(20, 0), radius: Radius.circular(20), clockwise: false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
