import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';

class EasterEggFileHeader extends StatelessWidget {
  final String fileNumber;
  final String date;
  final String stickyNoteText;

  const EasterEggFileHeader({
    Key? key,
    required this.fileNumber,
    required this.date,
    required this.stickyNoteText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // File Number & Date
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                fileNumber,
                style: AppFonts.courier(
                  fontSize: 9, // 14px → 9px
                  color: Colors.black.withValues(alpha: 0.7),
                  letterSpacing: 0.7,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              date,
              style: AppFonts.courier(
                fontSize: 9,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        
        // Sticky Note (Purple theme for Easter Eggs)
        Transform.rotate(
          angle: -0.03,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE6D5F7), // Purple tint for easter eggs
              border: Border.all(
                color: const Color(0xFF8B5A8B).withValues(alpha: 0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Text(
              stickyNoteText,
              textAlign: TextAlign.center,
              style: AppFonts.courier(
                fontSize: 10, // 15px → 10px
                color: const Color(0xFF2B2B2B),
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        
        // Purple Stamp for Easter Eggs
        Align(
          alignment: Alignment.centerRight,
          child: Transform.rotate(
            angle: 0.09,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF8B5A8B),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'EASTER EGG\nDESCOBERTO\nCASO: SNOUT\'S CASE',
                textAlign: TextAlign.center,
                style: AppFonts.specialElite(
                  fontSize: 8, // 12px → 8px
                  color: const Color(0xFF8B5A8B),
                  letterSpacing: 1.0,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}