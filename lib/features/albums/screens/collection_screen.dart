import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vinyl_app/dev/fake_album.dart';
import 'package:vinyl_app/routing/app_routes.dart';
import 'package:vinyl_app/widgets/shared/album_list_tile.dart';
import 'package:vinyl_app/widgets/shared/bottom_nav_bar.dart';
import 'package:vinyl_app/widgets/shared/summary_bar.dart';
import 'package:vinyl_app/widgets/ui/empty_state.dart';
import 'package:vinyl_app/widgets/ui/filter_chip_row.dart';
import 'package:vinyl_app/widgets/ui/primary_button.dart';
import 'package:vinyl_app/widgets/ui/section_header.dart';

// TODO(VinylApp-DataLayer): Replace fakeAlbums + local sort state with
// ref.watch(albumsProvider) and ref.watch(collectionFiltersProvider).
const _sortOptions = ['Recent', 'A-Z', 'Most Played', 'Genre'];

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  String _sortBy = 'Recent';

  List<FakeAlbum> get _sortedAlbums {
    final albums = [...fakeAlbums];

    if (_sortBy == 'A-Z') {
      albums.sort((a, b) => a.title.compareTo(b.title));
    } else if (_sortBy == 'Most Played') {
      albums.sort((a, b) => b.playCount.compareTo(a.playCount));
    } else if (_sortBy == 'Genre') {
      albums.sort((a, b) {
        final aGenre = a.genres.isNotEmpty ? a.genres.first : '';
        final bGenre = b.genres.isNotEmpty ? b.genres.first : '';
        return aGenre.compareTo(bGenre);
      });
    } else {
      // 'Recent' — default sort, matches acceptance criteria.
      albums.sort((a, b) {
        final aDate = a.lastPlayedAt ?? DateTime(0);
        final bDate = b.lastPlayedAt ?? DateTime(0);
        return bDate.compareTo(aDate);
      });
    }

    return albums;
  }

  Future<void> _handleRefresh() async {
    // TODO(VinylApp-DataLayer): call ref.invalidate(albumsProvider) instead.
    await Future<void>.delayed(const Duration(milliseconds: 600));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final albums = _sortedAlbums;
    final totalPlays = albums.fold<int>(0, (sum, a) => sum + a.playCount);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Collection'),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            tooltip: 'Filter',
            onPressed: () {
              // TODO(VinylApp-Screens): filter sheet, not yet built.
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              // TODO(VinylApp-DataLayer): wire to collectionFiltersProvider
              // search query once real search is built.
            },
          ),
        ],
      ),
      body: albums.isEmpty
          ? EmptyState(
              icon: Icons.album_outlined,
              title: 'No records yet',
              subtitle: 'Add your first record to start tracking plays.',
              ctaLabel: 'Add record',
              onCtaTap: () => context.go(AppRoutes.addAlbum),
            )
          : RefreshIndicator(
              onRefresh: _handleRefresh,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  SummaryBar(
                    recordCount: albums.length,
                    totalPlays: totalPlays,
                  ),
                  FilterChipRow(
                    options: _sortOptions,
                    selected: _sortBy,
                    onChanged: (value) => setState(() => _sortBy = value),
                  ),
                  const SectionHeader(title: 'Recently Played'),
                  for (final album in albums)
                    AlbumListTile(
                      title: album.title,
                      artist: album.artist,
                      genres: album.genres,
                      playCount: album.playCount,
                      lastPlayedAt: album.lastPlayedAt,
                      onTap: () =>
                          context.go(AppRoutes.albumDetailPath(album.id)),
                    ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    label: '+ Add record',
                    onPressed: () => context.go(AppRoutes.addAlbum),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          const routes = [
            AppRoutes.collection,
            AppRoutes.stats,
            AppRoutes.discover,
          ];
          context.go(routes[index]);
        },
      ),
    );
  }
}
