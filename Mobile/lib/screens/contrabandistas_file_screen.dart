import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/npc_file_header.dart';
import '../widgets/npc_file_section.dart';
import '../widgets/case_header.dart';

const npcBackground = Color(0xFF100C08);

/// NPC: Contrabandistas (SC-NPC-004)
/// ESTRUTURA: Mesma dos outros NPCs
/// ÚNICO: Status PERICULOSO, envolvidos no tráfico ilegal
class ContrabandistasFileScreen extends StatelessWidget {
  const ContrabandistasFileScreen({Key? key}) : super(key: key);

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
                          fileNumber: '#SC-NPC-004 – CONTRABANDISTAS',
                          date: '15/11/2025',
                          stickyNoteText: 'Transporte ilegal de produtos e animais',
                        ),
                        const SizedBox(height: 24),
                        
                        Text(
                          'CONTRABANDISTAS',
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
                              _buildInfoField('STATUS', 'PERICULOSO'),
                              const SizedBox(height: 9),
                              _buildInfoField('LOCALIZAÇÃO', 'Galpão'),
                              const SizedBox(height: 9),
                              _buildInfoField('FUNÇÃO', 'Transporte ilegal de produtos e animais'),
                            ],
                          ),
                        ),
                        const NpcFileSection(
                          title: 'DESCRIÇÃO',
                          child: Text(
                            'Indivíduos responsáveis pelo transporte ilegal de produtos e animais para as operações clandestinas.',
                          ),
                        ),
                        const NpcFileSection(
                          title: 'COMPORTAMENTO E APARÊNCIA',
                          child: Text(
                            'Roupas casuais gastas, jeans velhos, coturnos. Tatuagens, cicatrizes e aparência descuidada. Carregam caixas, sacos ou vigiam áreas específicas. Olhares hostis e postura intimidadora.',
                          ),
                        ),
                        const NpcFileSection(
                          title: 'NÍVEL DE CREDIBILIDADE',
                          child: Text(
                            'Extremo risco - envolvidos diretamente no crime',
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
        'NPC: Contrabandistas',
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