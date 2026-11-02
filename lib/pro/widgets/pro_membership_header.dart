import 'package:flutter/material.dart';

/// Tiêu đề khu vực chọn gói thành viên kèm huy hiệu ưu đãi có hạn
class ProMembershipHeader extends StatelessWidget {
  const ProMembershipHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Icon(Icons.diamond, color: Color(0xFFFFC107), size: 18),
            SizedBox(width: 6),
            Text(
              'SELECT MEMBERSHIP',
              style: TextStyle(
                color: Color(0xFFFFC107),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF332D15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFFFC107).withValues(alpha: 0.3),
            ),
          ),
          child: const Text(
            '⚡ Limited Time Price',
            style: TextStyle(
              color: Color(0xFFFFC107),
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
