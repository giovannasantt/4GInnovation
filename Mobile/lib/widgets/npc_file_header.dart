import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';

class NpcFileHeader extends StatelessWidget {
  final String fileNumber;
  final String date;
  final String? stickyNoteText;
  final bool showStamp;
  final String stampText;
  final Color? borderColor;

  const NpcFileHeader({
    Key? key,
    required this.fileNumber,
    required this.date,
    this.stickyNoteText,
    this.showStamp = true,
    this.stampText = 'ARQUIVO DE\nINVESTIGAÇÃO\nCASO: SNOUT\'S CASE',
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E9D2),
        border: Border.all(color: const Color(0xFF8B7355), width: 2),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fileNumber,
                style: AppFonts.courier(
                  fontSize: 9, // 12 → 9
                  color: Colors.black.withValues(alpha: 0.7),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                date.contains(':') ? date : 'Atualizado em: $date',
                style: AppFonts.courier(
                  fontSize: 10, // 13 → 10
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              ),
              if (stickyNoteText != null) ...[
                const SizedBox(height: 12),
                Transform.rotate(
                  angle: -0.017, // -1 degree
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF9C4),
                      border: Border.all(color: Colors.black.withValues(alpha: 0.15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Text(
                      stickyNoteText!,
                      style: AppFonts.handwriting(
                        fontSize: 11, // 14 → 11
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          if (showStamp)
            Positioned(
              top: 0,
              right: 0,
              child: Transform.rotate(
                angle: 0.21, // 12 degrees
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor ?? const Color(0xFFC41E3A).withValues(alpha: 0.4),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    stampText,
                    textAlign: TextAlign.center,
                    style: AppFonts.specialElite(
                      fontSize: 9, // 12 → 9
                      color: borderColor ?? const Color(0xFFC41E3A).withValues(alpha: 0.4),
                      letterSpacing: 0.8,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}