import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/npc_file_header.dart';
import '../widgets/npc_file_section.dart';
import '../widgets/case_header.dart';

/// Cor de fundo escura compartilhada por todas as telas de NPCs
const npcBackground = Color(0xFF100C08);

/// Tela de perfil dos NPCs "Capangas"
/// 
/// ESTRUTURA COMPARTILHADA (TODAS AS TELAS DE NPCs):
/// - StatelessWidget (conteúdo estático)
/// - Layout: Header → Voltar → Categoria "NPCs" → Detalhes
/// - Usa widgets reutilizáveis: NpcFileHeader, NpcFileSection
/// - Design de dossiê investigativo com foto polaroid
/// 
/// DIFERENÇAS ENTRE NPCs:
/// - Foto (URL do Unsplash)
/// - Dados (nome, papel, localização, credibilidade)
/// - Seções de informação (comportamento, citações)
/// 
/// PADRÃO: ~10 telas de NPCs com mesma estrutura
class CapangasFileScreen extends StatelessWidget {
  const CapangasFileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: npcBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho global do app
            const CaseHeader(),
            // Botão de navegação
            _buildBackButton(context),
            // Faixa de categoria "NPCs"
            _buildCategoryHeader(),
            // Conteúdo rolável
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 16, 12, 20),
                  // Container principal com gradiente bege (papel envelhecido)
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // LinearGradient cria transição suave bege claro → bege escuro
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFF5F0E1),  // Bege claro
                          Color(0xFFE8DCC8),  // Bege mais escuro
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
                          fileNumber: '#SC-NPC-001 – CAPANGAS',
                          date: '15/11/2025',
                          stickyNoteText: 'Segurança e controle das instalações clandestinas',
                        ),
                        const SizedBox(height: 24),
                        
                        // Title
                        Text(
                          'CAPANGAS',
                          style: AppFonts.specialElite(
                            fontSize: 20, // 36 → 20
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
                              _buildInfoField('STATUS', 'AMEAÇA'),
                              const SizedBox(height: 9),
                              _buildInfoField('LOCALIZAÇÃO', 'Petshop, Galpão, Laboratório'),
                              const SizedBox(height: 9),
                              _buildInfoField('FUNÇÃO', 'Segurança e controle das instalações clandestinas'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        const NpcFileSection(
                          title: 'DESCRIÇÃO',
                          child: Text(
                            'Capangas atuam como a linha de frente da segurança nas instalações ligadas ao Petshop Snout. Mantêm o controle das áreas internas, afastam curiosos e acompanham movimentações suspeitas.',
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        const NpcFileSection(
                          title: 'COMPORTAMENTO E APARÊNCIA',
                          child: Text(
                            'Roupas escuras e discretas, jaquetas táticas leves. Bonés, toucas ou óculos escuros mesmo em ambientes fechados. Postura rígida e movimentos calculados. Sempre em duplas, raramente conversam. Expressão neutra, olhar atento.',
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        const NpcFileSection(
                          title: 'NÍVEL DE CREDIBILIDADE',
                          child: Text(
                            'Alto risco - patrulham áreas sensíveis',
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        // Footer
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
            fontSize: 9, // 12 → 9
            color: Colors.black.withValues(alpha: 0.6),
            letterSpacing: 0.7,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: AppFonts.courier(
            fontSize: 11, // 15 → 11
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}