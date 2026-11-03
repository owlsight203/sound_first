import 'package:flutter/material.dart';

/// Mục Cài Đặt Ứng Dụng (Banner PRO, Lossless, Chạy nền, Xuất JSON)
class AppSettingsSection extends StatefulWidget {
  final bool initialLosslessOn;
  final bool initialBackgroundPlayOn;
  final ValueChanged<bool>? onLosslessChanged;
  final ValueChanged<bool>? onBackgroundPlayChanged;
  final VoidCallback? onUpgradePro;
  final VoidCallback? onExportJson;

  const AppSettingsSection({
    super.key,
    this.initialLosslessOn = true,
    this.initialBackgroundPlayOn = true,
    this.onLosslessChanged,
    this.onBackgroundPlayChanged,
    this.onUpgradePro,
    this.onExportJson,
  });

  @override
  State<AppSettingsSection> createState() => _AppSettingsSectionState();
}

class _AppSettingsSectionState extends State<AppSettingsSection> {
  late bool _isLosslessOn;
  late bool _isBackgroundPlayOn;

  @override
  void initState() {
    super.initState();
    _isLosslessOn = widget.initialLosslessOn;
    _isBackgroundPlayOn = widget.initialBackgroundPlayOn;
  }

  @override
  Widget build(BuildContext context) {
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
            '⚙️ Cài Đặt Ứng Dụng',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 14),

          // ── Banner nâng cấp PRO ────────────────────────────
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF33291B), Color(0xFF4A3B1F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: const Color(0xFFFFC107).withValues(alpha: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nocturne PRO Unlimited',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFFFFC107),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Mở khóa 80+ âm thanh Hi-Fi & Không QC',
                        style: TextStyle(fontSize: 11, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: widget.onUpgradePro ?? () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC107),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  child: const Text(
                    'Nâng Cấp',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ── Switch: Âm thanh 96kHz Lossless ───────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.high_quality,
                    color: Color(0xFF2EE6A6),
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Âm thanh 96kHz Lossless',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Tối ưu độ chi tiết tầng âm',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Switch(
                value: _isLosslessOn,
                onChanged: (val) {
                  setState(() => _isLosslessOn = val);
                  widget.onLosslessChanged?.call(val);
                },
                activeThumbColor: Colors.black,
                activeTrackColor: const Color(0xFF2EE6A6),
              ),
            ],
          ),
          const Divider(color: Color(0xFF222B38), height: 24),

          // ── Switch: Phát khi khóa màn hình ─────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.screen_lock_portrait,
                    color: Color(0xFF2EE6A6),
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phát khi khóa màn hình',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Tiết kiệm pin thiết bị qua đêm',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Switch(
                value: _isBackgroundPlayOn,
                onChanged: (val) {
                  setState(() => _isBackgroundPlayOn = val);
                  widget.onBackgroundPlayChanged?.call(val);
                },
                activeThumbColor: Colors.black,
                activeTrackColor: const Color(0xFF2EE6A6),
              ),
            ],
          ),
          const Divider(color: Color(0xFF222B38), height: 24),

          // ── Nút Xuất file JSON ─────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.save_alt, color: Color(0xFF2EE6A6), size: 20),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sao lưu tiến trình & Streak',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Lưu file JSON cục bộ bảo mật 100%',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: widget.onExportJson ??
                    () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Đã xuất file sao lưu JSON thành công!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF222B38)),
                  backgroundColor: const Color(0xFF202938),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                ),
                child: const Text(
                  'Xuất File',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
