import 'package:flutter/material.dart';

/// Deterministic color assignment so the same genre/album always gets
/// the same color, without needing real artwork or a hand-maintained map.
/// TODO(VinylApp-DataLayer): remove artworkColorFor once real artwork
/// (ArtworkStorageService) exists — genreColorFor can stay permanently.

const _genrePalette = [
  Color(0xFFD4622A), // amber/rust — matches app accent
  Color(0xFF4C8BF5), // blue
  Color(0xFFE0546A), // rose
  Color(0xFF52A675), // green
  Color(0xFF9B7BE0), // purple
  Color(0xFF3FB6C4), // teal
  Color(0xFFD9A441), // gold
];

const _artworkPalette = [
  Color(0xFF2F5C82), // blue
  Color(0xFF6B4A8A), // purple
  Color(0xFF3E7A55), // green
  Color(0xFF2E7D7D), // teal
  Color(0xFF8A4A4A), // brick
  Color(0xFF4A4A8A), // indigo
];

int _hash(String input) => input.codeUnits.fold(0, (h, c) => h + c);

Color genreColorFor(String genre) =>
    _genrePalette[_hash(genre) % _genrePalette.length];

Color artworkColorFor(String seed) =>
    _artworkPalette[_hash(seed) % _artworkPalette.length];
