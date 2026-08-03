import 'package:flutter/material.dart';

/// Section label with optional trailing action. VinylApp-023.
class SectionHeader extends StatelessWidget {
  SectionHeader({
    required this.title,
    this.trailing,
    this.onTrailingTap,
    super.key,
  }) : assert(
         (trailing == null) == (onTrailingTap == null),
         'trailing and onTrailingTap must both be provided or both be null',
       );

  final String title;
  final String? trailing;
  final VoidCallback? onTrailingTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 16px top / 8px bottom per spec — was symmetric 12/12 before.
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Row(
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              // 0.05em at 11px font size = 0.55 logical pixels.
              letterSpacing: 0.55,
              color: Color(0xFF8A8580),
            ),
          ),
          const Spacer(),
          if (trailing != null)
            // Explicit 44px minimum touch target, not just whatever
            // size the text itself happens to render at.
            SizedBox(
              height: 44,
              child: TextButton(
                onPressed: onTrailingTap,
                style: TextButton.styleFrom(
                  minimumSize: const Size(0, 44),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  trailing!,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF8A8580),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
