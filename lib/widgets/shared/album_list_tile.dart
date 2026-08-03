import 'package:flutter/material.dart';
import 'package:vinyl_app/utils/palette.dart';
import 'package:vinyl_app/widgets/shared/genre_chip.dart';

/// Primary collection list row. Artwork, title, artist, genre chips,
/// relative timestamp, play count. VinylApp-021.
class AlbumListTile extends StatelessWidget {
  const AlbumListTile({
    required this.title,
    required this.artist,
    required this.genres,
    required this.playCount,
    required this.onTap,
    this.lastPlayedAt,
    super.key,
  });

  final String title;
  final String artist;
  final List<String> genres;
  final int playCount;
  final VoidCallback onTap;

  /// Null hides the timestamp slot entirely — no "Never played" fallback
  /// text is shown, per VinylApp-021's acceptance criteria.
  final DateTime? lastPlayedAt;

  String? get _relativeTimeLabel {
    final date = lastPlayedAt;
    if (date == null) return null;
    final diff = DateTime.now().difference(date);
    if (diff.inDays == 0) return 'Today';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    if (diff.inDays < 30) return '${(diff.inDays / 7).floor()} weeks ago';
    return '${(diff.inDays / 30).floor()} months ago';
  }

  @override
  Widget build(BuildContext context) {
    // TODO(VinylApp-DataLayer): replace with real artwork once
    // ArtworkStorageService exists. Colored placeholder for now,
    // deterministic per album so it doesn't shift between rebuilds.
    final artworkColor = artworkColorFor(title);
    final timeLabel = _relativeTimeLabel;

    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        // 72px per card description — WCAG touch target minimum is 48px,
        // this comfortably exceeds it even with short content.
        constraints: const BoxConstraints(minHeight: 72),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  width: 56,
                  height: 56,
                  color: artworkColor,
                  child: const Icon(
                    Icons.album,
                    color: Colors.white24,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        if (timeLabel != null)
                          Text(
                            timeLabel,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF8A8580),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      artist,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF8A8580),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Wrap(
                          spacing: 4,
                          children: [
                            for (final genre in genres) GenreChip(genre: genre),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '$playCount plays',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFD4622A),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
