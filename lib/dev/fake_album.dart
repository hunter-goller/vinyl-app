// TEMPORARY fake domain type + dataset — delete this whole `lib/dev/`
// folder once the Data Layer epic lands and the real Drift-generated
// Album type + albumsProvider exist. Kept deliberately similar in shape
// so swapping the data source is close to a drop-in replacement.
class FakeAlbum {
  const FakeAlbum({
    required this.id,
    required this.title,
    required this.artist,
    required this.genres,
    required this.playCount,
    required this.lastPlayedAt,
  });

  final String id;
  final String title;
  final String artist;
  final List<String> genres;
  final int playCount;
  final DateTime? lastPlayedAt;
}

// To preview the empty state, temporarily change this to <FakeAlbum>[].
final List<FakeAlbum> fakeAlbums = [
  FakeAlbum(
    id: '1',
    title: 'Blue Train',
    artist: 'John Coltrane',
    genres: const ['Jazz', 'Hard Bop'],
    playCount: 47,
    lastPlayedAt: DateTime.now().subtract(const Duration(days: 1)),
  ),
  FakeAlbum(
    id: '2',
    title: 'Wildflowers',
    artist: 'Tom Petty',
    genres: const ['Rock', 'Folk Rock'],
    playCount: 31,
    lastPlayedAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
  FakeAlbum(
    id: '3',
    title: 'Rumours',
    artist: 'Fleetwood Mac',
    genres: const ['Rock', 'Pop Rock'],
    playCount: 38,
    lastPlayedAt: DateTime.now().subtract(const Duration(days: 4)),
  ),
  FakeAlbum(
    id: '4',
    title: 'Tapestry',
    artist: 'Carole King',
    genres: const ['Folk', 'Soul'],
    playCount: 22,
    lastPlayedAt: DateTime.now().subtract(const Duration(days: 7)),
  ),
];
