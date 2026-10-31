import 'package:flutter/material.dart';
import 'audio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioListView extends ConsumerWidget {
  final String selectedCategory;
  final int? limit; // Tham số giới hạn số lượng hiển thị
  final Function(String path, String title, String subtitle, String imagePath)?
      onPlayAudio;
  const AudioListView({
    super.key,
    required this.selectedCategory,
    this.limit = 3, // Mặc định hiển thị tối đa 3 item nếu không truyền vào
    this.onPlayAudio,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Lọc danh sách theo danh mục đang được chọn từ thanh MenuCategory
    final allAudios = ref.watch(audioListProvider);

    var filteredAudios = selectedCategory == 'Tất cả'
        ? allAudios
        : allAudios
            .where((audio) => audio.category == selectedCategory)
            .toList();

    // 2. Giới hạn số lượng hiển thị dựa theo limit
    if (limit != null && filteredAudios.length > limit!) {
      filteredAudios = filteredAudios.take(limit!).toList();
    }

    if (filteredAudios.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Text(
            'Chưa có âm thanh trong danh mục này',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Cuộn chung với SingleChildScrollView
      itemCount: filteredAudios.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final audio = filteredAudios[index];
        return _buildAudioCard(
            title: audio.title,
            subtitle: audio.subtitle,
            duration: audio.duration,
            tag: audio.tag,
            imagePath: audio.image,
            onTap: () {
              ref.read(currentPlayingAudioProvider.notifier).state = audio;
              if (onPlayAudio != null) {
                onPlayAudio!(
                    audio.path, audio.title, audio.subtitle, audio.image);
              }
            });
      },
    );
  }

  Widget _buildAudioCard({
    required String title,
    required String subtitle,
    required String duration,
    required String tag,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E2C),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 65,
                height: 65,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.blueGrey.shade800,
                          child: const Icon(Icons.music_note,
                              color: Colors.white54),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 4,
                      left: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00C853),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          "FREE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.refresh,
                          size: 12, color: Colors.blue.shade300),
                      const SizedBox(width: 4),
                      Text(
                        duration,
                        style: TextStyle(
                            color: Colors.blue.shade300, fontSize: 11),
                      ),
                      const Text(" • ",
                          style: TextStyle(color: Colors.grey, fontSize: 11)),
                      Text(
                        tag,
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Material(
              color: const Color(0xFF2B2B3D),
              shape: const CircleBorder(),
              child: IconButton(
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                onPressed: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
