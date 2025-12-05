// Arquivo: home_screen.dart
// Descrição: Tela principal do aplicativo que exibe o menu de pastas/categorias.
// Mostra um grid responsivo de categorias (Personagens, NPCs, Locais, História, etc.)
// com fundo texturizado e navegação para as telas de detalhes.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../data/mock_data.dart';
import '../widgets/folder_card.dart';
import '../widgets/case_header.dart';
import 'category_screen.dart';
import 'historia_file_screen.dart';

/// Tela inicial (home) do aplicativo
/// StatelessWidget porque não há estado mutável (dados vêm de mock_data)
/// Exibe grid responsivo de categorias com layout adaptativo
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Carrega lista de categorias do arquivo de dados mockados
    // getMockCategories() retorna List<Category>
    final categories = getMockCategories();
    
    // Calcula total de arquivos somando length de todos os casos
    // fold<int> percorre lista acumulando soma (similar a reduce)
    // 0 = valor inicial, sum = acumulador, cat = item atual
    final totalFiles = categories.fold<int>(0, (sum, cat) => sum + cat.cases.length);
    
    // MediaQuery fornece informações sobre dimensões e características do dispositivo
    // Usado para layout responsivo (adaptar para mobile/tablet/desktop)
    final size = MediaQuery.of(context).size;
    final width = size.width;
    
    // Variáveis para configuração do GridView (dependem da largura da tela)
    int crossAxisCount;      // Número de colunas
    double itemHeight;       // Altura de cada item
    double mainSpacing;      // Espaçamento entre linhas
    
    // Breakpoints responsivos baseados em largura
    if (width >= 1024) {
      // Desktop/Tela grande: 4 colunas
      crossAxisCount = 4;
      itemHeight = 185.0;
      mainSpacing = 16.0;
    } else if (width >= 768) {
      // Tablet/Tela média: 3 colunas
      crossAxisCount = 3;
      itemHeight = 160.0;
      mainSpacing = 16.0;
    } else {
      // Mobile/Tela pequena: 2 colunas
      // Altura reduzida para caber ~4 linhas na tela sem scroll excessivo
      crossAxisCount = 2;
      itemHeight = 105.0;
      mainSpacing = 8.0;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1A1614),  // Fundo marrom escuro
      // Stack empilha widgets (children sobrepostos)
      // Ordem: primeiro child = fundo, último child = topo
      body: Stack(
        children: [
          // CAMADA 1: Sombra global difusa para profundidade visual
          // Positioned.fill faz Container ocupar todo espaço disponível da Stack
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.9),
                    blurRadius: 100,      // Sombra muito difusa
                    spreadRadius: -12,    // Negativo "puxa" sombra para dentro
                    offset: const Offset(0, 0),  // Centralizada
                  ),
                ],
              ),
            ),
          ),

          // CAMADA 2: Textura SVG de papel envelhecido
          // Positioned.fill garante que SVG cubra toda tela
          Positioned.fill(
            // Opacity permite ajustar transparência (1.0 = totalmente opaco)
            child: Opacity(
              opacity: 1.0,
              // SvgPicture.asset carrega SVG da pasta assets
              child: SvgPicture.asset(
                'assets/images/dark_texture.svg',
                fit: BoxFit.cover,  // Estica SVG para cobrir área completamente
              ),
            ),
          ),

          // CAMADA 3: Conteúdo principal (Header + Grid + Footer)
          // SafeArea evita que conteúdo fique sob notch/barra de status
          SafeArea(
            bottom: false,  // Permite conteúdo ir até borda inferior
            child: Column(
              children: [
                // Widget customizado de cabeçalho com logo e contador
                // Recebe totalFiles para exibir quantidade de arquivos
                CaseHeader(totalFiles: totalFiles),

                // Expanded faz GridView ocupar todo espaço vertical restante
                // Sem Expanded, GridView teria conflito de altura infinita
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    // GridView.builder constrói grid de forma lazy (sob demanda)
                    // Mais eficiente que GridView() para listas grandes
                    child: GridView.builder(
                      // Padding inferior para dar espaço ao final da lista
                      padding: const EdgeInsets.only(bottom: 20),
                      
                      // SliverGridDelegate define layout do grid
                      // FixedCrossAxisCount = número fixo de colunas
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,  // Número de colunas (responsivo)
                        mainAxisExtent: itemHeight,      // Altura fixa de cada item
                        crossAxisSpacing: 12,            // Espaço horizontal entre itens
                        mainAxisSpacing: mainSpacing,    // Espaço vertical entre itens
                      ),
                      
                      // Número total de itens no grid
                      itemCount: categories.length,
                      
                      // Builder chamado para cada item (lazy loading)
                      // context = BuildContext, index = posição do item (0-based)
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        
                        // Widget customizado que exibe cada pasta/categoria
                        // Recebe category e callback onTap
                        return FolderCard(
                          category: category,
                          // Função executada quando usuário toca na pasta
                          onTap: () {
                            // Verifica se é categoria "História" (id especial)
                            if (category.id == 'historia') {
                              // Navigator.push adiciona nova tela na pilha
                              // MaterialPageRoute cria transição Material Design
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // builder retorna widget da nova tela
                                  builder: (context) => const HistoriaFileScreen(),
                                ),
                              );
                            } else {
                              // Para outras categorias, navega para tela de listagem
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // Passa categoria como parâmetro para CategoryScreen
                                  builder: (context) => CategoryScreen(category: category),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),

                // Rodapé com informação de versão/copyright
                _buildFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Constrói rodapé com texto de copyright
  /// Container com padding e texto centralizado em fonte pequena
  Widget _buildFooter() {
    return Container(
      // Padding vertical maior que horizontal (espaço acima/abaixo)
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Text(
        'Snout\'s Case Wiki © 2024',  // \' escapa apóstrofo dentro de string
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white.withValues(alpha: 0.5),  // Branco semi-transparente
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}