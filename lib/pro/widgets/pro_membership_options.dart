import 'package:flutter/material.dart';

/// Danh sách lựa chọn gói thành viên: Trọn đời (Lifetime) hoặc Theo năm (12 Tháng)
class ProMembershipOptions extends StatelessWidget {
  final bool isLifetimeSelected;
  final ValueChanged<bool> onSelectOption;

  const ProMembershipOptions({
    super.key,
    required this.isLifetimeSelected,
    required this.onSelectOption,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Gói 1: Lifetime Access
        Expanded(
          child: GestureDetector(
            onTap: () => onSelectOption(true),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF161E2C),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isLifetimeSelected
                      ? const Color(0xFFFFC107)
                      : const Color(0xFF222B38),
                  width: isLifetimeSelected ? 2 : 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC107),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'SAVE 60%',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        isLifetimeSelected
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: isLifetimeSelected
                            ? const Color(0xFFFFC107)
                            : Colors.white30,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Lifetime\nAccess',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'BEST VALUE',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFC107),
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '\$1.99',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: ' / 49.000đ',
                          style: TextStyle(fontSize: 11, color: Colors.white60),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '129.000đ',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white38,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF242A35),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Pay once, own forever',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFFFC107),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Gói 2: 12 Months
        Expanded(
          child: GestureDetector(
            onTap: () => onSelectOption(false),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF161E2C),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: !isLifetimeSelected
                      ? const Color(0xFFFFC107)
                      : const Color(0xFF222B38),
                  width: !isLifetimeSelected ? 2 : 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        !isLifetimeSelected
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: !isLifetimeSelected
                            ? const Color(0xFFFFC107)
                            : Colors.white30,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '12 Months',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'ANNUAL BILLING',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white38,
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '\$0.99',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: '/mo',
                          style: TextStyle(fontSize: 11, color: Colors.white60),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '29.000đ/tháng',
                    style: TextStyle(fontSize: 11, color: Colors.white60),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF242A35),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Cancel anytime',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
