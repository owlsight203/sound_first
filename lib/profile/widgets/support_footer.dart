import 'package:flutter/material.dart';

/// Mục Hỗ trợ & FAQ, Đánh giá, Thông tin phiên bản
class SupportFooter extends StatelessWidget {
  final VoidCallback? onFaqTap;
  final VoidCallback? onRateTap;

  const SupportFooter({
    super.key,
    this.onFaqTap,
    this.onRateTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onFaqTap ?? () {},
                icon: const Icon(Icons.help_outline, size: 16),
                label: const Text(
                  'Hỗ Trợ & FAQ',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF161E2C),
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFF222B38)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onRateTap ?? () {},
                icon: const Icon(Icons.star, size: 16, color: Color(0xFFFFC107)),
                label: const Text(
                  'Đánh Giá 5 Sao',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF161E2C),
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFF222B38)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Nocturne Sleep Studio • Bản dựng v2.4.1 (Stable)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, color: Colors.white38),
        ),
      ],
    );
  }
}
