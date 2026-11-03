import 'package:flutter/material.dart';

/// Widget Header cho màn hình Pro: Logo huy hiệu vàng & nhãn Nocturne Super + Nút Đóng giao diện
class ProHeader extends StatelessWidget {
  final VoidCallback? onClose;

  const ProHeader({
    super.key,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Logo huy hiệu vàng & nhãn trung tâm
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC107),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFFC107).withValues(alpha: 0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.military_tech, size: 48, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF192231),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFFFC107).withValues(alpha: 0.3),
                  ),
                ),
                child: const Text(
                  'NOCTURNE SUPER',
                  style: TextStyle(
                    color: Color(0xFFFFC107),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),

          // Nút đóng giao diện (X) ở góc trên bên phải
          if (onClose != null)
            Positioned(
              top: 0,
              right: 0,
              child: Semantics(
                button: true,
                label: 'Đóng giao diện Pro',
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onClose,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF161E2C),
                        border: Border.all(
                          color: const Color(0xFF222B38),
                          width: 1.5,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close_rounded,
                          color: Colors.white70,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
