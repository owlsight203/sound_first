// lib/navigation_helper.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'library/library_page.dart';
import 'pro/pro_screen.dart';
import 'footer/bottom_navigation_menu_controller.dart';

void handleTabNavigation(BuildContext context, WidgetRef ref, int targetIndex) {
  final currentIndex = ref.read(currentBottomTabProvider);

  // Nếu bấm lại đúng tab hiện tại thì không làm gì cả
  if (currentIndex == targetIndex) return;

  // 1. Cập nhật state tab vào Riverpod để đổi màu UI sang tab mới ngay lập tức
  ref.read(currentBottomTabProvider.notifier).state = targetIndex;

  // 2. Xử lý chuyển trang thực tế dựa theo tab được bấm
  if (targetIndex == 0) {
    // Về Trang Chủ (Home): Pop tất cả các màn hình phụ để về màn hình gốc
    Navigator.popUntil(context, (route) => route.isFirst);
    ref.read(currentBottomTabProvider.notifier).state = 0;
  } else if (targetIndex == 1) {
    // Sang Chủ Đề (LibraryPage)
    if (currentIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LibraryPage()),
      ).then((_) {
        // Khi quay lại Trang Chủ, tự động trả tab về 0
        ref.read(currentBottomTabProvider.notifier).state = 0;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LibraryPage()),
      ).then((_) {
        ref.read(currentBottomTabProvider.notifier).state = 0;
      });
    }
  } else if (targetIndex == 3) {
    // Sang Pro Club (ProScreen)
    if (currentIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProScreen()),
      ).then((_) {
        // Khi quay lại Trang Chủ, tự động trả tab về 0
        ref.read(currentBottomTabProvider.notifier).state = 0;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProScreen()),
      ).then((_) {
        ref.read(currentBottomTabProvider.notifier).state = 0;
      });
    }
  } else if (targetIndex == 2) {
    // Dành cho tab tương lai (Thống Kê = 2)
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
