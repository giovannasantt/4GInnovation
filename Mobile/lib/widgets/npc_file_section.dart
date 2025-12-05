import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';

class NpcFileSection extends StatelessWidget {
  final String title;
  final Widget child;

  const NpcFileSection({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F4E8),
        border: Border.all(color: const Color(0xFFD4C4A8), width: 2),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 6),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFF8B7355), width: 2),
              ),
            ),
            child: Text(
              title,
              style: AppFonts.specialElite(
                fontSize: 12, // 16 → 12
                color: const Color(0xFF2B2B2B),
                letterSpacing: 1.0,
              ),
            ),
          ),
          const SizedBox(height: 12),
          DefaultTextStyle(
            style: AppFonts.courier(
              fontSize: 11, // 15 → 11
              color: Colors.black,
              height: 1.8,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}