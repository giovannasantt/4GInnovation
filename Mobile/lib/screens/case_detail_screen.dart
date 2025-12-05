import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/case_file.dart';
import '../widgets/custom_app_bar.dart';

class CaseDetailScreen extends StatelessWidget {
  final CaseFile caseFile;

  const CaseDetailScreen({Key? key, required this.caseFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: caseFile.caseNumber),
      body: Stack(
        children: [
          // Background Texture (Dark surroundings)
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/dark_texture.svg',
              fit: BoxFit.cover,
            ),
          ),

          // The Paper Sheet
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Paper Shadow SVG
                Positioned(
                  left: 8,
                  right: 8,
                  top: 32,
                  bottom: -8,
                  child: SvgPicture.asset(
                    'assets/images/paper_drop_shadow.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Stack(
                      children: [
                        // Lined Paper Background
                        Positioned.fill(
                          child: SvgPicture.asset(
                            'assets/images/lined_paper.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                    
                        // Stain Overlay
                        Positioned(
                          bottom: -50,
                          right: -50,
                          width: 300,
                          height: 300,
                          child: Opacity(
                            opacity: 0.6,
                            child: SvgPicture.asset(
                              'assets/images/stain_1.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        // Content
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header Stamp
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red.withValues(alpha: 0.7), width: 3),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  transform: Matrix4.rotationZ(-0.1),
                                  child: Text(
                                    (caseFile.status ?? "CLASSIFIED").toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.red.withValues(alpha: 0.7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 3,
                                      fontFamily: 'Courier Prime',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Photo Section (Conditional)
                              if (caseFile.photo != null) ...[
                                Center(
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Transform.rotate(
                                        angle: 0.02,
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              left: -4, right: -4, bottom: -4, top: 4,
                                              child: SvgPicture.asset('assets/images/drop_shadow.svg', fit: BoxFit.fill),
                                            ),
                                            Container(
                                              width: 220,
                                              padding: const EdgeInsets.all(12),
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                children: [
                                                  AspectRatio(
                                                    aspectRatio: 1,
                                                    child: Image.network(
                                                      caseFile.photo!,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (c, e, s) => Container(
                                                        color: Colors.grey[300],
                                                        child: const Icon(Icons.person, size: 64, color: Colors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Tape Overlay
                                      Positioned(
                                        top: -15,
                                        left: 80,
                                        width: 60,
                                        height: 30,
                                        child: Transform.rotate(
                                          angle: -0.05,
                                          child: Opacity(
                                            opacity: 0.8,
                                            child: SvgPicture.asset(
                                              'assets/images/tape.svg',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 32),
                              ],

                              // Main Subject
                              Text(
                                caseFile.subject.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A1A1A),
                                  letterSpacing: 1.0,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                height: 2,
                                color: Colors.black87,
                              ),
                              
                              const SizedBox(height: 12),
                              _buildField("TYPE", caseFile.type),
                              _buildField("FILED BY", caseFile.filedBy),
                              _buildField("DATE", caseFile.date),
                              _buildField("LOCATION", caseFile.location),
                              _buildField("AFFILIATION", caseFile.affiliation),

                              const SizedBox(height: 24),
                              
                              // Description
                              const Text(
                                "DESCRIPTION",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold, 
                                  fontSize: 16, 
                                  letterSpacing: 1,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                caseFile.description ?? "No description available.",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF1A1A1A),
                                  height: 1.6,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Courier Prime',
                                ),
                              ),

                              // List Sections
                              _buildListSection("EVIDENCE", caseFile.evidence),
                              _buildListSection("TESTIMONY", caseFile.testimony),
                              _buildListSection("NOTES", caseFile.jessicaNotes),
                              
                              const SizedBox(height: 48),
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
        ],
      ),
    );
  }

  Widget _buildField(String label, String? value) {
    if (value == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              "$label:",
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontFamily: 'Courier Prime',
                color: Color(0xFF1A1A1A),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListSection(String title, List<String>? items) {
    if (items == null || items.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1, color: Color(0xFF1A1A1A)),
        ),
        const SizedBox(height: 8),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("• ", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A1A1A))),
              Expanded(child: Text(item, style: const TextStyle(color: Color(0xFF1A1A1A), fontFamily: 'Courier Prime'))),
            ],
          ),
        )),
      ],
    );
  }
}
