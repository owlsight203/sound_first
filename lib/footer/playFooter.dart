import 'package:flutter/material.dart';

class PlayFooter extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imagePath; // 👈 Thêm tham số đường dẫn ảnh
  final bool isPlaying;
  final VoidCallback onPlayPauseToggle;

  const PlayFooter({
    super.key,
    required this.title,
    required this.subtitle,
    this.imagePath, // Không bắt buộc truyền, nếu không có sẽ hiện icon thay thế
    required this.isPlaying,
    required this.onPlayPauseToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2C),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Hiển thị ảnh bài hát đang phát ở footer
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 45,
              height: 45,
              child: imagePath != null
                  ? Image.asset(
                      imagePath!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.blueGrey.shade800,
                          child: const Icon(Icons.music_note,
                              color: Colors.white54, size: 20),
                        );
                      },
                    )
                  : Container(
                      color: Colors.blueGrey.shade800,
                      child: const Icon(Icons.music_note,
                          color: Colors.white70, size: 20),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(
              isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
              color: const Color(0xFF00C853),
              size: 38,
            ),
            onPressed: onPlayPauseToggle,
          ),
        ],
      ),
    );
  }
}
