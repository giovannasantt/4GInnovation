import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';

class EasterEggFileSection extends StatelessWidget {
  final String title;
  final Widget child;

  const EasterEggFileSection({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.specialElite(
            fontSize: 11, // 18px → 11px
            color: Colors.black.withValues(alpha: 0.8),
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: const Color(0xFF8B7355).withValues(alpha: 0.3),
                width: 1,
              ),
            ),
          ),
          child: DefaultTextStyle(
            style: AppFonts.courier(
              fontSize: 10, // 15px → 10px
              color: Colors.black,
              height: 1.8,
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
