import 'package:flutter/material.dart';
import 'package:vinyl_app/utils/palette.dart';

/// Small genre pill, read-only or removable. VinylApp-026.
class GenreChip extends StatelessWidget {
  const GenreChip({
    required this.genre,
    this.removable = false,
    this.onRemove,
    super.key,
  });

  final String genre;
  final bool removable;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final color = genreColorFor(genre);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: removable ? onRemove : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            border: Border.all(color: color.withValues(alpha: 0.5)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                genre,
                // Locked to 11px regardless of device text scale
                // setting — required so chips never overflow their
                // pill or break Wrap layout on accessibility-large
                // text settings.
                textScaler: TextScaler.noScaling,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
              if (removable) ...[
                const SizedBox(width: 4),
                Icon(
                  Icons.close,
                  size: 10,
                  color: color.withValues(alpha: 0.8),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
