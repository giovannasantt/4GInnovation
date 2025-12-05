// Arquivo: category_screen.dart
// Descrição: Tela que exibe os casos/arquivos de uma categoria específica.
// Mostra um grid de cartões de casos com busca, filtro de favoritos e navegação
// para telas de detalhes de personagens, locais, NPCs e easter eggs.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/category.dart';
import '../widgets/case_header.dart';
import '../widgets/detailed_case_file_card.dart';
import '../services/favorites_service.dart';
import 'case_detail_screen.dart';
import 'music_player_screen.dart';
import 'desenvolvedores_file_screen.dart';
import 'mapas_file_screen.dart';

// Imports das telas de personagens, níveis, NPCs e easter eggs
import 'jessica_file_screen.dart';
import 'nivel1_file_screen.dart';
import 'nivel2_file_screen.dart';
import 'nivel3_file_screen.dart';
import 'nivel4_file_screen.dart';
import 'nivel5_file_screen.dart';
import 'senhor_e_file_screen.dart';
import 'capangas_file_screen.dart';
import 'funcionarios_snout_file_screen.dart';
import 'cientistas_file_screen.dart';
import 'contrabandistas_file_screen.dart';
import 'civis_file_screen.dart';
import 'homem_misterioso_file_screen.dart';
import 'garconete_informal_file_screen.dart';
import 'jovem_ansioso_file_screen.dart';
import 'mulher_silenciosa_file_screen.dart';
import 'homem_solitario_file_screen.dart';

import 'relogio_quebrado_file_screen.dart';
import 'mensagens_ocultas_file_screen.dart';
import 'simbolo_recursivo_file_screen.dart';

// Constantes de cores para telas especiais
const mapasBackground = Color(0xFF100C08);
const devBackground = Color(0xFFF5EFE7);

/// Tela de categoria que exibe lista/grid de casos
/// StatefulWidget porque precisa gerenciar estado mutável:
/// - showFavorites (filtro de favoritos ativo/inativo)
/// - searchQuery (texto digitado no campo de busca)
/// Sem estado, não seria possível atualizar UI quando usuário filtra ou busca
class CategoryScreen extends StatefulWidget {
  // final porque valor não muda após construção
  // required porque categoria é obrigatória (sem ela a tela não faz sentido)
  final Category category;

  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  // createState() retorna instância do State que gerencia esta tela
  State<CategoryScreen> createState() => _CategoryScreenState();
}

/// State privado (underscore _) que gerencia estado mutável da CategoryScreen
class _CategoryScreenState extends State<CategoryScreen> {
  // Estado 1: Controla se filtro de favoritos está ativo
  // bool porque é liga/desliga (true = mostrar só favoritos, false = mostrar todos)
  bool showFavorites = false;
  
  // Estado 2: Armazena texto digitado no campo de busca
  // String vazia = nenhum filtro de busca ativo
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    // REDIRECIONAMENTOS ESPECIAIS: Algumas categorias têm telas dedicadas
    // Em vez de mostrar lista de casos, abrem outra tela imediatamente
    
