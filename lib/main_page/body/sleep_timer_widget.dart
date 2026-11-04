import 'dart:async';
import 'package:flutter/material.dart';

class SleepTimerWidget extends StatefulWidget {
  final VoidCallback
      onTimerFinished; // Hàm gọi khi đếm ngược về 0 (để tắt nhạc)

  const SleepTimerWidget({super.key, required this.onTimerFinished});

  @override
  State<SleepTimerWidget> createState() => _SleepTimerWidgetState();
}

class _SleepTimerWidgetState extends State<SleepTimerWidget> {
  int _selectedMinutes = 45; // Mặc định chọn 45 phút giống ảnh mẫu
  int _remainingSeconds = 0;
  bool _isRunning = false;
  Timer? _timer;

  final List<int> _presetMinutes = [15, 30, 45, 60];

  void _startTimer(int minutes) {
    if (_timer != null) _timer!.cancel();
    setState(() {
      _selectedMinutes = minutes;
      _remainingSeconds = minutes * 60;
      _isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _stopTimer();
          widget.onTimerFinished(); // Gọi callback tắt nhạc khi hết giờ
        }
      });
    });
  }

  void _stopTimer() {
    if (_timer != null) _timer!.cancel();
    setState(() {
      _isRunning = false;
      _remainingSeconds = 0;
    });
  }

  String _formatTime() {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Tính phần trăm tiến trình cho vòng tròn
    double totalSeconds = (_selectedMinutes * 60).toDouble();
    double progress =
        _isRunning && totalSeconds > 0 ? _remainingSeconds / totalSeconds : 1.0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2C),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Tiêu đề nhỏ
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hẹn Giờ Tắt Âm Thanh',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 1. Vòng tròn đếm ngược (Mô phỏng ảnh 1)
          SizedBox(
            width: 180,
            height: 180,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Vòng tròn progress
                SizedBox(
                  width: 180,
                  height: 180,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 8,
                    backgroundColor: Colors.white.withValues(alpha: 0.05),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xFF00C853)),
                  ),
                ),
                // Nội dung ở giữa vòng tròn
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00C853).withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.nightlight_round,
                        color: Color(0xFF00C853),
                        size: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isRunning ? _formatTime() : '$_selectedMinutes:00',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _isRunning ? 'CÒN LẠI' : 'SẴN SÀNG',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Nhãn tiết kiệm pin giống hình mẫu
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.battery_charging_full,
                    color: Color(0xFF00C853), size: 14),
                const SizedBox(width: 6),
                Text(
                  'Tiết kiệm ~18% pin khi hẹn giờ',
                  style: TextStyle(color: Colors.grey.shade300, fontSize: 11),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 2. Danh sách nút chọn thời gian nhanh (Mô phỏng ảnh 2)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _presetMinutes.map((mins) {
                final isSelected = _selectedMinutes == mins && _isRunning;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () => _startTimer(mins),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF00C853)
                            : const Color(0xFF2B2B3D),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '$mins phút',
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey.shade300,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          if (isSelected) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.25),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'ĐANG BẬT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          if (_isRunning) ...[
            const SizedBox(height: 12),
            TextButton(
              onPressed: _stopTimer,
              child: const Text(
                'Hủy hẹn giờ',
                style: TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
