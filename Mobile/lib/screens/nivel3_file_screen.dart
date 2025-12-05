import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/case_header.dart';

// ==================== PALETA DE CORES COMPARTILHADA ====================
// Mesma paleta usada nos 5 níveis (consistência visual)
const levelBackground = Color(0xFF100C08);
const levelPaperLevel = Color(0xFFF3E9D2);
const levelInk = Color(0xFF2B2B2B);
const levelRed = Color(0xFFC41E3A);
const levelBlue = Color(0xFF1F2A44);
const levelPostit = Color(0xFFFFF9C4);
const levelBorderMain = Color(0xFF8B7355);

/// Tela do Nível 3 - Docas do Petshop (Noite)
/// 
/// DIFERENÇA DOS OUTROS NÍVEIS:
/// - Atmosfera noturna (cores mais escuras no conteúdo)
/// - Foco em infiltração furtiva (stealth)
/// - Maior perigo (capangas presentes)
/// - Post-it com alerta de silêncio
/// 
/// ESTRUTURA: Idêntica aos outros níveis
/// - StatelessWidget (conteúdo estático)
/// - Mesmo layout: Header → Voltar → Categoria → Detalhes
class Nivel3FileScreen extends StatelessWidget {
  const Nivel3FileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: levelBackground,
      body: SafeArea(
        child: Column(
          children: [
            const CaseHeader(),
            _buildBackButton(context),
            _buildCategoryHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: _buildDetailContainer(),
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
                color: const Color(0xFF8B7355).withValues(alpha: 0.2),
                border: Border.all(
                  color: const Color(0xFFD4C4A8).withValues(alpha: 0.4),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_back, size: 14, color: Color(0xFFD4C4A8)),
                  const SizedBox(width: 6),
                  Text(
                    'VOLTAR',
                    style: AppFonts.courier(
                      fontSize: 11,
                      color: const Color(0xFFD4C4A8).withValues(alpha: 0.9),
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
        color: const Color(0xFF7C6B45).withValues(alpha: 0.8),
        border: const Border(
          top: BorderSide(color: Color(0xFF7C6B45), width: 2),
          bottom: BorderSide(color: Color(0xFF7C6B45), width: 2),
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
        'NÍVEIS',
        style: AppFonts.specialElite(fontSize: 14, color: Colors.white, letterSpacing: 2.0),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildDetailContainer() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4, left: 6, right: 6, bottom: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFE5DCC3),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const SizedBox(height: 1600),
        ),
        
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 800),
          decoration: BoxDecoration(
            color: levelPaperLevel,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: levelBorderMain, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.02),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              Positioned(
                top: 16,
                right: 16,
                child: Transform.rotate(
                  angle: 0.052, // ~3 graus
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 140),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: levelPostit,
                      border: Border.all(color: Colors.black.withValues(alpha: 0.15), width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      '"A noite esconde os crimes."',
                      style: AppFonts.handwriting(
                        fontSize: 11,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 16, right: 128),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NÍVEL 3 — Docas do Petshop (Noite)',
                            style: AppFonts.courier(fontSize: 16, color: levelInk, letterSpacing: 0.5),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: levelRed.withValues(alpha: 0.15),
                              border: Border.all(color: levelRed, width: 1),
                            ),
                            child: Text(
                              'CASO: SC-LOC-003',
                              style: AppFonts.courier(fontSize: 10, color: levelRed, letterSpacing: 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),

                    _buildSection(
                      title: 'Resumo do Caso',
                      content: 'Sob o manto da escuridão, Jessica se infiltra na área de carga e descarga do Petshop. O local, antes movimentado e barulhento durante o dia, agora é silencioso e mortal.',
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Descrição do Ambiente',
                      bulletPoints: [
                        'Iluminação precária, apenas postes distantes e lanternas dos guardas.',
                        'Sombras longas e áreas de total escuridão.',
                        'Containers empilhados criando labirintos.',
                        'Neblina baixa vinda do mar próximo.',
                        'Som de passos, vento e metal rangendo.',
                      ],
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Objetivos do Jogador',
                      bulletPoints: [
                        'Navegar furtivamente entre os containers.',
                        'Evitar o cone de visão dos capangas.',
                        'Encontrar documentos de remessa no escritório externo.',
                        'Localizar a entrada para o Galpão Principal.',
                      ],
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'NPCs Presentes',
                      content: 'Capangas (Patrulha) • Motorista do Caminhão (Dormindo)',
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Inimigos / Ameaças',
                      content: 'Risco Alto. Capangas armados. Ser visto resulta em falha imediata ou confronto difícil.',
                      isItalic: true,
                      isRedText: true,
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Desafios e Puzzles',
                      content: 'Stealth (Furtividade) • Timing de patrulha • Encontrar chave do portão',
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Fluxo do Nível',
                      isFlowBox: true,
                      content: 'Cerca externa → Labirinto de Containers → Escritório (Chave) → Portão do Galpão',
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Conexão com a Narrativa',
                      content: 'Confirma o tráfico de animais e eleva a aposta: agora é uma questão de vida ou morte.',
                      highlight: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    String? content,
    List<String>? bulletPoints,
    bool highlight = false,
    bool isItalic = false,
    bool isFlowBox = false,
    bool isRedText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black.withValues(alpha: 0.15), width: 1),
            ),
          ),
          child: Text(
            title.toUpperCase(),
            style: AppFonts.specialElite(
              fontSize: 13,
              color: highlight ? levelRed : levelInk,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (isFlowBox)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: levelBlue.withValues(alpha: 0.08),
              border: Border.all(color: levelBlue, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              content ?? '',
              style: AppFonts.courier(fontSize: 12, color: levelBlue),
            ),
          )
        else if (bulletPoints != null)
          ...bulletPoints.map((point) => Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• ', style: AppFonts.georgia(fontSize: 14, color: levelInk)),
                Expanded(
                  child: Text(
                    point,
                    style: AppFonts.georgia(fontSize: 14, color: levelInk, height: 1.5),
                  ),
                ),
              ],
            ),
          ))
        else
          Text(
            content ?? '',
            style: AppFonts.georgia(
              fontSize: 14,
              color: isRedText ? levelRed : levelInk,
              height: 1.5,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            ),
          ),
      ],
    );
  }
}