    // Categoria "músicas" abre MusicPlayerScreen
    if (widget.category.id == 'musicas') {
      // WidgetsBinding.instance.addPostFrameCallback executa APÓS o build terminar
      // Necessário porque não podemos chamar Navigator.push durante o build
      // (mudaria a árvore de widgets enquanto está sendo construída = erro)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Navigator.pushReplacement substitui tela atual (não adiciona na pilha)
        // Assim "voltar" não volta para esta tela vazia
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MusicPlayerScreen(),
          ),
        );
      });
      // Retorna Scaffold temporário com loading enquanto redireciona
      return const Scaffold(
        backgroundColor: Color(0xFF1A1614),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    
    // Categoria "desenvolvedores" abre tela de créditos
    if (widget.category.id == 'desenvolvedores') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DesenvolvedoresFileScreen(),
          ),
        );
      });
      return const Scaffold(
        backgroundColor: devBackground,
        body: Center(child: CircularProgressIndicator()),
      );
    }
    
    // Categoria "mapas" abre tela de mapas interativos
    if (widget.category.id == 'mapas') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MapasFileScreen(),
          ),
        );
      });
      return const Scaffold(
        backgroundColor: mapasBackground,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // ValueListenableBuilder escuta mudanças em ValueNotifier
    // Reconstrói UI automaticamente quando favoritos mudam (SEM usar setState!)
    // Mais eficiente que setState porque reconstrói apenas este builder, não tela inteira
    return ValueListenableBuilder<Set<String>>(
      // valueListenable é o ValueNotifier que será escutado
      // FavoritesService().favoriteIds contém Set<String> com IDs dos favoritos
      valueListenable: FavoritesService().favoriteIds,
      
      // builder é chamado quando:
      // 1. Widget é criado pela primeira vez
      // 2. ValueNotifier notifica mudança (addFavorite/removeFavorite)
      // favorites = valor atual do Set<String>
      builder: (context, favorites, _) {
        
        // Filtra casos baseado em busca E favoritos
        // where() retorna Iterable com casos que passam nos testes
        final filteredCases = widget.category.cases.where((c) {
          // Teste 1: Caso corresponde ao texto da busca?
          // toLowerCase() torna busca case-insensitive
          // contains() retorna true se substring existe
          // Busca em subject (nome) OU caseNumber (código)
          final matchesSearch = c.subject.toLowerCase().contains(searchQuery.toLowerCase()) ||
                                c.caseNumber.toLowerCase().contains(searchQuery.toLowerCase());
          
          // Teste 2: Caso deve ser exibido baseado em filtro de favoritos?
          // Se showFavorites = false, matchesFav = true (mostra todos)
          // Se showFavorites = true, matchesFav depende se está em favorites Set
          final matchesFav = !showFavorites || favorites.contains(c.caseNumber);
          
          // Retorna true APENAS se caso passa nos DOIS testes (AND lógico)
          return matchesSearch && matchesFav;
        }).toList();  // Converte Iterable para List (requerido pelo ListView/GridView)

        return Scaffold(
          backgroundColor: const Color(0xFF1A1614),
          body: Stack(
            children: [
               // Camada 1: Sombra global escura
               Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.9),
                        blurRadius: 100,
                        spreadRadius: -12,
                      ),
                    ],
                  ),
                ),
               ),
               
               // Camada 2: Textura de fundo SVG
               Positioned.fill(
                 child: Opacity(
                   opacity: 1.0,
                   child: SvgPicture.asset(
                     'assets/images/dark_texture.svg', 
                     fit: BoxFit.cover,
                   ),
                 ),
               ),

               SafeArea(
                 bottom: false,
                 child: Column(
                   children: [
                     // Cabeçalho com logo
                     const CaseHeader(),

                     // Barra de navegação e busca
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             children: [
                               // Botão de voltar
                               _buildNavButton(
                                 icon: Icons.arrow_back, 
                                 label: "VOLTAR", 
                                 onTap: () => Navigator.pop(context)
                               ),
                               const Spacer(),
                               // Botão de filtrar favoritos (estrela)
                               GestureDetector(
                                 onTap: () => setState(() => showFavorites = !showFavorites),
                                 behavior: HitTestBehavior.opaque,
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Icon(
                                     showFavorites ? Icons.star : Icons.star_border, 
                                     color: showFavorites ? const Color(0xFFF4E4C1) : const Color(0xFF8B7355).withValues(alpha: 0.7),
                                     size: 26,
                                   ),
                                 ),
                               ),
                             ],
                           ),
                           const SizedBox(height: 16),
                           
                           // Campo de busca
                           Container(
                             height: 40,
                             decoration: BoxDecoration(
                               color: Colors.transparent,
                               border: Border.all(color: const Color(0xFF8B7355).withValues(alpha: 0.4)),
                               borderRadius: BorderRadius.circular(6),
                             ),
                             child: TextField(
                               onChanged: (val) => setState(() => searchQuery = val),
                               style: const TextStyle(color: Color(0xFFF4E4C1), fontFamily: 'Courier Prime', fontSize: 14),
                               cursorColor: const Color(0xFF8B7355),
                               decoration: InputDecoration(
                                 prefixIcon: Icon(Icons.search, color: const Color(0xFF8B7355).withValues(alpha: 0.7), size: 18),
                                 hintText: "Buscar casos...",
                                 hintStyle: TextStyle(color: const Color(0xFF8B7355).withValues(alpha: 0.5), fontFamily: 'Courier Prime', fontSize: 14),
                                 border: InputBorder.none,
                                 contentPadding: const EdgeInsets.symmetric(vertical: 10),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),

                     // Faixa de título da categoria
                     Container(
                       width: double.infinity,
                       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                       decoration: BoxDecoration(
                         color: widget.category.color.withValues(alpha: 0.6),
                         border: Border.symmetric(
                           horizontal: BorderSide(
                             color: widget.category.color.withValues(alpha: 0.8),
                             width: 2,
                           )
                         ),
                       ),
                       child: Text(
                         widget.category.title.toUpperCase(),
                         style: const TextStyle(
                           fontFamily: 'Special Elite',
                           fontSize: 14,
                           color: Color(0xFFF4E4C1), 
                           letterSpacing: 2.0,
                           shadows: [Shadow(offset: Offset(0,1), blurRadius: 2, color: Colors.black)],
                         ),
                       ),
                     ),

                     // Grid de casos filtrados
                     Expanded(
                       child: widget.category.id == 'musicas' 
                       ? _buildMusicList(filteredCases)
                       : Padding(
                         padding: const EdgeInsets.all(16.0),
                         child: GridView.builder(
                            padding: const EdgeInsets.only(bottom: 20),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.62, 
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: filteredCases.length,
                            itemBuilder: (context, index) {
                              final item = filteredCases[index];
                              final isFav = favorites.contains(item.caseNumber);
                              
                              return DetailedCaseFileCard(
                                caseNumber: item.caseNumber,
                                subject: item.subject,
                                isFavorite: isFav,
                                onToggleFavorite: () {
                                  FavoritesService().toggleFavorite(item.caseNumber);
                                },
                                onTap: () {
                                    // Navegação baseada no código do caso
                                    // Cada caso tem uma tela específica ou usa a tela genérica
                                    
                                    if (item.caseNumber == 'SC-CHAR-001') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const JessicaFileScreen()),
                                      );
                                    } 
                                    else if (item.caseNumber == 'SC-LOC-001') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Nivel1FileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-LOC-002') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Nivel2FileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-LOC-003') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Nivel3FileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-LOC-004') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Nivel4FileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-LOC-005') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Nivel5FileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-CHAR-002') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const SenhorEFileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-NPC-001') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const CapangasFileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-NPC-002') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const FuncionariosSnoutFileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-NPC-003') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const CientistasFileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-NPC-004') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const ContrabandistasFileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-NPC-005') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const CivisFileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-NPC-006') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const HomemMisteriosoFileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-NPC-007') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const GarconeteInformalFileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-NPC-008') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const JovemAnsiosoFileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-NPC-009') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const MulherSilenciosaFileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-NPC-010') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const HomemSolitarioFileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-EE-001') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const RelogioQuebradoFileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-EE-002') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const MensagensOcultasFileScreen()),
                                      );
                                    }
                                    else if (item.caseNumber == 'SC-EE-003') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const SimboloRecursivoFileScreen()),
                                      );
                                    }
                                    // Navegação padrão para casos sem tela específica
                                    else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => CaseDetailScreen(caseFile: item)),
                                      );
                                    }
                                },
                              );
                            },
                         ),
                       ),
                     ),

                     // Rodapé decorativo
                     Container(
                      height: 2.0,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: const Color(0xFFF4E4C1).withValues(alpha: 0.2),
                            width: 1.18,
                          ),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            const Color(0xFF1A180C).withValues(alpha: 0.95),
                            const Color(0xFF0D0805).withValues(alpha: 0.98),
                          ],
                        ),
                      ),
                    ),
                   ],
                 ),
               ),
            ],
          ),
        );
      }
    );
  }

  // Constrói um botão de navegação estilizado (ex: botão "Voltar")
  Widget _buildNavButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140, 
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF8B7355).withValues(alpha: 0.6),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(4),
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 14,
              color: const Color(0xFFF4E4C1),
            ),
            const SizedBox(width: 6),
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Courier Prime',
                fontSize: 11,
                color: Color(0xFFF4E4C1),
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Constrói lista de músicas (usado quando a categoria é "músicas")
  Widget _buildMusicList(List<dynamic> items) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (c, i) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MusicPlayerScreen(caseFile: item)),
            );
          },
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[800]!),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.play_circle_outline, color: Color(0xFF8B6B4E), size: 32),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.subject.toUpperCase(),
                        style: const TextStyle(color: Colors.white, fontFamily: 'Courier Prime', fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}