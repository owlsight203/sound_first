import 'package:flutter/material.dart';

/// Widget Header cho màn hình Pro: Logo huy hiệu vàng & nhãn Nocturne Super
class ProHeader extends StatelessWidget {
  final VoidCallback? onClose;

  const ProHeader({
    super.key,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (onClose != null)
          Positioned(
            left: 0,
            top: 0,
            child: IconButton(
              icon: const Icon(Icons.close_rounded, color: Colors.white70),
              onPressed: onClose,
              tooltip: 'Đóng',
            ),
          ),
        Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFFFC107),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFC107).withValues(alpha: 0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: const Center(
                child: Icon(Icons.military_tech, size: 48, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF192231),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFFFC107).withValues(alpha: 0.3),
                ),
              ),
              child: const Text(
                'NOCTURNE SUPER',
                style: TextStyle(
                  color: Color(0xFFFFC107),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
