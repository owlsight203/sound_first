import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../navigation_helper.dart';
import '../pro/pro_screen.dart';

/// GlobalNavbar (Tầng 1 - Cố định ở trên cùng, đồng bộ 100% các trang):
/// Xuất hiện xuyên suốt trên mọi màn hình:
/// - Khu vực bên trái (Brand/Logo): Logo chú cú 🦉 + Tên ứng dụng Nocturn Sleep + Nhãn SLEEP
/// - Khu vực trung tâm: Whitespace tạo khoảng thoáng
/// - Khu vực bên phải (User Actions & Status): Streak 🔥 7 + Gems 💎 240 + Trạng thái ⚡ FULL + Avatar Profile
class GlobalNavbar extends ConsumerWidget implements PreferredSizeWidget {
  final int streak;
  final int gems;
  final String statusText;
  final VoidCallback? onAvatarTap;

  const GlobalNavbar({
    super.key,
    this.streak = 7,
    this.gems = 240,
    this.statusText = 'FULL',
    this.onAvatarTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFF1E1E2C),
      elevation: 0,
      titleSpacing: 14,
      toolbarHeight: 60,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: const Color(0xFF222B38).withValues(alpha: 0.6),
          height: 1,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── 1. KHU VỰC BÊN TRÁI (Brand / Logo) ─────────────────
          InkWell(
            onTap: () => handleTabNavigation(context, ref, 0),
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF161E2C),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFF2EE6A6),
                        width: 1.5,
                      ),
                    ),
                    child: const Center(
                      child: Text('🦉', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Nocturn Sleep',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B382B),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0xFF2EE6A6).withValues(alpha: 0.3),
                        width: 0.8,
                      ),
                    ),
                    child: const Text(
                      'SLEEP',
                      style: TextStyle(
                        color: Color(0xFF2EE6A6),
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── 2. KHU VỰC TRUNG TÂM (Khoảng thoáng whitespace) ────
          const SizedBox(width: 8),

          // ── 3. KHU VỰC BÊN PHẢI (User Actions & Status) ────────
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 🔥 Chuỗi ngày streak
                  GestureDetector(
                    onTap: () => handleTabNavigation(context, ref, 2),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF161E2C),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFF222B38)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('🔥', style: TextStyle(fontSize: 12)),
                          const SizedBox(width: 3),
                          Text(
                            '$streak',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),

                  // 💎 Số kim cương / tích lũy
                  GestureDetector(
                    onTap: () => handleTabNavigation(context, ref, 3),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF161E2C),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFF222B38)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('💎', style: TextStyle(fontSize: 12)),
                          const SizedBox(width: 3),
                          Text(
                            '$gems',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),

                  // ⚡ Trạng thái tài khoản FULL
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B382B),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFF2EE6A6).withValues(alpha: 0.4),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.bolt, color: Color(0xFF2EE6A6), size: 13),
                          const SizedBox(width: 2),
                          Text(
                            statusText,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2EE6A6),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),

                  // 🦉 Avatar profile (Nút truy cập nhanh vào trang cá nhân)
                  GestureDetector(
                    onTap: onAvatarTap ?? () => handleTabNavigation(context, ref, 3),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF161E2C),
                        border: Border.all(
                          color: const Color(0xFF00C853),
                          width: 1.5,
                        ),
                      ),
                      child: const Center(
                        child: Text('🦉', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
