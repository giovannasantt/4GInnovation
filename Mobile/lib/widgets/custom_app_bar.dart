import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final bool showBack;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.showBack = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFF111111),
      elevation: 4,
      flexibleSpace: Stack(
        children: [
          Container(color: const Color(0xFF111111)),
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/header_grad.svg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      title: Stack(
        alignment: Alignment.center,
        children: [
          // The "Tape" Label Background
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.9,
                  child: SvgPicture.asset(
                    'assets/images/tape.svg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    fontFamily: 'Courier Prime',
                    color: Colors.black87,
                    fontWeight: FontWeight.w900, // Black weight
                    fontSize: 18,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white70),
              onPressed: () => Navigator.pop(context),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
