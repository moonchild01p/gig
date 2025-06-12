import 'package:flutter/material.dart';

class MenuLinePainter extends CustomPainter {
  final Color color;

  MenuLinePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(MenuLinePainter oldDelegate) => color != oldDelegate.color;
}

class BellIconPainter extends CustomPainter {
  final Color color;

  BellIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path()
      ..moveTo(size.width * 0.8, size.height * 0.4)
      ..quadraticBezierTo(
        size.width * 0.8,
        size.height * 0.1,
        size.width * 0.5,
        size.height * 0.1,
      )
      ..quadraticBezierTo(
        size.width * 0.2,
        size.height * 0.1,
        size.width * 0.2,
        size.height * 0.4,
      )
      ..lineTo(size.width * 0.2, size.height * 0.8)
      ..lineTo(size.width * 0.8, size.height * 0.8);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BellIconPainter oldDelegate) => color != oldDelegate.color;
}

class BlueBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF8BC5D2)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(10, 0)
      ..lineTo(size.width - 70, 0)
      ..quadraticBezierTo(
        size.width,
        0,
        size.width,
        70,
      )
      ..lineTo(size.width, size.height - 70)
      ..quadraticBezierTo(
        size.width,
        size.height,
        size.width - 70,
        size.height,
      )
      ..lineTo(70, size.height)
      ..quadraticBezierTo(
        0,
        size.height,
        0,
        size.height - 70,
      )
      ..lineTo(0, 10)
      ..quadraticBezierTo(0, 0, 10, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BlueBackgroundPainter oldDelegate) => false;
}

class NavBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1E096E)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(21.5),
        ),
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(NavBackgroundPainter oldDelegate) => false;
}

// Implementation of remaining icon painters (CellularIconPainter, WifiIconPainter,
// BatteryIconPainter, HomeIconPainter, MapPinIconPainter, HelpCircleIconPainter,
// UserIconPainter) following the same pattern...

class CellularIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final barWidth = size.width / 5;
    final spacing = barWidth / 2;

    for (var i = 0; i < 4; i++) {
      final height = size.height * (0.25 + (i * 0.25));
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            i * (barWidth + spacing),
            size.height - height,
            barWidth,
            height,
          ),
          const Radius.circular(1),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CellularIconPainter oldDelegate) => false;
}