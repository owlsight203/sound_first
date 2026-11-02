import 'package:flutter/material.dart';

/// Đường kẻ phân cách có text ở giữa (VD: "OR GO FULLY AD-FREE FOREVER")
class ProDividerSection extends StatelessWidget {
  final String title;

  const ProDividerSection({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: Color(0xFF222B38), thickness: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white38,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
        ),
        const Expanded(
          child: Divider(color: Color(0xFF222B38), thickness: 1),
        ),
      ],
    );
  }
}
