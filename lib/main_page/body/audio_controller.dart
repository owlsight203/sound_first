import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';
import 'audio_provider.dart';
import 'audio_model.dart';

class AudioController {
  final Ref _ref;
  late final AudioPlayer _audioPlayer;

  AudioController(this._ref) {
    _audioPlayer = AudioPlayer();
    _audioPlayer.setReleaseMode(ReleaseMode.loop);

    // Lắng nghe trạng thái player thực tế để đồng bộ state
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _ref.read(isPlayingProvider.notifier).state = (state == PlayerState.playing);
    });
  }

  Future<void> playAudio(AudioModel audio) async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(audio.path));
      
      // Cập nhật bài hát hiện tại vào Riverpod
      _ref.read(currentPlayingAudioProvider.notifier).state = audio;
    } catch (e) {
      debugPrint("Lỗi phát nhạc: $e");
    }
  }

  Future<void> pauseAudio() async {
    try {
      await _audioPlayer.pause();
    } catch (e) {
      debugPrint("Lỗi tạm dừng: $e");
    }
  }

  Future<void> continueAudio() async {
    try {
      await _audioPlayer.resume();
    } catch (e) {
      debugPrint("Lỗi tiếp tục: $e");
    }
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}