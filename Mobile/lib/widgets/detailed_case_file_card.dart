import 'package:flutter/material.dart';

/// Widget reutilizável que representa um card de caso/arquivo individual
/// Exibido em grid 2x2 na tela de categoria (CategoryScreen)
/// 
/// DESIGN: Simula cartão de arquivo investigativo com:
/// - Ícone de documento (canto superior esquerdo)
/// - Botão de favorito (estrela no canto superior direito)
/// - Número do caso em caixa branca destacada
/// - Nome do sujeito/título na parte inferior
/// 
/// INTERATIVIDADE:
/// - Toque no card → navega para tela de detalhes
/// - Toque na estrela → adiciona/remove dos favoritos
class DetailedCaseFileCard extends StatelessWidget {
  /// Código único do caso (ex: "SC-CHAR-001", "SC-LOC-002")
  final String caseNumber;
  
  /// Nome do sujeito/título do caso (ex: "Jessica Campos", "Bar do Bico Torto")
  final String subject;
  
  /// Callback executado quando usuário toca no card
  /// VoidCallback = função sem parâmetros nem retorno
  final VoidCallback onTap;
  
  /// Indica se caso está marcado como favorito
  /// bool determina qual ícone exibir (star vs star_border)
  final bool isFavorite;
  
  /// Callback executado quando usuário toca no botão de favorito
  /// Alterna estado de favorito (adiciona/remove)
  final VoidCallback onToggleFavorite;

  const DetailedCaseFileCard({
    Key? key,
    required this.caseNumber,
    required this.subject,
    required this.onTap,
    required this.isFavorite,
    required this.onToggleFavorite,
  }) : super(key: key);

  /// Formata número do caso extraindo apenas a parte numérica final
  /// Exemplo: "SC-CHAR-001" → "001"
  /// 
  /// Como funciona:
  /// 1. split('-') divide string em array usando '-' como separador
  ///    "SC-CHAR-001" → ["SC", "CHAR", "001"]
  /// 2. parts.last retorna último elemento do array ("001")
  /// 3. Se não houver '-', retorna string original
  /// 
  /// @param raw - Código completo do caso
  /// @return Parte numérica do código
  String _formatCaseNumber(String raw) {
    // split() retorna List<String>
    final parts = raw.split('-');
    
    // isNotEmpty verifica se lista tem pelo menos 1 elemento
    // (previne erro se string estiver vazia)
    if (parts.isNotEmpty) {
      // .last retorna último elemento da lista
      return parts.last;
    }
    // Fallback: retorna string original se não houver '-'
    return raw;
  }

  @override
  Widget build(BuildContext context) {
    // ==================== WIDGET RAIZ ====================
    // GestureDetector captura toque para navegação
    return GestureDetector(
      onTap: onTap,  // Navega para tela de detalhes
      
      // Container principal do card
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF2E8D5),  // Bege (cor de papel envelhecido)
          borderRadius: BorderRadius.circular(8),
          // Sombra para dar profundidade
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),  // Preto 20% opaco
              blurRadius: 6,         // Difusão da sombra
              offset: const Offset(0, 3),  // Desloca 3px para baixo
            ),
          ],
        ),
        
        // Stack para sobrepor elementos (ícone, estrela, número, sujeito)
        child: Stack(
          children: [
            // ========== ÍCONE DE DOCUMENTO (SUPERIOR ESQUERDO) ==========
            // Positioned permite posicionar widget dentro da Stack
            Positioned(
              top: 12,
              left: 12,
              child: Icon(
                Icons.description_outlined,  // Ícone de documento (Material Icons)
                color: Colors.black.withValues(alpha: 0.3),  // Preto 30% opaco (discreto)
                size: 20,
              ),
            ),

            // ========== BOTÃO DE FAVORITO (SUPERIOR DIREITO) ==========
            Positioned(
              top: 0,
              right: 0,
              // GestureDetector independente para capturar toque apenas na estrela
              child: GestureDetector(
                onTap: () {
                  onToggleFavorite();  // Executa callback de toggle
                },
                // HitTestBehavior.opaque faz área de toque incluir padding
                // (sem isso, só toque direto no Icon dispararia evento)
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),  // Aumenta área clicável
                  child: Icon(
                    // Operador ternário: condição ? seVerdadeiro : seFalso
                    // Se é favorito → estrela preenchida, senão → estrela vazia
                    isFavorite ? Icons.star : Icons.star_border,
                    size: 20,
                    // Cor também muda baseado em isFavorite
                    color: isFavorite 
                        ? const Color(0xFF8B7355)  // Marrom/dourado quando ativo
                        : Colors.black.withValues(alpha: 0.4),  // Cinza quando inativo
                  ),
                ),
              ),
            ),

            // ========== CAIXA BRANCA COM NÚMERO DO CASO ==========
            Positioned(
              top: 45,    // Abaixo do ícone de documento
              left: 14,
              right: 14,  // Ocupa largura do card menos margens
              child: Container(
                height: 42,  // Altura fixa
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,  // Fundo branco para destacar
                  // Sombra sutil para elevar caixa
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                // Column organiza label "CASO N°" e número verticalmente
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,  // Alinha à esquerda
                  mainAxisAlignment: MainAxisAlignment.center,   // Centraliza verticalmente
                  children: [
                    // Label "CASO N°" em caixa alta
                    const Text(
                      "CASO N°",
                      style: TextStyle(
                        fontFamily: 'Courier Prime',
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,  // Cinza médio
                        letterSpacing: 1.0,     // Espaçamento entre letras
                      ),
                    ),
                    const SizedBox(height: 2),  // Pequeno espaço vertical
                    
                    // Número do caso formatado (ex: "001")
                    Text(
                      _formatCaseNumber(caseNumber),  // Chama método de formatação
                      style: const TextStyle(
                        fontFamily: 'Special Elite',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,  // Quase preto
                        height: 1.0,  // Line height compacto
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ========== NOME DO SUJEITO (PARTE INFERIOR) ==========
            Positioned(
              top: 100,      // Abaixo da caixa de número
              left: 14,
              right: 14,
              bottom: 18,    // Margem inferior
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label "SUJEITO:" em caixa alta
                  const Text(
                    "SUJEITO:",
                    style: TextStyle(
                      fontFamily: 'Courier Prime',
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 3),
                  
                  // Nome do sujeito (ex: "Jessica Campos")
                  Text(
                    subject,
                    style: const TextStyle(
                      fontFamily: 'Special Elite',
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.1,  // Line height levemente espaçado
                    ),
                    // maxLines: 2 limita a 2 linhas
                    maxLines: 2,
                    // TextOverflow.ellipsis adiciona "..." se exceder 2 linhas
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
