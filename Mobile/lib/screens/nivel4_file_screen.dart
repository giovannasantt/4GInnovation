import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/case_header.dart';

// Paleta compartilhada (todos os níveis)
const levelBackground = Color(0xFF100C08);
const levelPaperLevel = Color(0xFFF3E9D2);
const levelInk = Color(0xFF2B2B2B);
const levelRed = Color(0xFFC41E3A);
const levelBlue = Color(0xFF1F2A44);
const levelPostit = Color(0xFFFFF9C4);
const levelBorderMain = Color(0xFF8B7355);

/// Tela do Nível 4 - Galpão dos Contrabandistas
/// 
/// DIFERENÇA DOS OUTROS NÍVEIS:
/// - Confronto direto com contrabandistas
/// - Ambiente de grande tensão
/// - Combinação de stealth + ação
/// - Descoberta da operação criminosa completa
/// 
/// CONTEÚDO ÚNICO:
/// - Post-it: "Cuidado com os contrabandistas"
/// - Caso: SC-LOC-004
/// - Foco em investigação + combate
class Nivel4FileScreen extends StatelessWidget {
  const Nivel4FileScreen({Key? key}) : super(key: key);

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
                  angle: -0.035, // ~-2 graus
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
                      '"Cuidado com os contrabandistas."',
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
                            'NÍVEL 4 — Galpão dos Contrabandistas',
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
                              'CASO: SC-LOC-004',
                              style: AppFonts.courier(fontSize: 10, color: levelRed, letterSpacing: 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),

                    _buildSection(
                      title: 'Resumo do Caso',
                      content: 'Dentro do galpão, a escala da operação é revelada. Gaiolas empilhadas até o teto, animais exóticos e uma infraestrutura logística complexa. Jessica precisa encontrar provas definitivas.',
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Descrição do Ambiente',
                      bulletPoints: [
                        'Espaço amplo, teto alto, eco constante.',
                        'Cheiro forte de animais e serragem.',
                        'Gaiolas cobertas com panos, caixas marcadas com "FRÁGIL".',
                        'Escritório suspenso no segundo andar com vista para o galpão.',
                        'Iluminação industrial amarela e forte.',
                      ],
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Objetivos do Jogador',
                      bulletPoints: [
                        'Fotografar os animais (prova de crime).',
                        'Encontrar o manifesto de carga.',
                        'Acessar o escritório do chefe da operação.',
                        'Descobrir a passagem secreta para o laboratório.',
                      ],
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'NPCs Presentes',
                      content: 'Contrabandistas (Trabalhando) • Chefe da Operação (No escritório)',
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Inimigos / Ameaças',
                      content: 'Risco Médio. Trabalhadores podem chamar segurança. Evite confronto direto.',
                      isItalic: true,
                      isRedText: true,
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Desafios e Puzzles',
                      content: 'Encontrar código do cofre • Mover caixas para criar caminho (Sokoban simplificado)',
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Fluxo do Nível',
                      isFlowBox: true,
                      content: 'Térreo (Fotos) → Passarelas Superiores → Escritório → Passagem Secreta',
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Conexão com a Narrativa',
                      content: 'As provas coletadas aqui são suficientes para a polícia, mas a passagem secreta sugere que há mais.',
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