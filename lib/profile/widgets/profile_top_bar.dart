import 'package:flutter/material.dart';

/// Top bar: Logo Nocturne + Streak 🔥 + Gems 💎 + FULL badge
class ProfileTopBar extends StatelessWidget {
  const ProfileTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ── Left: Logo + tên app ──────────────────────────────
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFF161E2C),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF2EE6A6), width: 1.5),
              ),
              child: const Text('🦉', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nocturne',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
                Text(
                  'Night Quest',
                  style: TextStyle(fontSize: 11, color: Colors.white60),
                ),
              ],
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF1B382B),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'SLEEP',
                style: TextStyle(
                    color: Color(0xFF2EE6A6),
                    fontSize: 9,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

        // ── Right: Streak + Gems + FULL ──────────────────────
        Row(
          children: [
            const _BadgeChip(
              child: Row(children: [
                Text('🔥', style: TextStyle(fontSize: 13)),
                SizedBox(width: 4),
                Text('7',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                        fontSize: 13)),
              ]),
            ),
            const SizedBox(width: 8),
            const _BadgeChip(
              child: Row(children: [
                Text('💎', style: TextStyle(fontSize: 13)),
                SizedBox(width: 4),
                Text('240',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                        fontSize: 13)),
              ]),
            ),
            const SizedBox(width: 8),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF1B382B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: const Color(0xFF2EE6A6).withValues(alpha: 0.4)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.bolt, color: Color(0xFF2EE6A6), size: 14),
                  SizedBox(width: 2),
                  Text('FULL',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2EE6A6),
                          fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BadgeChip extends StatelessWidget {
  final Widget child;
  const _BadgeChip({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF222B38)),
      ),
      child: child,
    );
  }
}
