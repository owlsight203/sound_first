import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Các thành phần giao diện khác
import 'main_page/top/banner_menu.dart';
import 'main_page/top/menu_category.dart';
import 'footer/play_footer.dart';
import 'footer/bottom_navigation_menu.dart';
import 'footer/bottom_navigation_menu_controller.dart';
import 'main_page/body/audio_list_view.dart';
import 'main_page/body/sleep_timer_widget.dart';

import 'main_page/body/audio_provider.dart';
import 'main_page/body/audio_model.dart';
import 'navigation_helper.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpleAudioScreen(),
    );
  }
}

class SimpleAudioScreen extends ConsumerStatefulWidget {
  const SimpleAudioScreen({super.key});

  @override
  ConsumerState<SimpleAudioScreen> createState() => _SimpleAudioScreenState();
}

class _SimpleAudioScreenState extends ConsumerState<SimpleAudioScreen> {
  String _selectedCategory = 'Tất cả';
  final List<Map<String, dynamic>> _categories = [
    {'name': 'Tất cả', 'count': 8, 'icon': null},
    {'name': 'Tiếng Mưa', 'count': 6, 'icon': Icons.water_drop},
    {'name': 'Thiên Nhiên', 'count': 2, 'icon': Icons.eco},
    {'name': 'Tập trung', 'count': 1, 'icon': Icons.psychology},
    {'name': 'Ru ngủ', 'count': 2, 'icon': Icons.nightlight_round},
  ];

  @override
  void initState() {
    super.initState();
    // Đảm bảo khi mới vào app luôn ở màn chính (Tab 0: Trang chủ)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(currentBottomTabProvider.notifier).state = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 💡 Lấy dữ liệu và controller thông qua Riverpod
    final currentAudio = ref.watch(currentPlayingAudioProvider);
    final isPlaying = ref.watch(isPlayingProvider);
    final audioController = ref.read(audioControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF121216),
      appBar: AppBar(
        title: const Text(
          'Nocturn Sleep',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1E1E2C),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_rounded, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 165),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Khám Phá Không Gian',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Chọn âm thanh yêu thích để bắt đầu thư giãn',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 16),
                  PromoBanner(
                    badgeText: 'ĐẶC BIỆT HÔM NAY',
                    title: 'Gói Thư Giãn Đỉnh Cao',
                    description:
                        'Trải nghiệm không gian âm thanh tự nhiên chất lượng cao giúp dễ ngủ và tập trung.',
                    icon: Icons.spa_rounded,
                    onTap: () {
                      handleTabNavigation(context, ref, 1);
                    },
                  ),
                  const SizedBox(height: 20),
                  MenuCategory(
                    categories: _categories,
                    selectedCategory: _selectedCategory,
                    onCategorySelected: (categoryName) {
                      setState(() {
                        _selectedCategory = categoryName;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Gợi Ý Nổi Bật',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          handleTabNavigation(context, ref, 1);
                        },
                        style: TextButton.styleFrom(
                          minimumSize: const Size(48, 44),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Xem tất cả',
                              style: TextStyle(
                                color: Color(0xFF00C853),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 11,
                              color: Color(0xFF00C853),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 8),
                AudioListView(
                  selectedCategory: _selectedCategory,
                  limit: 3,
                  onPlayAudio: (path, title, subtitle, image) {
                    final audio = AudioModel(
                      title: title,
                      subtitle: subtitle,
                      duration: '',
                      tag: '',
                      category: _selectedCategory,
                      path: path,
                      image: image,
                    );
                    audioController.playAudio(audio);
                  },
                ),
                const SizedBox(height: 32),
                const Text(
                  'Hẹn Giờ Ngủ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tự động tắt nhạc để tiết kiệm pin khi bạn chìm vào giấc ngủ',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 16),
                SleepTimerWidget(
                  onTimerFinished: () {
                    audioController.pauseAudio();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Đã hết giờ hẹn. Âm thanh đã tự động tắt!'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          if (currentAudio != null)
            Positioned(
              left: 16,
              right: 16,
              bottom: 30,
              child: PlayFooter(
                title: currentAudio.title,
                subtitle: currentAudio.subtitle,
                imagePath: currentAudio.image,
                isPlaying: isPlaying,
                onPlayPauseToggle: () {
                  if (isPlaying) {
                    audioController.pauseAudio();
                  } else {
                    audioController.continueAudio();
                  }
                },
              ),
            ),
        ],
      ),
    ),
    bottomNavigationBar: const BottomNavigationMenu(),
    );
  }
}
