import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'audio_model.dart';
import 'audio_controller.dart';

// 1. Danh sách âm thanh
final audioListProvider = Provider<List<AudioModel>>((ref) {
  return [
    AudioModel(
      title: 'Mưa trên mái tôn',
      subtitle: 'Tiếng mưa gõ nhịp nhàng • Gợi nhớ',
      duration: '60m vòng',
      tag: 'Bình yên',
      category: 'Tiếng Mưa',
      path: 'audios/roof_rain_tin.wav',
      image: 'assets/images/rain.png',
    ),
    AudioModel(
      title: 'Mưa gió',
      subtitle: 'Tiếng mưa giông rả rích',
      duration: '60m vòng',
      tag: 'Thư giãn',
      category: 'Tiếng Mưa',
      path: 'audios/storm_tin.wav',
      image: 'assets/images/rain.png',
    ),
    AudioModel(
      title: 'Mưa gió 1',
      subtitle: 'Tiếng gió rít và mưa lớn',
      duration: '60m vòng',
      tag: 'Ru ngủ',
      category: 'Ru ngủ',
      path: 'audios/storm_tin1.wav',
      image: 'assets/images/rain.png',
    ),
    AudioModel(
      title: 'Brown Noise',
      subtitle: 'Âm thanh trầm đều giúp tập trung',
      duration: '60m vòng',
      tag: 'Tập trung',
      category: 'Tập trung',
      path: 'audios/brown_noise.wav',
      image: 'assets/images/rain.png',
    ),
    AudioModel(
      title: 'Mưa xa',
      subtitle: 'Tiếng mưa rơi từ xa vọng lại',
      duration: '60m vòng',
      tag: 'Êm dịu',
      category: 'Tiếng Mưa',
      path: 'audios/rain_far.wav',
      image: 'assets/images/rain.png',
    ),
    AudioModel(
      title: 'Mưa xa kèm gió',
      subtitle: 'Mưa và gió thổi hiu hắt',
      duration: '60m vòng',
      tag: 'Thanh thản',
      category: 'Tiếng Mưa',
      path: 'audios/rain_wind(farrain&wind).wav',
      image: 'assets/images/rain.png',
    ),
    AudioModel(
      title: 'Mưa cửa sổ',
      subtitle: 'Tiếng mưa đập vào kính cửa sổ',
      duration: '60m vòng',
      tag: 'Sâu lắng',
      category: 'Tiếng Mưa',
      path: 'audios/window_rain.wav',
      image: 'assets/images/rain.png',
    ),
    AudioModel(
      title: 'Phát âm thanh gió',
      subtitle: 'Tiếng gió thoảng qua nhẹ nhàng',
      duration: '60m vòng',
      tag: 'Thoáng đãng',
      category: 'Thiên Nhiên',
      path: 'audios/breeze.wav',
      image: 'assets/images/rain.png',
    ),
  ];
});

// 2. Bài hát đang chọn/phát
final currentPlayingAudioProvider = StateProvider<AudioModel?>((ref) => null);

// 3. 🌟 Bổ sung StateProvider trạng thái phát nhạc (Đang phát: true, Tạm dừng: false)
final isPlayingProvider = StateProvider<bool>((ref) => false);

// 4. 🌟 Bổ sung Provider quản lý AudioController toàn cục
final audioControllerProvider = Provider<AudioController>((ref) {
  final controller = AudioController(ref);
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});