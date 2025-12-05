import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/category.dart';

/// Widget reutilizável que representa uma pasta/categoria visual
/// Exibido na tela inicial em GridView
/// 
/// DESIGN: Simula pasta física de arquivo com:
/// - Aba superior (tab)
/// - Corpo com gradiente e sombra
/// - Clipe de papel decorativo
/// - Ícone, título e contador de arquivos
/// 
/// INTERATIVIDADE: Detecta toque e executa callback onTap
class FolderCard extends StatelessWidget {
  /// Categoria que este card representa (contém dados e estilo)
  final Category category;
  
  /// Callback executado quando usuário toca no card
  /// VoidCallback = função sem parâmetros e sem retorno (void)
  /// Usado para navegação (definido pela tela pai)
  final VoidCallback onTap;

  const FolderCard({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ==================== CONSTANTES DE LAYOUT ====================
    // const = valores conhecidos em compile-time (otimização)
    // double = número decimal (pixels)
    
    const double tabHeight = 16.0;      // Altura da aba superior
    const double tabWidth = 50.0;       // Largura da aba
    const double tabLeft = 12.0;        // Distância da aba à borda esquerda
    const double borderRadius = 8.0;    // Raio dos cantos arredondados
    
    // ==================== WIDGET RAIZ ====================
    // GestureDetector captura eventos de toque
    return GestureDetector(
      // onTap dispara quando usuário toca e solta no widget
      onTap: onTap,
      
      // Stack empilha widgets (aba + corpo da pasta)
      child: Stack(
        // clipBehavior: Clip.none permite que filhos "vazem" para fora
        // Necessário porque aba fica parcialmente acima do corpo
        clipBehavior: Clip.none,
        children: [
          // ==================== ABA DA PASTA (TAB) ====================
          // Positioned permite posicionar widget dentro da Stack
          Positioned(
            top: 0,          // Topo da Stack
            left: tabLeft,   // 12px da borda esquerda
            width: tabWidth, // Largura fixa de 50px
            height: tabHeight, // Altura fixa de 16px
            child: Container(
              decoration: BoxDecoration(
                // Cor da aba igual à cor da categoria
                color: category.color,
                // BorderRadius.only = cantos arredondados apenas em alguns lados
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),   // Canto superior esquerdo
                  topRight: Radius.circular(borderRadius),  // Canto superior direito
                ),
                // Borda sólida da mesma cor (reforça visual)
                border: Border.all(color: category.color, width: 1),
              ),
            ),
          ),
          
          // ==================== CORPO PRINCIPAL DA PASTA ====================
          // Positioned.fill expande widget para preencher Stack
          Positioned.fill(
            top: 12,  // Começa 12px abaixo do topo (deixa espaço para aba)
            child: Container(
              // clipBehavior: Clip.hardEdge corta conteúdo que vazar do borderRadius
              // hardEdge = mais performático que antiAlias (sem suavização)
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: category.color,  // Cor de fundo da categoria
                borderRadius: BorderRadius.circular(borderRadius),
                // boxShadow cria lista de sombras (pode ter múltiplas)
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),  // Preto 40% opaco
                    offset: const Offset(0, 4),  // Desloca 4px para baixo
                    blurRadius: 8,               // Difusão de 8px
                  ),
                ],
              ),
              
              // Stack interna para sobrepor gradiente, linha e conteúdo
              child: Stack(
                children: [
                  // ========== GRADIENTE RADIAL (PROFUNDIDADE) ==========
                  // Container vazio com apenas decoração (gradiente)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      // RadialGradient = gradiente circular partindo do centro
                      gradient: RadialGradient(
                        center: Alignment.center,  // Centro do gradiente
                        radius: 1.2,               // Raio (1.0 = borda, >1.0 = além)
                        // Cores: transparente no centro → preto nas bordas
                        // Cria efeito de vinheta (escurecimento nas bordas)
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.3)
                        ],
                      ),
                    ),
                  ),

                  // ========== LINHA DE DESTAQUE (BRILHO) ==========
                  // Positioned com dimensões específicas
                  Positioned(
                    top: 0,        // Topo do container
                    left: 0,       // Borda esquerda
                    right: 0,      // Borda direita (ocupa largura total)
                    height: 1,     // 1 pixel de altura
                    // Container branco semi-transparente (simula reflexo de luz)
                    child: Container(color: Colors.white.withValues(alpha: 0.15)),
                  ),

                  // ========== CONTEÚDO CENTRALIZADO ==========
                  // Align centraliza filho dentro do espaço disponível
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      // Column organiza filhos verticalmente
                      child: Column(
                        // MainAxisSize.min = Column ocupa apenas espaço necessário
                        // (sem isso, ocuparia toda altura disponível)
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // ===== ÍCONE DA CATEGORIA =====
                          Icon(
                            category.icon,  // IconData vindo da categoria
                            size: 24,       // Tamanho em pixels
                            color: Colors.black.withValues(alpha: 0.75),  // Preto 75% opaco
                          ),
                          const SizedBox(height: 4),  // Espaçamento vertical
                          
                          // ===== TÍTULO DA CATEGORIA =====
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              category.title,  // Ex: "Personagens", "Locais"
                              style: TextStyle(
                                color: Colors.black.withValues(alpha: 0.9),
                                fontSize: 14,
                                fontFamily: 'Special Elite',  // Fonte customizada
                                height: 1.0,  // Line height (1.0 = compacto)
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,  // Máximo 1 linha
                              // TextOverflow.ellipsis adiciona "..." se texto não caber
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 2),
                          
                          // ===== CONTADOR DE ARQUIVOS =====
                          Text(
                            // String interpolation: ${expressão}
                            // category.cases.length = número de casos na categoria
                            "${category.cases.length} arquivos",
                            style: TextStyle(
                              color: Colors.black.withValues(alpha: 0.8),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Courier Prime',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ========== CLIPE DE PAPEL DECORATIVO ==========
                  // Positioned no canto superior direito
                  Positioned(
                    top: -6,     // 6px ACIMA do topo (negativo = fora do container)
                    right: 12,   // 12px da borda direita
                    child: Transform.rotate(
                      // angle em radianos (-0.1 ≈ -5.7 graus)
                      // Rotação anti-horária leve para efeito realista
                      angle: -0.1,
                      // SvgPicture.asset carrega SVG da pasta assets
                      child: SvgPicture.asset(
                        'assets/images/paper_clip.svg',
                        width: 24,
                        height: 24,
                        // ColorFilter permite recolorir SVG
                        colorFilter: ColorFilter.mode(
                          Colors.white.withValues(alpha: 0.6),  // Branco 60% opaco
                          BlendMode.srcIn,  // Modo de blend (substitui cor original)
                        ),
                      ),
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
}
