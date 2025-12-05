import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final int? totalFiles;
  final bool showBack;
  final VoidCallback? onBack;

  const AppHeader({
    Key? key,
    this.title = "SNOUT'S CASE",
    this.subtitle = "ARQUIVOS INVESTIGATIVOS - DET. JESSICA CAMPOS",
    this.totalFiles,
    this.showBack = false,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Back Button (if needed)
          if (showBack && onBack != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                onTap: onBack,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF8B7355).withValues(alpha: 0.6),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        size: 14,
                        color: Color(0xFFF4E4C1),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'VOLTAR',
                        style: AppFonts.courier(
                          fontSize: 11,
                          color: const Color(0xFFF4E4C1),
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Title
          Text(
            title,
            style: AppFonts.specialElite(
              fontSize: 21,
              color: const Color(0xFFF4E4C1),
              letterSpacing: 3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),

          // Subtitle Box
          Container(
            width: 338,
            height: 24,
            decoration: BoxDecoration(
              color: const Color(0xFFF4E4C1).withValues(alpha: 0.1),
              border: Border.all(
                color: const Color(0xFFF4E4C1).withValues(alpha: 0.3),
                width: 1.18,
              ),
              borderRadius: BorderRadius.circular(3.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              subtitle,
              style: AppFonts.courier(
                fontSize: 10,
                color: const Color(0xFFD4C4A8).withValues(alpha: 0.7),
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 12),

          // Stats (if provided)
          if (totalFiles != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 3.5,
                  height: 3.5,
                  decoration: const BoxDecoration(
                    color: Color(0xFF8B7355),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '$totalFiles Arquivos na Investigação',
                  style: AppFonts.courier(
                    fontSize: 9,
                    color: const Color(0xFFD4C4A8).withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}