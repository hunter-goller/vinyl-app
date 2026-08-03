import 'package:flutter/material.dart';

/// Record count + play count chip strip at the top of Collection.
class SummaryBar extends StatelessWidget {
  const SummaryBar({
    required this.recordCount,
    required this.totalPlays,
    super.key,
  });

  final int recordCount;
  final int totalPlays;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          _chip('$recordCount records', filled: true),
          const SizedBox(width: 8),
          _chip('$totalPlays plays', filled: false),
        ],
      ),
    );
  }

  Widget _chip(String label, {required bool filled}) {
    const accent = Color(0xFFD4622A);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: filled ? accent.withValues(alpha: 0.13) : Colors.transparent,
        border: filled ? null : Border.all(color: const Color(0xFF3A3A50)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: filled ? accent : const Color(0xFF8A8580),
        ),
      ),
    );
  }
}
