import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_color.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '9:41',
              style: GoogleFonts.inter(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                height: 22/17,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [
              _buildWifiIcon(),
              const SizedBox(width: 7),
              _buildCellularIcon(),
              const SizedBox(width: 7),
              _buildBatteryIcon(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBatteryIcon() {
    return SizedBox(
      width: 27,
      height: 13,
      child: Stack(
        children: [
          Container(
            width: 25,
            height: 13,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.black.withOpacity(0.35),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4.3),
            ),
          ),
          Positioned(
            left: 2,
            top: 2,
            child: Container(
              width: 21,
              height: 9,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 5,
            child: Container(
              width: 1,
              height: 4,
              color: AppColors.black.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWifiIcon() {
    return CustomPaint(
      size: const Size(17, 12),
      painter: WifiIconPainter(),
    );
  }

  Widget _buildCellularIcon() {
    return CustomPaint(
      size: const Size(19, 12),
      painter: CellularIconPainter(),
    );
  }
}

class WifiIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.black
      ..style = PaintingStyle.fill;

    // Implement WiFi icon painting logic
    // This is a simplified version, you would need to implement the actual SVG path
    final path = Path()
      ..moveTo(size.width * 0.5, size.height)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(size.width * 0.5, size.height * 0.8),
          radius: size.width * 0.2,
        ),
        0,
        3.14 * 2,
        false,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CellularIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.black
      ..style = PaintingStyle.fill;

    // Implement cellular icon painting logic
    // This is a simplified version, you would need to implement the actual SVG path
    for (var i = 0; i < 4; i++) {
      canvas.drawRect(
        Rect.fromLTWH(
          i * (size.width / 5),
          size.height - (i + 1) * (size.height / 4),
          size.width / 6,
          (i + 1) * (size.height / 4),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}