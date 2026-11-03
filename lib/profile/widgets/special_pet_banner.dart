import 'package:flutter/material.dart';

/// Banner Linh vật độc quyền PRO: Mèo Thiền Định
class SpecialPetBanner extends StatelessWidget {
  final VoidCallback? onExplore;

  const SpecialPetBanner({
    super.key,
    this.onExplore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFFFC107).withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        children: [
          const Text('🐱', style: TextStyle(fontSize: 32)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Mèo Thiền Định',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF33291B),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'PRO',
                        style: TextStyle(
                          fontSize: 9,
                          color: Color(0xFFFFC107),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text(
                  'Linh vật độc quyền chu kỳ Trăng tròn',
                  style: TextStyle(fontSize: 11, color: Colors.white60),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onExplore ?? () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF42A5F5),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Khám Phá',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
