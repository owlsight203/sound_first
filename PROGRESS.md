# 📋 PROGRESS.md — Nocturn Sleep (sound_first)

> Cập nhật lần cuối: 2026-11-03  
> Branch chính: `main` | Remote: `git@github.com:owlsight203/sound_first.git`

---

## 🗂️ Tổng quan dự án

**Tên app:** Nocturn Sleep  
**Package:** `sound_first`  
**Framework:** Flutter (Dart) — SDK `>=3.3.4 <4.0.0`  
**State management:** Riverpod (`flutter_riverpod: ^2.6.1`)  
**Audio engine:** `audioplayers: ^6.0.0`  
**Version hiện tại:** `1.0.0+1`

**Mô tả:** App phát âm thanh thư giãn / ru ngủ (tiếng mưa, brown noise, gió, thiên nhiên) với hẹn giờ tắt tự động, bộ lọc danh mục, mini player, màn hình thống kê và trung tâm cá nhân / cài đặt.

---

## 🏗️ Kiến trúc thư mục

```
lib/
├── main.dart                        # Entry point, SimpleAudioScreen (Trang Chủ) + Avatar mở Profile ở góc phải
├── navigation_helper.dart           # Điều phối chuyển tab toàn cục (4 tab)
│
├── main_page/
│   ├── top/
│   │   ├── banner_menu.dart         # Banner "Gói Thư Giãn Đỉnh Cao" + CTA
│   │   ├── menu_category.dart       # Chip lọc danh mục ngang
│   │   └── stat_card.dart           # Widget thẻ thống kê nhỏ
│   └── body/
│       ├── audio_model.dart         # Model: AudioModel (title, subtitle, path, category…)
│       ├── audio_provider.dart      # Riverpod providers: audioList, currentAudio, isPlaying, controller
│       ├── audio_controller.dart    # AudioController: play/pause/resume/dispose
│       ├── audio_list_view.dart     # ListView danh sách âm thanh có lọc + giới hạn
│       └── sleep_timer_widget.dart  # Widget hẹn giờ tắt (circular countdown, presets 15/30/45/60p)
│
├── footer/
│   ├── play_footer.dart             # Mini player nổi (title, play/pause, ảnh)
│   ├── bottom_navigation_menu.dart  # BottomNavigationBar 4 tab (Avatar tròn ở Tab 4)
│   └── bottom_navigation_menu_controller.dart  # StateProvider<int> currentBottomTabProvider
│
├── library/
│   └── library_page.dart            # Tab "Chủ Đề" — toàn bộ danh sách + lọc danh mục
│
├── stats/
│   └── stats_screen.dart            # Tab "Thống Kê" — Màn hình Thống Kê Lượt Nghe
│
├── profile/                         # ✅ MỚI — Màn hình Cá Nhân & Cài Đặt (avt_setting_req.txt)
│   ├── profile_screen.dart          # Màn hình chính Tab 4 (kết nối mini player, PRO link)
│   └── widgets/
│       ├── profile_top_bar.dart     # Top bar: Logo Nocturne + Streak + Gems + FULL
│       ├── profile_header.dart      # Avatar tròn + Tên người dùng + ID + Danh hiệu
│       ├── level_progress_card.dart # Card tiến trình Level 9 (XP bar + nhận thưởng)
│       ├── stats_quick_row.dart     # 3 ô thống kê nhanh (Chuỗi ngủ, Mộng tưởng, Top %)
│       ├── wardrobe_section.dart    # Tủ đồ Avatar & Linh vật (4 thẻ Cú đêm)
│       ├── special_pet_banner.dart  # Banner linh vật độc quyền PRO: Mèo Thiền Định
│       ├── sleep_habits_section.dart# Mục tiêu & thói quen ngủ (Giờ ngủ, Âm thanh, Nhắc nhở)
│       ├── app_settings_section.dart# Cài đặt app (Banner PRO, Hi-Fi Lossless, Chạy nền, Backup JSON)
│       └── support_footer.dart      # Hỗ trợ FAQ, Đánh giá 5 sao, Phiên bản app
│
└── pro/
    ├── pro_screen.dart              # Màn hình chi tiết Pro Club (truy cập từ Banner PRO trong Profile)
    └── widgets/
        ├── pro_header.dart
        ├── pro_title.dart
        ├── pro_divider.dart
        ├── pro_membership_header.dart
        ├── pro_membership_options.dart
        ├── pro_rating_card.dart
        ├── pro_free_pass_card.dart
        └── pro_unlock_button.dart
```

