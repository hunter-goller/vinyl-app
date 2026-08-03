import 'package:flutter/material.dart';

/// Generic empty-state layout: icon, title, subtitle, optional CTA.
/// No domain knowledge — reused for "no albums", "no plays", etc.
class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.ctaLabel,
    this.onCtaTap,
    super.key,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? ctaLabel;
  final VoidCallback? onCtaTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: const Color(0xFF3A3A50)),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Color(0xFF8A8580)),
            ),
            if (ctaLabel != null) ...[
              const SizedBox(height: 20),
              ElevatedButton(onPressed: onCtaTap, child: Text(ctaLabel!)),
            ],
          ],
        ),
      ),
    );
  }
}
