import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';

/// Widget de cabeçalho reutilizável usado em TODAS as telas do aplicativo
/// Mantém design consistente e identidade visual
/// 
/// ELEMENTOS:
/// - Logo "SNOUT'S CASE" (título principal)
/// - Subtítulo descritivo em caixa
/// - Contador de arquivos (opcional)
/// - Botão "Voltar" (opcional)
/// 
/// DESIGN: Gradiente escuro, bordas douradas, sombra profunda
class CaseHeader extends StatelessWidget {
  /// Título principal (geralmente o logo do app)
  /// Valor padrão permite uso simples: CaseHeader()
  final String title;
  
  /// Subtítulo descritivo (linha abaixo do título)
  /// Contexto adicional sobre a seção atual
  final String subtitle;
  
  /// Número total de arquivos (exibido se fornecido)
  /// int? = opcional (pode ser null)
  /// Se null, não exibe contador
  final int? totalFiles;
  
  /// Se deve exibir botão "Voltar"
  /// bool com valor padrão false
  final bool showBack;
  
  /// Callback executado ao clicar em "Voltar"
  /// VoidCallback? = opcional (pode ser null)
  final VoidCallback? onBack;

  const CaseHeader({
    Key? key,
    // Valores padrão permitem uso flexível do widget
    this.title = "SNOUT'S CASE",
    this.subtitle = "ARQUIVOS INVESTIGATIVOS - DET. JESSICA CAMPOS",
    this.totalFiles,      // Sem valor padrão = null
    this.showBack = false,
    this.onBack,          // Sem valor padrão = null
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ==================== CONTAINER PRINCIPAL ====================
    return Container(
      width: double.infinity,  // Ocupa largura total da tela
      decoration: BoxDecoration(
        // LinearGradient cria transição suave de cor (vertical)
        gradient: LinearGradient(
          begin: Alignment.topCenter,    // Inicia no topo
          end: Alignment.bottomCenter,   // Termina embaixo
          colors: [
            // Gradiente: marrom escuro → quase preto
            const Color(0xFF1A180C).withValues(alpha: 0.98),  // 98% opaco
            const Color(0xFF0D0805),  // Totalmente opaco
          ],
        ),
        // Borda inferior sutil (separação visual)
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withValues(alpha: 0.1),
            width: 1.18,
          ),
        ),
        // Sombra profunda para elevar cabeçalho
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.8),  // Preto 80% opaco
            offset: const Offset(0, 8),  // Sombra 8px abaixo
            blurRadius: 24,              // Difusão larga
          ),
        ],
      ),
      // Padding interno do cabeçalho
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      
      // Column organiza filhos verticalmente
      child: Column(
        // MainAxisSize.min = Column ocupa apenas espaço necessário
        mainAxisSize: MainAxisSize.min,
        children: [
          // ========== BOTÃO "VOLTAR" (CONDICIONAL) ==========
          // if dentro de lista [] = renderização condicional
          // Widget só é adicionado se condição for true
          if (showBack && onBack != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              // Align posiciona filho (neste caso, à esquerda)
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: onBack,  // Executa callback quando tocado
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF8B7355).withValues(alpha: 0.6),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.transparent,  // Fundo transparente (só borda)
                    ),
                    // Row para ícone + texto lado a lado
                    child: Row(
                      mainAxisSize: MainAxisSize.min,  // Ocupa apenas espaço necessário
                      children: [
                        // Ícone de seta para esquerda
                        const Icon(
                          Icons.arrow_back,
                          size: 14,
                          color: Color(0xFFF4E4C1),  // Bege claro
                        ),
                        const SizedBox(width: 6),  // Espaçamento horizontal
                        // Texto "VOLTAR"
                        Text(
                          'VOLTAR',
                          // AppFonts.courier() retorna TextStyle customizado
                          style: AppFonts.courier(
                            fontSize: 11,
                            color: const Color(0xFFF4E4C1),
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          // ========== TÍTULO PRINCIPAL (LOGO) ==========
          Text(
            title,  // Ex: "SNOUT'S CASE"
            // AppFonts.specialElite() retorna TextStyle com fonte Special Elite
            style: AppFonts.specialElite(
              fontSize: 16,
              color: const Color(0xFFF4E4C1),  // Bege claro
              letterSpacing: 3.0,  // Espaçamento largo entre letras (estilo logo)
              height: 1.0,         // Line height compacto
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),  // Espaçamento vertical
          
          // ========== CAIXA COM SUBTÍTULO ==========
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              // Fundo muito transparente (5% opacidade)
              color: const Color(0xFFF4E4C1).withValues(alpha: 0.05),
              // Borda semi-transparente
              border: Border.all(
                color: const Color(0xFFF4E4C1).withValues(alpha: 0.3),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Text(
              subtitle,  // Ex: "ARQUIVOS INVESTIGATIVOS - DET. JESSICA CAMPOS"
              style: AppFonts.courier(
                fontSize: 8,
                color: const Color(0xFFD4C4A8).withValues(alpha: 0.8),
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 6),
          
          // ========== CONTADOR DE ARQUIVOS (CONDICIONAL) ==========
          // if (totalFiles != null) = só renderiza se totalFiles foi fornecido
          if (totalFiles != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,  // Centraliza horizontalmente
              children: [
                // Bolinha decorativa (bullet point)
                Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: Color(0xFF8B7355),  // Marrom
                    shape: BoxShape.circle,    // Formato circular
                  ),
                ),
                const SizedBox(width: 6),
                // Texto com número de arquivos
                // String interpolation: $variável ou ${expressão}
                Text(
                  '$totalFiles arquivos registrados',  // Ex: "27 arquivos registrados"
                  style: AppFonts.courier(
                    fontSize: 8,
                    color: const Color(0xFFD4C4A8).withValues(alpha: 0.7),
                    height: 1.0,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
