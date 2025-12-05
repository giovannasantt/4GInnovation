import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/case_header.dart';

// ==================== PALETA DE CORES COMPARTILHADA (NÍVEIS) ====================
// const = valores imutáveis conhecidos em compile-time
// Todos os 5 níveis compartilham mesma paleta (consistência visual)

/// Fundo escuro da tela (marrom muito escuro, quase preto)
const levelBackground = Color(0xFF100C08);

/// Cor do papel (bege claro) - simula dossiê investigativo
const levelPaperLevel = Color(0xFFF3E9D2);

/// Cor da tinta/texto principal (cinza escuro)
const levelInk = Color(0xFF2B2B2B);

/// Cor de alerta/perigo (vermelho escuro)
const levelRed = Color(0xFFC41E3A);

/// Cor de informação (azul escuro)
const levelBlue = Color(0xFF1F2A44);

/// Cor de post-it (amarelo claro)
const levelPostit = Color(0xFFFFF9C4);

/// Cor de borda principal (marrom médio)
const levelBorderMain = Color(0xFF8B7355);

/// Tela do Nível 1 - Rua Principal de São Domingues
/// 
/// StatelessWidget porque não há estado mutável
/// Todo conteúdo é estático (informações do nível)
/// 
/// ESTRUTURA DO LAYOUT:
/// - CaseHeader (cabeçalho do app)
/// - Botão Voltar
/// - Faixa de categoria "NÍVEIS"
/// - ScrollView com container de detalhes
/// 
/// PADRÃO DE DESIGN:
/// - Todos os 5 níveis seguem mesma estrutura
/// - Diferem apenas no conteúdo (textos, pistas, NPCs)
class Nivel1FileScreen extends StatelessWidget {
  const Nivel1FileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: levelBackground,  // Fundo escuro consistente
      // SafeArea previne conteúdo sob notch/status bar
      body: SafeArea(
        // Column organiza elementos verticalmente
        child: Column(
          children: [
            // Widget reutilizável de cabeçalho
            const CaseHeader(),
            
            // Método privado que retorna botão de navegação
            _buildBackButton(context),
            
            // Método privado que retorna faixa "NÍVEIS"
            _buildCategoryHeader(),
            
            // Expanded faz ScrollView ocupar espaço restante
            Expanded(
              // SingleChildScrollView permite rolagem vertical
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  // Método privado que retorna container principal
                  child: _buildDetailContainer(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Constrói botão "VOLTAR" interativo
  /// 
  /// DESIGN: Container com borda, ícone e texto
  /// FUNÇÃO: Navigator.pop() remove tela atual da pilha
  /// 
  /// @param context - BuildContext necessário para Navigator
  /// @return Widget do botão completo
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

  /// Constrói faixa de categoria "NÍVEIS"
  /// 
  /// DESIGN: Container com borda superior e inferior, texto "NÍVEIS"
  /// FUNÇÃO: Indica que a tela está relacionada a níveis de jogo
  /// 
  /// @return Widget da faixa completa
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
        style: AppFonts.specialElite(
          fontSize: 14,
          color: Colors.white,
          letterSpacing: 2.0,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  // Constrói container de detalhes com layout de papel empilhado
  // Usa Stack para sobrepor camada de sombra e documento principal
  Widget _buildDetailContainer() {
    return Stack(
      children: [
        // Camada de fundo (papel sob o documento principal)
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
          child: const SizedBox(height: 1800),
        ),
        
        // Container principal do documento
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
              // Textura de papel (overlay sutil)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.02),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              // Post-it amarelo no canto superior direito com anotação manuscrita
              Positioned(
                top: 16,
                right: 16,
                child: Transform.rotate(
                  angle: 0.035, // ~2 graus
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
                      '"Início calmo. Atenção aos detalhes."',
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

              // Conteúdo principal do documento (seções de informações do nível)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Container(
                      margin: const EdgeInsets.only(bottom: 16, right: 128),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NÍVEL 1 — Rua Principal de São Domingues',
                            style: AppFonts.courier(
                              fontSize: 16,
                              color: levelInk,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: levelRed.withValues(alpha: 0.15),
                              border: Border.all(color: levelRed, width: 1),
                            ),
                            child: Text(
                              'CASO: SC-LOC-001',
                              style: AppFonts.courier(
                                fontSize: 10,
                                color: levelRed,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Seções
                    _buildSection(
                      title: 'Resumo do Caso',
                      content: 'Jéssica inicia a investigação conversando com moradores e comerciantes da rua onde os desaparecimentos ocorreram. É um nível introdutório focado em diálogo e coleta de informações iniciais.',
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Descrição do Ambiente',
                      bulletPoints: [
                        'Rua residencial com comércios locais: cafeteria, sorveteria, pet shop, bar e pequenos mercados.',
                        'Asfalto escuro, calçadas cinzas.',
                        'Pessoas caminhando, carros passando.',
                        'Clima de manhã cedo, iluminação suave.',
                        'Bar no final da rua: fachada rústica, interior limpo e elegante com balcão, clientes e garçonete.',
                      ],
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Objetivos do Jogador',
                      bulletPoints: [
                        'Conversar com todos os NPCs.',
                        'Investigar comércios (cafeteria / sorveteria / bar).',
                        'Identificar pistas iniciais sobre desaparecimentos.',
                        'Encontrar informação sobre o bar ao final da rua.',
                        'Retornar ao carro da agência para completar o nível.',
                      ],
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'NPCs Presentes',
                      content: 'Comerciantes da rua • Clientes do bar • Moradores locais',
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Inimigos / Ameaças',
                      content: 'Nenhuma ameaça direta. Nível totalmente seguro.',
                      isItalic: true,
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Desafios e Puzzles',
                      content: 'Pequenos puzzles de diálogo • Identificação de pistas ambientais',
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Fluxo do Nível',
                      isFlowBox: true,
                      content: 'Rua → bar → conversa com NPCs → retorno ao carro → escritório → quadro investigativo',
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Itens Importantes / Fotos',
                      content: 'Fotos opcionais do bar e arredores • Anotações de depoimentos',
                    ),
                    const SizedBox(height: 16),

                    _buildSection(
                      title: 'Conexão com a Narrativa',
                      content: 'Este nível introduz a história e apresenta as primeiras hipóteses.',
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

  /// Constrói seção de detalhes com título e conteúdo
  /// 
  /// DESIGN: Título em negrito, conteúdo em texto normal
  /// FUNÇÃO: Organiza informações em seções para melhor leitura
  /// 
  /// @param title - Título da seção
  /// @param content - Texto principal da seção
  /// @param bulletPoints - Lista de pontos marcados (opcional)
  /// @param highlight - Se título deve ser destacado (opcional)
  /// @param isItalic - Se conteúdo deve ser em itálico (opcional)
  /// @param isFlowBox - Se conteúdo deve estar em caixa de fluxo (opcional)
  /// @return Widget da seção completa
  Widget _buildSection({
    required String title,
    String? content,
    List<String>? bulletPoints,
    bool highlight = false,
    bool isItalic = false,
    bool isFlowBox = false,
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
              border: Border.all(
                color: levelBlue,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              content ?? '',
              style: AppFonts.courier(
                fontSize: 12,
                color: levelBlue,
              ),
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
                    style: AppFonts.georgia(
                      fontSize: 14,
                      color: levelInk,
                      height: 1.5,
                    ),
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
              color: levelInk,
              height: 1.5,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            ),
          ),
      ],
    );
  }
}