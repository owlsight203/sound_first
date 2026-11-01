// lib/navigation_helper.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'library/library_page.dart';
import 'footer/bottom_navigation_menu_controller.dart';


void handleTabNavigation(BuildContext context, WidgetRef ref, int targetIndex) {
  final currentIndex = ref.read(currentBottomTabProvider);

  // Nếu bấm lại đúng tab hiện tại thì không làm gì cả
  if (currentIndex == targetIndex) return;

  // 1. Cập nhật state tab vào Riverpod để đổi màu UI sang tab mới ngay lập tức
  ref.read(currentBottomTabProvider.notifier).state = targetIndex;

  // 2. Xử lý chuyển trang thực tế dựa theo tab được bấm
  if (targetIndex == 0) {
    // Về Trang Chủ (Home): Pop màn hình phụ hiện tại nếu đang đứng ở LibraryPage
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  } else if (targetIndex == 1) {
    // Sang Chủ Đề (LibraryPage)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LibraryPage()),
    ).then((_) {
      // Khi người dùng bấm quay lại Trang Chủ bằng nút Back, tự động trả tab về 0
      ref.read(currentBottomTabProvider.notifier).state = 0;
    });
  } else if (targetIndex == 2 || targetIndex == 3) {
    // Dành cho các tab tương lai (Thống Kê = 2, Pro Club = 3)
    // Tạm thời nếu bấm vào, bạn có thể hiện thông báo hoặc giữ nguyên màn hình hiện tại
    // Đồng thời trả lại state cũ nếu chưa muốn chuyển tab
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tính năng đang phát triển, sẽ ra mắt sớm!'),
        duration: Duration(seconds: 1),
      ),
    );
    
    // Trả lại màu cho tab cũ vì chưa có màn hình mới
    ref.read(currentBottomTabProvider.notifier).state = currentIndex;
  }
}