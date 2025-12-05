import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/npc_file_header.dart';
import '../widgets/npc_file_section.dart';
import '../widgets/case_header.dart';

const npcBackground = Color(0xFF100C08);

/// Tela de perfil dos NPCs "Funcionários do Petshop Snout"
/// ESTRUTURA: Idêntica a CapangasFileScreen
/// DIFERENÇA: Dados específicos (SC-NPC-002, status OBSERVAÇÃO, função diferente)
class FuncionariosSnoutFileScreen extends StatelessWidget {
  const FuncionariosSnoutFileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: npcBackground,
      body: SafeArea(
        child: Column(
          children: [
            const CaseHeader(),
            _buildBackButton(context),
            _buildCategoryHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 16, 12, 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFF5F0E1),
                          Color(0xFFE8DCC8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF8B7355), width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.4),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        NpcFileHeader(
                          fileNumber: '#SC-NPC-002 – FUNCIONÁRIOS DO SNOUT PETSHOP',
                          date: '15/11/2025',
                          stickyNoteText: 'Manter fachada de normalidade do estabelecimento',
                        ),
                        const SizedBox(height: 24),
                        
                        Text(
                          'FUNCIONÁRIOS DO SNOUT PETSHOP',
                          textAlign: TextAlign.center,
                          style: AppFonts.specialElite(
                            fontSize: 18, // Slightly smaller for longer title
                            color: const Color(0xFF2B2B2B),
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        // Two Polaroid Photos side by side
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: _buildPolaroidPhoto('Funcionário 1 — Atendente do balcão.'),
                            ),
                            const SizedBox(width: 16),
                            Flexible(
                              child: _buildPolaroidPhoto('Funcionário 2 — Responsável pelos animais.'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        
                        NpcFileSection(
                          title: 'INFORMAÇÕES GERAIS',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoField('STATUS', 'OBSERVAÇÃO'),
                              const SizedBox(height: 9),
                              _buildInfoField('LOCALIZAÇÃO', 'Petshop'),
                              const SizedBox(height: 9),
                              _buildInfoField('FUNÇÃO', 'Manter fachada de normalidade do estabelecimento'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        const NpcFileSection(
                          title: 'DESCRIÇÃO',
                          child: Text(
                            'Funcionários treinados para manter a fachada de normalidade do Petshop. Trabalham com eficiência exagerada, como se seguissem instruções rígidas.',
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        const NpcFileSection(
                          title: 'COMPORTAMENTO E APARÊNCIA',
                          child: Text(
                            'Uniforme: camisa polo com logo, calça preta, tênis. Sorrisos forçados e movimentos mecânicos. Limpeza de gaiolas, organização de produtos e alimentação dos animais. Linguagem corporal tensa, como se estivessem sendo vigiados.',
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        const NpcFileSection(
                          title: 'NÍVEL DE CREDIBILIDADE',
                          child: Text(
                            'Baixo risco - podem fornecer pistas indiretas',
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        Text(
                          'Atualizado em: 15/11/2025',
                          style: AppFonts.courier(
                            fontSize: 9,
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolaroidPhoto(String caption) {
    return Column(
      children: [
        Transform.rotate(
          angle: -0.017,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(7), // Slightly smaller for 2 photos
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
                child: Container(
                  width: 140, // Smaller for side-by-side layout
                  height: 155,
                  color: Colors.grey[300],
                  child: const Icon(Icons.person, size: 48, color: Colors.grey),
                ),
              ),
              Positioned(
                top: -7,
                left: 64, // Centered for smaller width
                child: Container(
                  width: 18,
                  height: 14,
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
        const SizedBox(height: 8),
        SizedBox(
          width: 140,
          child: Text(
            caption,
            textAlign: TextAlign.center,
            style: AppFonts.courier(
              fontSize: 8, // Smaller for 2 photos
              color: const Color(0xFF2B2B2B),
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF8B7355).withValues(alpha: 0.15),
                border: Border.all(
                  color: const Color(0xFFD4C4A8),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 14,
                    color: Color(0xFFD4C4A8),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'VOLTAR',
                    style: AppFonts.courier(
                      fontSize: 11,
                      color: const Color(0xFFD4C4A8),
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF45638B).withValues(alpha: 0.8),
        border: const Border(
          top: BorderSide(color: Color(0xFF45638B), width: 2),
          bottom: BorderSide(color: Color(0xFF45638B), width: 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        'NPCs',
        style: AppFonts.specialElite(
          fontSize: 14,
          color: Colors.white,
          letterSpacing: 2.0,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildInfoField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFonts.courier(
            fontSize: 9,
            color: Colors.black.withValues(alpha: 0.6),
            letterSpacing: 0.7,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: AppFonts.courier(
            fontSize: 11,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}