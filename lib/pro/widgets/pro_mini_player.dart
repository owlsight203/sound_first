import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main_page/body/audio_provider.dart';

/// Thanh phát nhanh thu nhỏ (Mini Player Bar) ở cuối trang Pro
class ProMiniPlayer extends ConsumerWidget {
  const ProMiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentAudio = ref.watch(currentPlayingAudioProvider);
    final isPlaying = ref.watch(isPlayingProvider);
    final audioController = ref.watch(audioControllerProvider);

    final displayTitle = currentAudio != null ? currentAudio.title : 'Mưa Rừng & Sấm Ch...';
    final displaySubtitle = currentAudio != null ? currentAudio.subtitle : '3 âm thanh • Êm dịu';
    final bool isActuallyPlaying = currentAudio != null ? isPlaying : true;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF222B38)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF202938),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.waves, color: Color(0xFF2EE6A6), size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  displaySubtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.white60,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Icon(Icons.volume_up, color: Colors.white60, size: 20),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              if (currentAudio != null) {
                if (isPlaying) {
                  audioController.pauseAudio();
                } else {
                  audioController.continueAudio();
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFF2EE6A6),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isActuallyPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.black,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.keyboard_arrow_up, color: Colors.white60, size: 20),
        ],
      ),
    );
  }
}
