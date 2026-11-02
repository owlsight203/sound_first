import 'package:flutter/material.dart';

/// Widget thanh đánh giá chất lượng (4.9/5 từ 120,000+ người dùng)
class ProRatingCard extends StatelessWidget {
  const ProRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: List.generate(
              5,
              (index) => const Icon(
                Icons.star,
                color: Color(0xFFFFC107),
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Flexible(
            child: Text(
              '4.9/5 from 120,000+ happy sleepers worldwide',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
