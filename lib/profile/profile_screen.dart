import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../footer/bottom_navigation_menu.dart';
import '../footer/play_footer.dart';
import '../main_page/body/audio_provider.dart';
import '../navbar/global_navbar.dart';
import '../navbar/page_header.dart';
import '../pro/pro_screen.dart';

import 'widgets/profile_header.dart';
import 'widgets/level_progress_card.dart';
import 'widgets/stats_quick_row.dart';
import 'widgets/wardrobe_section.dart';
import 'widgets/special_pet_banner.dart';
import 'widgets/sleep_habits_section.dart';
import 'widgets/app_settings_section.dart';
import 'widgets/support_footer.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  void _openProScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentAudio = ref.watch(currentPlayingAudioProvider);
    final isPlaying = ref.watch(isPlayingProvider);
    final audioController = ref.watch(audioControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F141C),
      appBar: const GlobalNavbar(),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 165),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. PAGE HEADER (Tầng 2 - Tiêu đề trang chuẩn hóa)
                  const PageHeader(
                    title: 'Hồ Sơ Cá Nhân',
                    subtitle: 'Quản lý thông tin tài khoản và thiết lập thói quen ngủ',
                  ),

                  // 2. PROFILE AVATAR & LEVEL INFO
                  const ProfileHeader(),
                  const SizedBox(height: 16),

                  // 3. LEVEL PROGRESS CARD
                  const LevelProgressCard(),
                  const SizedBox(height: 16),

                  // 4. STATS QUICK OVERVIEW (7 Ngày, 240 Mộng Tưởng, Top 5%)
                  const StatsQuickRow(),
                  const SizedBox(height: 24),

                  // 5. AVATAR & PET WARDROBE (Tủ đồ)
                  const WardrobeSection(),
                  const SizedBox(height: 16),

                  // 6. SPECIAL PRO PET BANNER
                  SpecialPetBanner(
                    onExplore: _openProScreen,
                  ),
                  const SizedBox(height: 16),

                  // 7. SLEEP HABITS & GOALS
                  const SleepHabitsSection(),
                  const SizedBox(height: 24),

                  // 8. APP SETTINGS SECTION
                  AppSettingsSection(
                    onUpgradePro: _openProScreen,
                  ),
                  const SizedBox(height: 24),

                  // 9. SUPPORT & FOOTER VERSION
                  const SupportFooter(),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // Mini player nổi nếu đang phát nhạc
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
