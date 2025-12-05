import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';

class NpcPolaroidPhoto extends StatelessWidget {
  final String imagePath;
  final String alt;
  final String? caption;
  final double rotate;

  const NpcPolaroidPhoto({
    Key? key,
    required this.imagePath,
    required this.alt,
    this.caption,
    this.rotate = -1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.rotate(
          angle: rotate * 0.0174533, // Convert degrees to radians
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(9), // 12 → 9
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black.withValues(alpha: 0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Image.asset(
                  imagePath,
                  width: 192, // 288 → 192 (~33% reduction)
                  height: 213, // 320 → 213 (~33% reduction)
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 192,
                      height: 213,
                      color: Colors.grey[300],
                      child: const Icon(Icons.person, size: 64, color: Colors.grey),
                    );
                  },
                ),
              ),
              // Tape clip
              Positioned(
                top: -9, // -12 → -9
                left: 88, // Center adjusted for new width (192/2 - 16)
                child: Container(
                  width: 24, // 32 → 24
                  height: 18, // 24 → 18
                  decoration: BoxDecoration(
                    color: Colors.grey[400]?.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (caption != null) ...[
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              caption!,
              textAlign: TextAlign.center,
              style: AppFonts.courier(
                fontSize: 10, // 13 → 10
                color: const Color(0xFF2B2B2B),
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
