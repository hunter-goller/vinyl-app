import 'package:flutter/material.dart';

/// 3-destination Material 3 nav bar for Collection, Stats, Discover.
/// Purely presentational — the parent ShellRoute handles actual
/// navigation. VinylApp-024.
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _accent = Color(0xFFD4622A);
  static const _muted = Color(0xFF8A8580);

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        // Always show labels regardless of platform default behavior.
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        indicatorColor: _accent.withValues(alpha: 0.13),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(color: selected ? _accent : _muted);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontSize: 11,
            color: selected ? _accent : _muted,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          );
        }),
      ),
      child: NavigationBar(
        height: 64,
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.album_outlined),
            selectedIcon: Icon(Icons.album),
            label: 'Collection',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Discover',
          ),
        ],
      ),
    );
  }
}