---

## 📱 Màn hình & Navigation

| Tab | Index | Screen | File | Mô tả |
|-----|-------|--------|------|-------|
| Trang chủ | 0 | `SimpleAudioScreen` | `main.dart` | Khám phá âm thanh, banner, timer, mini player |
| Chủ Đề | 1 | `LibraryPage` | `library/library_page.dart` | Danh sách đầy đủ các bản phối |
| Thống Kê | 2 | `StatsScreen` | `stats/stats_screen.dart` | Biểu đồ tuần, top âm thanh, lời khuyên Cú |
| Cá nhân | 3 | `ProfileScreen` | `profile/profile_screen.dart` | Avatar, tủ đồ, thói quen ngủ, cài đặt & PRO |

**Truy cập nhanh vào Cá nhân (Profile/Settings):**
1. Nhấn vào **Tab 4 (Cá nhân)** ở thanh Bottom Navigation Bar (icon avatar tròn 🦉).
2. Nhấn vào **Avatar thu nhỏ** ở góc trên bên phải AppBar của Trang chủ (`main.dart`).

**Logic navigation:** `navigation_helper.dart → handleTabNavigation()`  
- Tab 0: `Navigator.popUntil(isFirst)`  
- Tab 1, 2, 3: `push` (từ home) hoặc `pushReplacement` (từ tab khác), `.then()` reset tab về 0 khi back

---

## 🎵 Âm thanh hiện có (8 bản)

| File asset | Tên hiển thị | Danh mục |
|-----------|-------------|----------|
| `roof_rain_tin.wav` | Mưa trên mái tôn | Tiếng Mưa |
| `storm_tin.wav` | Mưa gió | Tiếng Mưa |
| `storm_tin1.wav` | Mưa gió 1 | Ru ngủ |
| `brown_noise.wav` | Brown Noise | Tập trung |
| `rain_far.wav` | Mưa xa | Tiếng Mưa |
| `rain_wind(farrain&wind).wav` | Mưa xa kèm gió | Tiếng Mưa |
| `window_rain.wav` | Mưa cửa sổ | Tiếng Mưa |
| `breeze.wav` | Phát âm thanh gió | Thiên Nhiên |

**Chế độ phát:** Loop vô hạn (`ReleaseMode.loop`)

---

## ✅ Đã hoàn thành (theo git log)

### Commit `7a8f904` — Initial setup
- Khởi tạo project Flutter `sound_first`

### Commit `09c8a82` — Project config
- Cấu hình assets, pubspec, file cơ bản

### Commit `a3ce437` — Refactor
- Chuẩn hoá tên file snake_case
- Tách `StatCard` thành widget riêng
- Dọn import

### Commit `155f24f` — UX/UI improvements
- Fix safe area và bottom padding (nội dung không bị che bởi mini player)
- **Xoá** các claim số liệu không có căn cứ (`320k+`, `4.9/5.0`, `100% thư giãn tuyệt đối`)
- Thêm nút CTA rõ ràng vào banner
- Thêm trạng thái "đang phát" trên item audio (icon đổi, highlight)

### Commit `48edda9` — Home tab fix
- Đảm bảo app luôn khởi động ở Tab 0 (Trang Chủ)
- Thêm `yeucau.txt` (tài liệu đánh giá UX từ góc nhìn người dùng)

### Commit `76715c2` → `022ff42` → `9afb121` — Pro screen
- Xây dựng toàn bộ màn hình Pro Club
- Fix UI/UX Pro
- Fix import

### Commit `3db0521` — ✅ Stats Screen (session này)
- Tạo `lib/stats/stats_screen.dart` — màn hình Thống Kê hoàn chỉnh
- Kết nối Tab 2 trong `navigation_helper.dart` (thay snackbar "đang phát triển")

### Commit `b6ddf64` — ✅ Add stats (push)
- Push toàn bộ lên `origin/main`

