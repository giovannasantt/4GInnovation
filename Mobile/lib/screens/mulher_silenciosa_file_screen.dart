import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/npc_file_header.dart';
import '../widgets/npc_file_section.dart';
import '../widgets/case_header.dart';

const npcBackground = Color(0xFF100C08);

/// NPC: Mulher Silenciosa (SC-NPC-009)
/// ESTRUTURA: Mesma dos outros NPCs
/// ÚNICO: Figurante do bar, observadora misteriosa
class MulherSilenciosaFileScreen extends StatelessWidget {
  const MulherSilenciosaFileScreen({Key? key}) : super(key: key);

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
                          fileNumber: '#SC-NPC-009 – MULHER SILENCIOSA',
                          date: '15/11/2025',
                          stickyNoteText: 'Observadora misteriosa',
                        ),
                        const SizedBox(height: 24),
                        
                        Text(
                          'MULHER SILENCIOSA',
                          style: AppFonts.specialElite(
                            fontSize: 20,
                            color: const Color(0xFF2B2B2B),
                            letterSpacing: 2.0,
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        NpcFileSection(
                          title: 'INFORMAÇÕES GERAIS',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoField('STATUS', 'FIGURANTE'),
                              const SizedBox(height: 9),
                              _buildInfoField('LOCALIZAÇÃO', 'Bar'),
                              const SizedBox(height: 9),
                              _buildInfoField('FUNÇÃO', 'Ambientação'),
                            ],
                          ),
                        ),
                        const NpcFileSection(
                          title: 'DESCRIÇÃO',
                          child: Text(
                            'Figura reservada que observa o salão em silêncio. Às vezes sussurra algo no celular.',
                          ),
                        ),
                        const NpcFileSection(
                          title: 'COMPORTAMENTO E APARÊNCIA',
                          child: Text(
                            'Sempre sozinha em uma mesa do canto. Roupa escura e discreta. Ocasionalmente olha para a porta como se esperasse alguém.',
                          ),
                        ),
                        const NpcFileSection(
                          title: 'NÍVEL DE CREDIBILIDADE',
                          child: Text(
                            'Desconhecido - observadora misteriosa',
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

  Widget _buildBackButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _buildCategoryHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF8B7355),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'NPCs',
        style: AppFonts.specialElite(
          fontSize: 16,
          color: Colors.white,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, String value) {
    return Row(
      children: [
        Text(
          '$label:',
          style: AppFonts.specialElite(
            fontSize: 14,
            color: const Color(0xFF2B2B2B),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: AppFonts.specialElite(
            fontSize: 14,
            color: const Color(0xFF2B2B2B),
          ),
        ),
      ],
    );
  }
}