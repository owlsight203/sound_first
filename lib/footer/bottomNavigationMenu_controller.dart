// Quản lý tab hiện tại của BottomNavigationBar (Mặc định là 0 hoặc 1 tùy bạn)
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentBottomTabProvider = StateProvider<int>((ref) => 0);

// Trong audio_provider.dart hoặc file provider của bạn
final isChooseTabProvider = StateProvider.family<bool, int>((ref, tabIndex) {
  final currentTab = ref.watch(currentBottomTabProvider);
  return currentTab == tabIndex; // Trả về true nếu đúng tab đang được chọn
});