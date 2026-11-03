import 'package:flutter/material.dart';

/// Mục Thói quen & Mục tiêu ngủ
class SleepHabitsSection extends StatefulWidget {
  final bool initialReminderOn;
  final ValueChanged<bool>? onReminderChanged;

  const SleepHabitsSection({
    super.key,
    this.initialReminderOn = true,
    this.onReminderChanged,
  });

  @override
  State<SleepHabitsSection> createState() => _SleepHabitsSectionState();
}

class _SleepHabitsSectionState extends State<SleepHabitsSection> {
  late bool _isBedtimeReminderOn;

  @override
  void initState() {
    super.initState();
    _isBedtimeReminderOn = widget.initialReminderOn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF222B38)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🌙 Thói Quen & Mục Tiêu Ngủ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 14),
          _buildHabitItem(
            icon: Icons.alarm,
            title: 'Mục tiêu giờ ngủ',
            subtitle: '23:00 hàng đêm',
            actionText: 'Đổi Giờ',
            onTap: () {},
          ),
          const Divider(color: Color(0xFF222B38), height: 24),
          _buildHabitItem(
            icon: Icons.surround_sound,
            title: 'Âm thanh khởi động',
            subtitle: 'Mưa Mái Tôn + Gió Rừ...',
            actionText: 'Chọn Lại',
            onTap: () {},
          ),
          const Divider(color: Color(0xFF222B38), height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.notifications_active,
                    color: Color(0xFFFFC107),
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nhắc nhở chuẩn bị ngủ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Báo thức êm dịu lúc 22:30',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Switch(
                value: _isBedtimeReminderOn,
                onChanged: (val) {
                  setState(() => _isBedtimeReminderOn = val);
                  widget.onReminderChanged?.call(val);
                },
                activeThumbColor: Colors.black,
                activeTrackColor: const Color(0xFF2EE6A6),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHabitItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String actionText,
    required VoidCallback onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xFF2EE6A6), size: 20),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          ],
        ),
        OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF222B38)),
            backgroundColor: const Color(0xFF202938),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          ),
          child: Text(
            actionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
