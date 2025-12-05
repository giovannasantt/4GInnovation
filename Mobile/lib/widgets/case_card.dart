import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/case_file.dart';

class CaseCard extends StatelessWidget {
  final CaseFile caseFile;
  final VoidCallback onTap;

  const CaseCard({
    Key? key,
    required this.caseFile,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Paper Shadow (SVG)
            Positioned(
              left: -4,
              right: -4,
              bottom: -8,
              top: 4,
              child: SvgPicture.asset(
                'assets/images/paper_drop_shadow.svg',
                fit: BoxFit.fill,
              ),
            ),
            
            // Main Card Content
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0E8), // Manila folder color
                borderRadius: BorderRadius.circular(2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Stack(
                  children: [
                    // Texture Overlay
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.4,
                        child: SvgPicture.asset(
                          'assets/images/paper_container_grad.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    
                    // Content
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Paperclip icon placeholder
              const Icon(Icons.attach_file, color: Colors.grey),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          caseFile.caseNumber,
                          style: const TextStyle(
                            fontFamily: 'Courier Prime',
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        if (caseFile.status != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              caseFile.status!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      caseFile.subject,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (caseFile.description != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        caseFile.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
