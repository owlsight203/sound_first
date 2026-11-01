import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main_page/top/menu_category.dart';
import '../main_page/body/audio_list_view.dart';
import '../main_page/body/audio_provider.dart';
import '../main_page/body/audio_model.dart';
import '../footer/play_footer.dart';
import '../footer/bottom_navigation_menu.dart';

class LibraryPage extends ConsumerStatefulWidget {
  const LibraryPage({super.key});

  @override
  ConsumerState<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends ConsumerState<LibraryPage> {
  // Trạng thái danh mục được chọn trong trang Thư viện
  String _selectedCategory = 'Tất cả';
  final List<Map<String, dynamic>> _categories = [
    {'name': 'Tất cả', 'count': 8, 'icon': null},
    {'name': 'Tiếng Mưa', 'count': 6, 'icon': Icons.water_drop},
    {'name': 'Thiên Nhiên', 'count': 2, 'icon': Icons.eco},
    {'name': 'Tập trung', 'count': 1, 'icon': Icons.psychology},
    {'name': 'Ru ngủ', 'count': 2, 'icon': Icons.nightlight_round},
  ];

  @override
  Widget build(BuildContext context) {
    // 1. Lắng nghe bài hát đang được chọn từ Riverpod
    final currentAudio = ref.watch(currentPlayingAudioProvider);

    // 2. Lắng nghe trạng thái thực tế (đang phát / tạm dừng) từ isPlayingProvider
    final bool isPlaying = ref.watch(isPlayingProvider);

    // 3. 🌟 Sửa từ ref.read thành ref.watch để kích hoạt và giữ controller sẵn sàng
    final audioController = ref.watch(audioControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF121216), // Màu nền tối sang trọng đồng bộ
      appBar: AppBar(
        automaticallyImplyLeading: false, // Không hiển thị nút mũi tên quay lại
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
            icon: const Icon(Icons.search_rounded, color: Colors.white70),
            onPressed: () {
              // Xử lý tìm kiếm
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 130), // Chừa khoảng trống cho Footer phía dưới
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tất Cả Bản Phối',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Khám phá toàn bộ danh sách âm thanh thư giãn của bạn',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 16),

                // Thanh danh mục thể loại cho phép lọc trong Thư viện
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

                // Hiển thị toàn bộ danh sách âm thanh không giới hạn
                // Hiển thị toàn bộ danh sách âm thanh không giới hạn
                AudioListView(
                  selectedCategory: _selectedCategory,
                  limit: null,
                  onPlayAudio: (path, title, subtitle, imagePath) {
                    // 🌟 Lấy danh sách từ provider để tìm đúng AudioModel và kích hoạt controller phát nhạc
                    final allAudios = ref.read(audioListProvider);
                    final selectedAudio = allAudios.firstWhere(
                      (audio) => audio.path == path,
                      orElse: () => AudioModel(
                        title: title,
                        subtitle: subtitle,
                        duration: '60m vòng',
                        tag: '',
                        category: _selectedCategory,
                        path: path,
                        image: imagePath,
                      ),
                    );
                    
                    // Gọi AudioController để phát nhạc thực tế
                    ref.read(audioControllerProvider).playAudio(selectedAudio);
                  },
                ),
              ],
            ),
          ),

          // 👉 HIỂN THỊ PLAY FOOTER TỰ ĐỘNG THÔNG QUA RIVERPOD & AUDIOCONTROLLER
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
                  // Xử lý Play/Pause thực tế bằng AudioController
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

      // Thanh BottomNavigationBar đồng bộ giao diện
      bottomNavigationBar: const BottomNavigationMenu(),
    );
  }
}
