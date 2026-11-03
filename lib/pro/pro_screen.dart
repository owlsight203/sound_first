import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../footer/bottom_navigation_menu.dart';
import '../footer/bottom_navigation_menu_controller.dart';
import '../navigation_helper.dart';
import 'widgets/pro_header.dart';
import 'widgets/pro_title.dart';
import 'widgets/pro_rating_card.dart';
import 'widgets/pro_free_pass_card.dart';
import 'widgets/pro_divider.dart';
import 'widgets/pro_membership_header.dart';
import 'widgets/pro_membership_options.dart';
import 'widgets/pro_unlock_button.dart';

/// Màn hình gói hội viên Nocturne Super / PRO
class ProScreen extends ConsumerStatefulWidget {
  const ProScreen({super.key});

  @override
  ConsumerState<ProScreen> createState() => _ProScreenState();
}

// Định danh phụ tương thích theo tên gọi NocturneSuperScreen trong file yêu cầu
typedef NocturneSuperScreen = ProScreen;

class _ProScreenState extends ConsumerState<ProScreen> {
  // Biến quản lý gói đang chọn: true = Lifetime, false = 12 Months
  bool isLifetimeSelected = true;

  @override
  void initState() {
    super.initState();
    // Đồng bộ trạng thái tab Pro Club (tab 3) vào Riverpod
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(currentBottomTabProvider.notifier).state = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F141C),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. HEADER BADGE & LOGO
              ProHeader(
                onClose: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    handleTabNavigation(context, ref, 0);
                  }
                },
              ),
              const SizedBox(height: 24),

              // 2. MAIN TITLES & DESCRIPTION
              const ProTitle(),
              const SizedBox(height: 16),

              // 3. RATING BAR
              const ProRatingCard(),
              const SizedBox(height: 24),

              // 4. DUOLINGO-STYLE FREE PASS SECTION
              const ProFreePassCard(),
              const SizedBox(height: 24),

              // 5. DIVIDER: OR GO FULLY AD-FREE FOREVER
              const ProDividerSection(title: 'OR GO FULLY AD-FREE FOREVER'),
              const SizedBox(height: 20),

              // 6. SELECT MEMBERSHIP TITLE & BADGE
              const ProMembershipHeader(),
              const SizedBox(height: 16),

              // 7. MEMBERSHIP OPTIONS (Lifetime vs 12 Months)
              ProMembershipOptions(
                isLifetimeSelected: isLifetimeSelected,
                onSelectOption: (isLifetime) {
                  setState(() {
                    isLifetimeSelected = isLifetime;
                  });
                },
              ),
              const SizedBox(height: 20),

              // 8. UNLOCK NOCTURNE PRO FOREVER BUTTON
              ProUnlockButton(
                isLifetime: isLifetimeSelected,
              ),
              const SizedBox(height: 28),


              // 11. MINI PLAYER BAR AT THE BOTTOM
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationMenu(),
    );
  }
}