---

## 📊 Màn hình Thống Kê (`stats_screen.dart`) — Chi tiết

Gồm 7 section theo thiết kế trong `yeucau_giaodien.txt`:

| # | Section | Mô tả |
|---|---------|-------|
| 1 | **Header** | Tiêu đề + badge "CẬP NHẬT" nhấp nháy xanh |
| 2 | **Time Tabs** | 3 tab: Tuần Này / Tháng Này / Mọi Lúc (animated) |
| 3 | **Stats Grid 2×2** | Tổng ru ngủ, Chuỗi ngủ chuẩn, Vào giấc TB, Nghe nhiều nhất |
| 4 | **Weekly Banner** | Thời lượng ru ngủ tuần + badge "+2.4h vs T.Trước" |
| 5 | **Bar Chart** | Biểu đồ cột T2–CN, highlight T7/CN màu xanh |
| 6 | **Top Sounds** | Top 4 âm thanh + LinearProgressIndicator % |
| 7 | **AI Advice** | Card lời khuyên "Cú Nocturne" + nút Chia Sẻ (+30 💎) |

**Màu sắc chủ đạo:**
- Nền: `#0F141C`
- Card: `#161E2C`
- Accent xanh: `#2EE6A6`
- Accent vàng: `#FFC107`

---

## 🔧 Vấn đề tồn đọng (từ `yeucau.txt`)

### Ưu tiên cao
- [ ] **Padding dưới danh sách** — đảm bảo không bị mini player che (đã fix một phần, cần kiểm tra thêm)
- [ ] **Safe Area trên máy thật** — kiểm tra notch/home indicator trên iPhone thật

### Tính năng chưa làm
- [ ] **Background audio** — iOS: Background Modes (Audio, AirPlay); Android: Foreground Service + media notification
- [ ] **Sleep timer trên mini player** — nút truy cập nhanh ngay trên `play_footer.dart`
- [ ] **Full-screen player** — vuốt mini player lên để mở, có thanh tiến trình + âm lượng
- [ ] **Skeleton loading** — thay màn trắng khi load
- [ ] **Empty state / Error state** — khi mất mạng hoặc không có dữ liệu
- [ ] **Haptic feedback** — khi chọn chip, bật/tắt phát
- [ ] **Mix âm thanh** — phát đồng thời nhiều âm thanh (mưa + gió + lửa)

### App Store / Google Play (bắt buộc)
- [ ] **In-App Purchase** — tích hợp Apple IAP / Google Play Billing cho Pro Club
- [ ] **Restore Purchases** — nút khôi phục giao dịch (Apple bắt buộc)
- [ ] **Privacy Policy** — URL công khai, App Privacy label (Apple), Data Safety (Google)
- [ ] **Bản quyền âm thanh** — giấy phép 8 file WAV hiện có
- [ ] **Đa ngôn ngữ** — thêm tiếng Anh song song tiếng Việt
- [ ] **Accessibility** — vùng chạm tối thiểu 44×44pt (iOS) / 48×48dp (Android), WCAG AA contrast

### Minor / Info
- [ ] Fix 11 `info` `withOpacity` deprecated còn sót ở các file cũ (`banner_menu.dart`, `stat_card.dart`, …) → thay bằng `.withValues(alpha:)`

---

## 📁 File tham khảo quan trọng

| File | Mục đích |
|------|---------|
| `yeucau.txt` | Đánh giá UX/UI từ góc nhìn người dùng + yêu cầu store |
| `yeucau_giaodien.txt` | Thiết kế mẫu giao diện Thống Kê (code Flutter standalone) |
| `reset.sh` | Script reset (chưa rõ nội dung, cần kiểm tra) |
| `pubspec.yaml` | Cấu hình dependencies và assets |

---

## 🚀 Bước tiếp theo gợi ý

1. **Background audio** — tính năng cốt lõi, không có sẽ bị reject khi submit store
2. **IAP + Restore Purchases + Privacy Policy** — bắt buộc trước khi submit
3. **Full-screen player** (vuốt mini player lên)
4. **Sleep timer shortcut** trên mini player
5. **Kiểm thử trên máy thật** (iPhone có notch, Android nhiều size)
