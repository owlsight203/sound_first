// lib/navigation_helper.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'library/library_page.dart';
import 'profile/profile_screen.dart';
import 'stats/stats_screen.dart';
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
    // Sang Cá nhân / Tài khoản (ProfileScreen)
    if (currentIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      ).then((_) {
        // Khi quay lại Trang Chủ, tự động trả tab về 0
        ref.read(currentBottomTabProvider.notifier).state = 0;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      ).then((_) {
        ref.read(currentBottomTabProvider.notifier).state = 0;
      });
    }
  } else if (targetIndex == 2) {
    // Sang Thống Kê (StatsScreen)
    if (currentIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const StatsScreen()),
      ).then((_) {
        ref.read(currentBottomTabProvider.notifier).state = 0;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StatsScreen()),
      ).then((_) {
        ref.read(currentBottomTabProvider.notifier).state = 0;
      });
    }
  }
}
