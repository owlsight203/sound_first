import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../footer/bottom_navigation_menu.dart';
import '../footer/play_footer.dart';
import '../main_page/body/audio_provider.dart';
import '../navbar/global_navbar.dart';
import '../navbar/page_header.dart';

class StatsScreen extends ConsumerStatefulWidget {
  const StatsScreen({super.key});

  @override
  ConsumerState<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends ConsumerState<StatsScreen> {
  // 0 = Tuần Này, 1 = Tháng Này, 2 = Mọi Lúc
  int selectedTab = 0;

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
                  PageHeader(
                    title: 'Thống Kê Lượt Nghe',
                    subtitle: 'Nhật ký giải phóng tâm trí và chu kỳ ngủ',
                    action: _buildUpdateButton(),
                  ),
                  const SizedBox(height: 16),
                  _buildTimeTabs(),
                  const SizedBox(height: 16),
                  _buildStatsGrid(),
                  const SizedBox(height: 16),
                  _buildWeeklyDurationBanner(),
                  const SizedBox(height: 16),
                  _buildWeeklyChartSection(),
                  const SizedBox(height: 16),
                  _buildTopSoundsSection(),
                  const SizedBox(height: 16),
                  _buildAiAdviceCard(),
                  const SizedBox(height: 16),
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

  // ─── ACTION BUTTON ─────────────────────────────────────────────────────────

  Widget _buildUpdateButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1B382B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: const Color(0xFF2EE6A6).withValues(alpha: 0.3)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _GreenDot(),
          SizedBox(width: 6),
          Text(
            'CẬP NHẬT',
            style: TextStyle(
                color: Color(0xFF2EE6A6),
                fontSize: 11,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // ─── TIME TABS ─────────────────────────────────────────────────────────────

  Widget _buildTimeTabs() {
    const tabs = ['Tuần Này', 'Tháng Này', 'Mọi Lúc'];
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedTab == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedTab = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF2EE6A6)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tabs[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? Colors.black87 : Colors.white60,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ─── STATS GRID ────────────────────────────────────────────────────────────

  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.15,
      children: [
        _buildCard(
          icon: Icons.nightlight_round,
          iconColor: Colors.blueAccent,
          badgeText: '~+14%',
          badgeColor: const Color(0xFF1B382B),
          badgeTextColor: const Color(0xFF2EE6A6),
          title: 'TỔNG RU NGỦ',
          content: '38h 45m',
          subContent: 'TB ~5.5h / đêm',
        ),
        _buildCard(
          icon: Icons.local_fire_department,
          iconColor: Colors.orangeAccent,
          badgeText: 'Kỷ Lục',
          badgeColor: const Color(0xFF33291B),
          badgeTextColor: const Color(0xFFFFC107),
          title: 'CHUỖI NGỦ CHUẨN',
          content: '7 Đêm 🔥',
          subContent: 'Đúng giờ 23:00',
        ),
        _buildCard(
          icon: Icons.favorite,
          iconColor: Colors.redAccent,
          badgeText: '-35%',
          badgeColor: const Color(0xFF1B382B),
          badgeTextColor: const Color(0xFF2EE6A6),
          title: 'VÀO GIẤC TB',
          content: '12 Phút',
          subContent: 'Nhanh hơn 8p',
          subColor: const Color(0xFF2EE6A6),
        ),
        _buildCard(
          icon: Icons.cloud_queue,
          iconColor: Colors.lightBlueAccent,
          badgeText: '#1 Yêu Thích',
          badgeColor: const Color(0xFF192538),
          badgeTextColor: Colors.lightBlueAccent,
          title: 'NGHE NHIỀU NHẤT',
          content: 'Mưa Mái Tôn',
          subContent: '14.2 giờ thư giãn',
        ),
      ],
    );
  }

  Widget _buildCard({
    required IconData icon,
    required Color iconColor,
    required String badgeText,
    required Color badgeColor,
    required Color badgeTextColor,
    required String title,
    required String content,
    required String subContent,
    Color? subColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF222B38)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF202938),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 16),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                      color: badgeTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(content,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 2),
              Text(subContent,
                  style: TextStyle(
                      fontSize: 11, color: subColor ?? Colors.white60)),
            ],
          ),
        ],
      ),
    );
  }

  // ─── WEEKLY BANNER ─────────────────────────────────────────────────────────

  Widget _buildWeeklyDurationBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF222B38)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thời Lượng Ru Ngủ Trong Tuần',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  'Mục tiêu tối ưu: 8 giờ mỗi đêm',
                  style: TextStyle(fontSize: 12, color: Colors.white60),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF1B382B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.verified_outlined,
                    color: Color(0xFF2EE6A6), size: 14),
                SizedBox(width: 4),
                Text(
                  '+2.4h vs T.Trước',
                  style: TextStyle(
                      color: Color(0xFF2EE6A6),
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── WEEKLY CHART ──────────────────────────────────────────────────────────

  Widget _buildWeeklyChartSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF222B38)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mục tiêu: 8h',
            style: TextStyle(fontSize: 12, color: Colors.white54),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildChartBar('4.8h', 0.50, false, 'T2'),
              _buildChartBar('5.2h', 0.55, false, 'T3'),
              _buildChartBar('6.0h', 0.65, false, 'T4'),
              _buildChartBar('4.5h', 0.45, false, 'T5'),
              _buildChartBar('6.8h', 0.75, false, 'T6'),
              _buildChartBar('7.4h', 0.90, true, 'T7'),
              _buildChartBar('7.5h', 0.95, true, 'CN'),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFF222B38), thickness: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Cuối tuần (T7 – CN): Ngủ sâu nhất đạt đỉnh 7.5h',
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF332A1B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Đạt Chuẩn\n94%',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFFFFC107),
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartBar(
      String value, double heightFactor, bool isHighlight, String day) {
    final color =
        isHighlight ? const Color(0xFF2EE6A6) : Colors.white60;
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 10, color: color)),
        const SizedBox(height: 6),
        Container(
          width: 28,
          height: 100 * heightFactor,
          decoration: BoxDecoration(
            color: isHighlight
                ? const Color(0xFF2EE6A6)
                : const Color(0xFF202938),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Text(day,
            style: TextStyle(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  // ─── TOP SOUNDS ────────────────────────────────────────────────────────────

  Widget _buildTopSoundsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF222B38)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Âm Thanh Yêu Thích',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Icon(Icons.bar_chart, color: Colors.white60, size: 20),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            'Phân bổ 38.5 giờ phát liên tục',
            style: TextStyle(fontSize: 12, color: Colors.white60),
          ),
          const SizedBox(height: 16),
          _buildSoundItem(
              rank: '1',
              icon: Icons.cloud_outlined,
              title: 'Mưa Trên Mái Tôn',
              time: '14.2 giờ nghe • 36% tổng số',
              percent: '36%',
              progress: 0.36),
          const SizedBox(height: 14),
          _buildSoundItem(
              rank: '2',
              icon: Icons.waves,
              title: 'Brown Noise Sóng Delta',
              time: '10.5 giờ nghe • 27% tổng số',
              percent: '27%',
              progress: 0.27),
          const SizedBox(height: 14),
          _buildSoundItem(
              rank: '3',
              icon: Icons.forest,
              title: 'Tiếng Gió Rừng Đêm',
              time: '7.8 giờ nghe • 20% tổng số',
              percent: '20%',
              progress: 0.20),
          const SizedBox(height: 14),
          _buildSoundItem(
              rank: '4',
              icon: Icons.local_fire_department,
              title: 'Lửa Than Bếp Ấm',
              time: '6.0 giờ nghe • 17% tổng số',
              percent: '17%',
              progress: 0.17),
        ],
      ),
    );
  }

  Widget _buildSoundItem({
    required String rank,
    required IconData icon,
    required String title,
    required String time,
    required String percent,
    required double progress,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF202938),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(rank,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xFF2EE6A6))),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white)),
                  const SizedBox(height: 2),
                  Text(time,
                      style: const TextStyle(
                          fontSize: 11, color: Colors.white60)),
                ],
              ),
            ),
            Text(percent,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xFF2EE6A6))),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: const Color(0xFF202938),
            color: const Color(0xFF2EE6A6),
            minHeight: 4,
          ),
        ),
      ],
    );
  }

  // ─── AI ADVICE ─────────────────────────────────────────────────────────────

  Widget _buildAiAdviceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2C),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF222B38)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🦉', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Lời Khuyên Cú Nocturne',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B382B),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('AI Sync',
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF2EE6A6),
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                  fontSize: 13, color: Colors.white70, height: 1.4),
              children: [
                TextSpan(text: 'Bạn thường vào giấc dễ nhất lúc '),
                TextSpan(
                    text: '23:15',
                    style: TextStyle(
                        color: Color(0xFF2EE6A6),
                        fontWeight: FontWeight.bold)),
                TextSpan(text: ' khi kết hợp '),
                TextSpan(
                    text: 'Mưa Mái Tôn',
                    style: TextStyle(
                        color: Color(0xFF2EE6A6),
                        fontWeight: FontWeight.bold)),
                TextSpan(text: ' + '),
                TextSpan(
                    text: 'Sóng Não Alpha',
                    style: TextStyle(
                        color: Color(0xFFFFC107),
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        '. Giữ vững phong độ này để nhận huy hiệu "Bậc Thầy Tĩnh Tâm" nhé!'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2EE6A6),
                foregroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                elevation: 4,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.share, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Chia Sẻ Thành Tích Ngủ (+30 💎)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
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

// ─── HELPER WIDGET ─────────────────────────────────────────────────────────

class _GreenDot extends StatelessWidget {
  const _GreenDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: const BoxDecoration(
          color: Color(0xFF2EE6A6), shape: BoxShape.circle),
    );
  }
}
