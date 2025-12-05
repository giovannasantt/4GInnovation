import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/category.dart';
import '../widgets/custom_app_bar.dart';

class SingleFileScreen extends StatelessWidget {
  final Category category;
  final String fileNumber;
  final String date;
  final String stickyNoteText;
  final Color stampColor;
  final String stampText;

  const SingleFileScreen({
    Key? key,
    required this.category,
    required this.fileNumber,
    required this.date,
    required this.stickyNoteText,
    required this.stampColor,
    required this.stampText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: category.title.toUpperCase()),
      backgroundColor: const Color(0xFFF2F0E6), // Paper light
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FILE HEADER
            _buildFileHeader(),
            
            const SizedBox(height: 32),
            
            // INTRO SECTION (Only for developers for now, based on React code)
            if (category.id == 'desenvolvedores') _buildIntroSection(),

            const SizedBox(height: 32),

            // CONTENT LOOP
            ...category.cases.asMap().entries.map((entry) => _buildItem(entry.value, entry.key, context)),

            const SizedBox(height: 32),

            // ACKNOWLEDGEMENTS (Only for developers)
            if (category.id == 'desenvolvedores') _buildAcknowledgements(),

            const SizedBox(height: 32),

            // FILE FOOTER
            _buildFileFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildFileHeader() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Reduzido de 12,6
              decoration: BoxDecoration(
                border: Border.all(color: stampColor, width: 2),
              ),
              child: Text(
                fileNumber,
                style: TextStyle(
                  fontFamily: 'Courier Prime',
                  fontWeight: FontWeight.bold,
                  fontSize: 11, // REDUZIDO de 14 para 11
                  color: stampColor,
                ),
              ),
            ),
            const SizedBox(height: 6), // Reduzido de 8
            Text(
              "DATA: $date",
              style: const TextStyle(
                fontFamily: 'Courier Prime',
                fontSize: 11, // REDUZIDO de 14 para 11
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Transform.rotate(
            angle: 0.1,
            child: Container(
              width: 140,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE6D5F7), // Light Purple sticky note
                border: Border.all(color: stampColor.withValues(alpha: 0.3)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4, offset: const Offset(2, 2)),
                ],
              ),
              child: Text(
                stickyNoteText,
                style: const TextStyle(
                  fontFamily: 'Courier Prime',
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 80,
          child: Transform.rotate(
            angle: -0.2,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: stampColor.withValues(alpha: 0.6), width: 4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                stampText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Courier Prime',
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: stampColor.withValues(alpha: 0.6),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIntroSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F0E6), // bg-paper-light
        border: Border.all(color: Colors.black12, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        "Snout's Case é o resultado do trabalho colaborativo de uma equipe multidisciplinar de 6 profissionais especializados. Cada membro trouxe sua expertise única para criar uma experiência investigativa imersiva e tecnicamente polida. Este documento registra os responsáveis pela criação do jogo e suas respectivas contribuições ao projeto.",
        style: TextStyle(
          fontFamily: 'Courier Prime',
          fontSize: 15,
          height: 1.8,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildItem(dynamic item, int index, BuildContext context) {
    if (category.id == 'desenvolvedores') {
      return _buildDeveloperItem(item, index);
    } else if (category.id == 'mapas') {
      return _buildMapItem(item);
    }
    return const SizedBox.shrink();
  }

  Widget _buildDeveloperItem(dynamic item, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Separator (only if not first)
        if (index > 0) 
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Row(
              children: [
                Container(width: 12, height: 12, decoration: BoxDecoration(color: stampColor, shape: BoxShape.circle)),
                Expanded(
                  child: CustomPaint(
                    painter: DashedLinePainter(color: const Color(0xFF6B5A7C)), // Purple dash
                    child: const SizedBox(height: 1),
                  ),
                ),
                Container(width: 12, height: 12, decoration: BoxDecoration(color: stampColor, shape: BoxShape.circle)),
              ],
            ),
          ),

        // Rotated Tag
        Transform.rotate(
          angle: -0.02, // -1 degree approx
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFE6D5F7),
              border: Border.all(color: stampColor),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              "DESENVOLVEDOR ${item.caseNumber}",
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),

        // Main Card
        Stack(
          children: [
            // Shadow
            Positioned(
              left: -4, right: -4, bottom: -8, top: 8,
              child: SvgPicture.asset('assets/images/paper_drop_shadow.svg', fit: BoxFit.fill),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F0E6),
                border: Border.all(color: Colors.black12, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.only(bottom: 12),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xFF7C5A45), width: 2)), // accent-brown
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.subject.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: 'Courier Prime',
                        fontSize: 13, // REDUZIDO de 20 para 13
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2A2A2A),
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildBadge(item.devRole, const Color(0xFF6B5A7C)),
                        const SizedBox(width: 8),
                        _buildBadge(item.devArea, const Color(0xFFD6B877)),
                      ],
                    ),
                  ],
                ),
              ),

              // Photo
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFD4C4A8), // Placeholder color
                  border: Border.all(color: const Color(0xFFD4C4A8), width: 2),
                ),
                child: item.photo != null
                    ? Image.asset(item.photo!, fit: BoxFit.cover, errorBuilder: (c, e, s) => const Center(child: Icon(Icons.person, size: 48, color: Colors.white54)))
                    : const Center(child: Icon(Icons.person, size: 48, color: Colors.white54)),
              ),

              // About
              _buildSectionTitle("SOBRE"),
              Text(
                item.description ?? "",
                style: const TextStyle(fontFamily: 'Courier Prime', fontSize: 15, height: 1.8, color: Colors.black87),
              ),
              const SizedBox(height: 16),

              // Specialties
              _buildSectionTitle("ESPECIALIDADES"),
              if (item.devSpecialties != null)
                ...item.devSpecialties!.map<Widget>((spec) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8, right: 8),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(color: stampColor, shape: BoxShape.circle),
                      ),
                      Expanded(
                        child: Text(
                          spec,
                          style: const TextStyle(fontFamily: 'Courier Prime', fontSize: 15, height: 1.8, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                )),
              
              const SizedBox(height: 16),

              // Contributions Callout
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6D5F7).withValues(alpha: 0.3),
                  border: const Border(left: BorderSide(color: Color(0xFF6B5A7C), width: 3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "CONTRIBUIÇÃO PRINCIPAL",
                      style: TextStyle(
                        fontSize: 11,
                        letterSpacing: 1,
                        color: Color(0xFF6B5A7C),
                        fontFamily: 'Courier Prime',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.devContribution ?? "",
                      style: const TextStyle(fontFamily: 'Courier Prime', fontSize: 15, height: 1.8, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(String? text, Color color) {
    if (text == null) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontFamily: 'Courier Prime',
          fontSize: 11,
          color: color == const Color(0xFFD6B877) ? const Color(0xFF7C5A45) : color, // Darken yellow text
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Courier Prime',
          fontSize: 12,
          color: Colors.black54,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAcknowledgements() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F0E6),
        border: Border.all(color: const Color(0xFF7C5A45), width: 2), // accent-brown
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.only(bottom: 8),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFF7C5A45), width: 2)),
            ),
            child: const Text(
              "AGRADECIMENTOS ESPECIAIS",
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2A2A2A),
              ),
            ),
          ),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            style: TextStyle(
              fontFamily: 'Courier Prime',
              fontSize: 15,
              height: 1.8,
              fontStyle: FontStyle.italic,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapItem(item) {
    // Keeping map item simple as before, or could enhance later
     return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Stack(
        children: [
          Positioned(
             left: -4, right: -4, bottom: -8, top: 8,
             child: SvgPicture.asset('assets/images/paper_drop_shadow.svg', fit: BoxFit.fill),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[400]!),
              // Shadow removed from here
            ),
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.subject.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Courier Prime',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Divider(color: Colors.black26),
            const SizedBox(height: 8),
            const Text("DESCRIÇÃO", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
            Text(item.description ?? "", style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87)),
            const SizedBox(height: 12),
            
            const Text("PONTOS DE INTERESSE", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
            if (item.mapPointsOfInterest != null)
              ...item.mapPointsOfInterest!.map<Widget>((p) => Text("• $p", style: const TextStyle(fontSize: 13, color: Colors.black87))),
          ],
        ),
      ),
        ],
      ),
    );
  }

  Widget _buildFileFooter() {
    return Center(
      child: Column(
        children: [
          Container(height: 1, width: 200, color: Colors.black45),
          const SizedBox(height: 8),
          const Text(
            "ARQUIVO DIGITALIZADO - SNOUT'S CASE",
            style: TextStyle(fontSize: 10, color: Colors.grey, letterSpacing: 2),
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    
    const dashWidth = 5;
    const dashSpace = 5;
    double startX = 0;
    
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}