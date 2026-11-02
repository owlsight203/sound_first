import 'package:flutter/material.dart';

/// Widget tiêu đề chính và mô tả ngắn của gói Pro
class ProTitle extends StatelessWidget {
  const ProTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Sleep Better.',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          'Every Single Night.',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2EE6A6),
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Nâng tầm giấc ngủ chuẩn khoa học. Không giới hạn 80+ âm thanh thiên nhiên 96kHz và tần số sóng não độc quyền.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
