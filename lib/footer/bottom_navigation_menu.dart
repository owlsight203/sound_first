import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../navigation_helper.dart';
import 'bottom_navigation_menu_controller.dart';

class BottomNavigationMenu extends ConsumerWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentBottomTabProvider);

    // Xác định tab đang chọn trực tiếp từ currentIndex
    final bool isChooseHome = currentIndex == 0;
    final bool isChooseLibrary = currentIndex == 1;
    final bool isChooseStats = currentIndex == 2;
    final bool isChooseProfile = currentIndex == 3;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2C),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            handleTabNavigation(context, ref, index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: const Color(0xFF00C853),
          unselectedItemColor: Colors.grey.shade500,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.tune_rounded,
                color: isChooseHome ? const Color(0xFF00C853) : Colors.grey.shade500,
              ),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.nightlight_round,
                color: isChooseLibrary ? const Color(0xFF00C853) : Colors.grey.shade500,
              ),
              label: 'Chủ đề',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.hourglass_bottom_rounded,
                color: isChooseStats ? const Color(0xFF00C853) : Colors.grey.shade500,
              ),
              label: 'Thống kê',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isChooseProfile
                      ? const Color(0xFF1B382B)
                      : const Color(0xFF202938),
                  border: Border.all(
                    color: isChooseProfile
                        ? const Color(0xFF00C853)
                        : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: const Center(
                  child: Text('🦉', style: TextStyle(fontSize: 13)),
                ),
              ),
              label: 'Cá nhân',
            ),
          ],
        ),
      ),
    );
  }
}