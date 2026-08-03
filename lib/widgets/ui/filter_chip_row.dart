import 'package:flutter/material.dart';

/// Horizontally scrollable single-select chip row. Generic string options
/// only — no domain knowledge, reusable for any filter/sort control.
class FilterChipRow extends StatelessWidget {
  const FilterChipRow({
    required this.options,
    required this.selected,
    required this.onChanged,
    super.key,
  });

  final List<String> options;
  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFFD4622A);
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        separatorBuilder: (_, _) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          final option = options[index];
          final isSelected = option == selected;
          return ChoiceChip(
            label: Text(option),
            selected: isSelected,
            onSelected: (_) => onChanged(option),
            selectedColor: accent,
            showCheckmark: false,
            labelStyle: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.white : const Color(0xFF8A8580),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
            backgroundColor: Colors.transparent,
            side: BorderSide(
              color: isSelected ? accent : const Color(0xFF3A3A50),
            ),
          );
        },
      ),
    );
  }
}
