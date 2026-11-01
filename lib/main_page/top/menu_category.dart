import 'package:flutter/material.dart';

class MenuCategory extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const MenuCategory({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = selectedCategory == cat['name'];

          return ChoiceChip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (cat['icon'] != null) ...[
                  Icon(
                    cat['icon'],
                    size: 16,
                    color: isSelected ? Colors.white : Colors.grey.shade300,
                  ),
                  const SizedBox(width: 6),
                ],
                Text(cat['name']),
                if (cat['count'] != null) ...[
                  const SizedBox(width: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.black.withOpacity(0.2)
                          : Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${cat['count']}',
                      style: const TextStyle(fontSize: 11),
                    ),
                  ),
                ],
              ],
            ),
            selected: isSelected,
            selectedColor:
                const Color(0xFF00C853), // Màu xanh lá nổi bật khi chọn
            backgroundColor: const Color(0xFF1E1E2C),
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.grey.shade300,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: isSelected
                    ? Colors.transparent
                    : Colors.white.withOpacity(0.05),
              ),
            ),
            onSelected: (bool selected) {
              if (selected) {
                onCategorySelected(cat['name']);
              }
            },
          );
        },
      ),
    );
  }
}
