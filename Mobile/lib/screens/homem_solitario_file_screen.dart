import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/npc_file_header.dart';
import '../widgets/npc_file_section.dart';
import '../widgets/case_header.dart';

const npcBackground = Color(0xFF100C08);

/// NPC: Homem Solitário (SC-NPC-010)
/// ESTRUTURA: Mesma dos outros NPCs
/// ÚNICO: Figurante do bar, observador silencioso
class HomemSolitarioFileScreen extends StatelessWidget {
  const HomemSolitarioFileScreen({Key? key}) : super(key: key);

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
                          fileNumber: '#SC-NPC-010 – HOMEM SOLITÁRIO',
                          date: '15/11/2025',
                          stickyNoteText: 'Observador silencioso',
                        ),
                        const SizedBox(height: 24),
                        
                        Text(
                          'HOMEM SOLITÁRIO',
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
                        const SizedBox(height: 24),
                        
                        const NpcFileSection(
                          title: 'DESCRIÇÃO',
                          child: Text(
                            'Homem introspectivo, sempre com uma cerveja e um cigarro apagado. Parece desligado, mas percebe tudo.',
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        const NpcFileSection(
                          title: 'COMPORTAMENTO E APARÊNCIA',
                          child: Text(
                            'Sentado sempre no mesmo banco próximo ao balcão. Olhar distante, mas ouve todas as conversas ao redor. Nunca interage com ninguém.',
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        const NpcFileSection(
                          title: 'NÍVEL DE CREDIBILIDADE',
                          child: Text(
                            'Baixo - detalhes narrativos menores',
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