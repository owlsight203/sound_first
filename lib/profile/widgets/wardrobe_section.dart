import 'package:flutter/material.dart';

/// Mục Tủ Đồ Avatar & Linh Vật Đêm
class WardrobeSection extends StatelessWidget {
  const WardrobeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '👕 Tủ Đồ Avatar & Linh Vật Đêm',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              '2/5 Mở Khóa',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF2EE6A6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _AvatarCard(
                name: 'Cú Mũ Ngủ',
                sub: 'Mặc định ban đầu',
                btnText: 'Đang Dùng',
                isUsing: true,
                emoji: '🦉',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _AvatarCard(
                name: 'Cú Chiêm Tinh',
                sub: 'Cấp 5',
                btnText: 'Sử Dụng',
                isUsing: false,
                emoji: '🧙‍♂️',
                isReady: true,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _AvatarCard(
                name: 'Cú Hoàng Gia',
                sub: '300 💎',
                btnText: 'Mở Khóa',
                isUsing: false,
                emoji: '👑',
                isLockedByGems: true,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _AvatarCard(
                name: 'Cú DJ Lo-Fi',
                sub: 'Yêu cầu Cấp 10',
                btnText: 'Chưa Mở',
                isUsing: false,
                emoji: '🎧',
                isLocked: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AvatarCard extends StatelessWidget {
  final String name;
  final String sub;
  final String btnText;
  final bool isUsing;
  final String emoji;
  final bool isReady;
  final bool isLockedByGems;
  final bool isLocked;

  const _AvatarCard({
    required this.name,
    required this.sub,
    required this.btnText,
    required this.isUsing,
    required this.emoji,
    this.isReady = false,
    this.isLockedByGems = false,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isUsing ? const Color(0xFF2EE6A6) : const Color(0xFF222B38),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 24)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isUsing
                      ? const Color(0xFF1B382B)
                      : const Color(0xFF202938),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  isUsing ? 'Đang Dùng' : (isReady ? 'Cấp 5' : sub),
                  style: TextStyle(
                    color: isUsing
                        ? const Color(0xFF2EE6A6)
                        : Colors.white60,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            isReady ? 'Đã Sẵn Sàng' : sub,
            style: TextStyle(
              fontSize: 11,
              color: isReady ? const Color(0xFF2EE6A6) : Colors.white60,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isUsing
                    ? const Color(0xFF202938)
                    : (isLocked || isLockedByGems
                        ? const Color(0xFF202938)
                        : const Color(0xFF2EE6A6)),
                foregroundColor: isUsing || isLocked || isLockedByGems
                    ? Colors.white70
                    : Colors.black87,
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: Text(
                btnText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
