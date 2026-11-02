import 'package:flutter/material.dart';

/// Avatar tròn + tên người dùng + ID + huy hiệu danh hiệu
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Avatar với nút chỉnh sửa ─────────────────────────
        Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF161E2C),
                  border:
                      Border.all(color: const Color(0xFF222B38), width: 3),
                ),
                child: const Center(
                  child: Text('🦉', style: TextStyle(fontSize: 42)),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Color(0xFF2EE6A6),
                  shape: BoxShape.circle,
                ),
                child:
                    const Icon(Icons.edit, color: Colors.black, size: 14),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // ── Tên + verified icon ──────────────────────────────
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thần Cú Say Ngủ',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(width: 6),
            Icon(Icons.verified, color: Color(0xFF2EE6A6), size: 16),
          ],
        ),
        const SizedBox(height: 4),

        // ── ID + cấp bậc ─────────────────────────────────────
        const Text(
          '#NOCT-8821 • Cú Trưởng Thành',
          style: TextStyle(fontSize: 12, color: Colors.white60),
        ),
        const SizedBox(height: 10),

        // ── Huy hiệu danh hiệu ──────────────────────────────
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF332A1B),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: const Color(0xFFFFC107).withValues(alpha: 0.3)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('🧘', style: TextStyle(fontSize: 13)),
              SizedBox(width: 6),
              Text(
                'Bậc Thầy Tĩnh Tâm',
                style: TextStyle(
                    color: Color(0xFFFFC107),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
