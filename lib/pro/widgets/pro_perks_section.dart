import 'package:flutter/material.dart';

/// Danh sách quyền lợi đặc quyền của gói Duolingo Super Quality Perks
class ProPerksSection extends StatelessWidget {
  const ProPerksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF222B38)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DUOLINGO SUPER QUALITY\nPERKS',
                style: TextStyle(
                  color: Color(0xFFFFC107),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              Text(
                'Tất cả mở khóa\n100%',
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white60, fontSize: 11),
              ),
            ],
          ),
          SizedBox(height: 16),
          ProPerkItem(
            icon: Icons.block,
            iconColor: Colors.redAccent,
            title: '100% Zero Ad Interruptions',
            description:
                'Không có quảng cáo làm phiền nửa đêm, giữ trọn vẹn trạng thái tĩnh lặng.',
          ),
          SizedBox(height: 16),
          ProPerkItem(
            icon: Icons.headphones,
            iconColor: Colors.blueAccent,
            title: 'Mix Up to 10 Sounds Simultaneously',
            description:
                'Gấp 3 lần bản thường: phối mưa rừng đới, sấm chớp, lửa trại và sóng biển.',
          ),
          SizedBox(height: 16),
          ProPerkItem(
            icon: Icons.flight,
            iconColor: Colors.tealAccent,
            title: 'Unlimited Offline Downloads',
            description:
                'Thư thái nghe trọn vẹn trên chuyến bay dài, cắm trại ngoài trời hoặc khi tắt Wifi.',
          ),
          SizedBox(height: 16),
          ProPerkItem(
            icon: Icons.psychology,
            iconColor: Colors.orangeAccent,
            title: 'Scientific Delta & Theta Binaural Beats',
            description:
                'Kích hoạt sóng não ngủ sâu đã được kiểm nghiệm, giải tỏa căng thẳng thần kinh nhanh chóng.',
          ),
        ],
      ),
    );
  }
}

/// Widget cho từng dòng quyền lợi riêng biệt
class ProPerkItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  const ProPerkItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF202938),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white60,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
