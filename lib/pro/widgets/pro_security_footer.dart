import 'package:flutter/material.dart';

/// Chân trang thông tin bảo mật Google Play & cam kết hoàn tiền trong 48 giờ
class ProSecurityFooter extends StatelessWidget {
  const ProSecurityFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF161E2C),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF222B38)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.security, color: Color(0xFF2EE6A6), size: 16),
              SizedBox(width: 6),
              Text(
                'Google Play Secured • Cancel anytime',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          '★ 48h money back guarantee if you are not totally in love with your deeper sleep.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            color: Color(0xFFFFC107),
          ),
        ),
      ],
    );
  }
}
