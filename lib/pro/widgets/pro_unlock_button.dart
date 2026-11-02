import 'package:flutter/material.dart';

/// Nút bấm mở khóa PRO chính (Unlock Nocturne PRO Forever)
class ProUnlockButton extends StatelessWidget {
  final VoidCallback? onUnlock;
  final bool isLifetime;

  const ProUnlockButton({
    super.key,
    this.onUnlock,
    this.isLifetime = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onUnlock ??
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isLifetime
                        ? 'Đang kết nối cổng thanh toán gói Trọn đời (\$1.99)...'
                        : 'Đang kết nối cổng thanh toán gói 12 Tháng (\$0.99/mo)...',
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFC107),
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 6,
          shadowColor: const Color(0xFFFFC107).withValues(alpha: 0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_awesome, color: Colors.black87),
            const SizedBox(width: 8),
            Text(
              isLifetime
                  ? 'Unlock Nocturne PRO Forever'
                  : 'Unlock Nocturne PRO (12 Months)',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
