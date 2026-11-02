import 'package:flutter/material.dart';

/// Hàng 3 ô thống kê nhanh: Streak, Gems, Top %
class StatsQuickRow extends StatelessWidget {
  const StatsQuickRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: _MiniStatBox(
                emoji: '🔥',
                value: '7 Ngày',
                label: 'Chuỗi Ngủ',
                valueColor: Colors.orangeAccent)),
        const SizedBox(width: 10),
        Expanded(
            child: _MiniStatBox(
                emoji: '💎',
                value: '240',
                label: 'Mộng Tưởng',
                valueColor: Colors.lightBlueAccent)),
        const SizedBox(width: 10),
        Expanded(
            child: _MiniStatBox(
                emoji: '🏆',
                value: 'Top 5%',
                label: 'Tuần Này',
                valueColor: const Color(0xFFFFC107))),
      ],
    );
  }
}

class _MiniStatBox extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;
  final Color valueColor;

  const _MiniStatBox({
    required this.emoji,
    required this.value,
    required this.label,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF222B38)),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          Text(value,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: valueColor)),
          const SizedBox(height: 2),
          Text(label,
              style:
                  const TextStyle(fontSize: 11, color: Colors.white60)),
        ],
      ),
    );
  }
}
