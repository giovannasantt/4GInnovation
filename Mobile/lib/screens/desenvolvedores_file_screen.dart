import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/case_header.dart';

// Paleta de cores da tela de desenvolvedores
// Tom claro tipo quadro/mural com post-its roxos
const devBackgroundDark = Color(0xFF100C08);
const devBackground = Color(0xFFF5EFE7);
const devColor = Color(0xFF6B5A7C);
const accentBrown = Color(0xFF8B7355);
const stickyPurple = Color(0xFFE6D5F7);
const paperLight = Color(0xFFFAF8F3);
const borderDim = Color(0xFFD4C4A8);

/// Tela de créditos da equipe de desenvolvimento.
/// Apresenta os 6 desenvolvedores do jogo com suas fotos, especialidades e contribuições.
/// Design visual de mural investigativo com post-its e fotos polaroid.
class DesenvolvedoresFileScreen extends StatelessWidget {
  const DesenvolvedoresFileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista de dados dos desenvolvedores
    final desenvolvedores = [
      DevData(
        numero: '01',
        nome: 'Bruno S. Ichikawa',
        cargo: 'Web/Mobile Developer',
        area: 'Development',
        descricao: 'Especialista em desenvolvimento web e mobile, responsável pela arquitetura tecnológica dos projetos.',
        especialidades: [
          'Desenvolvimento Web Full-Stack',
          'Aplicações Mobile Nativas',
          'Arquitetura de Software',
          'APIs e Backend Systems'
        ],
        contribuicoes: 'Responsável pela implementação técnica da jogabilidade e sistemas de interface do usuário.',
        foto: 'assets/images/bruno_profile.png',
      ),
      DevData(
        numero: '02',
        nome: 'Giovanna C. de Santana',
        cargo: '3D Modeler',
        area: '3D Modeling',
        descricao: 'Artista 3D especializada na criação de modelos, texturas e assets visuais dos jogos.',
        especialidades: [
          'Modelagem 3D de Personagens',
          'Criação de Ambientes',
          'Texturização e Materiais',
          'Otimização de Assets'
        ],
        contribuicoes: 'Criou todos os modelos 3D dos personagens, NPCs e ambientes do jogo, incluindo o visual característico do Petshop Snout.',
        foto: 'assets/images/giovanna_profile.png',
      ),
      DevData(
        numero: '03',
        nome: 'Igor Michelini Pereira',
        cargo: 'Game Developer',
        area: 'Game Development',
        descricao: 'Desenvolvedor de jogos focado na programação de mecânicas e sistemas de gameplay.',
        especialidades: [
          'Programação de Mecânicas de Jogo',
          'Sistemas de Física e Colisão',
          'IA de NPCs',
          'Scripting e Eventos'
        ],
        contribuicoes: 'Implementou as mecânicas principais de investigação, sistema de diálogos e comportamento dos NPCs.',
        foto: 'assets/images/igor_profile.png',
      ),
      DevData(
        numero: '04',
        nome: 'Gabriel L. Villarinho',
        cargo: 'Level Designer',
        area: 'Level Design',
        descricao: 'Designer responsável pela criação e estruturação dos níveis e ambientes dos jogos.',
        especialidades: [
          'Design de Níveis',
          'Balanceamento de Gameplay',
          'Criação de Puzzles',
          'Flow e Pacing Narrativo'
        ],
        contribuicoes: 'Projetou os 8 locais principais da investigação, distribuiu pistas estrategicamente e criou a progressão narrativa.',
        foto: 'assets/images/gabriel_profile.png',
      ),
      DevData(
        numero: '05',
        nome: 'Guilherme S. Pereira',
        cargo: 'Sound Designer',
        area: 'Audio Design',
        descricao: 'Especialista em design de áudio, criação de trilhas sonoras e efeitos sonoros.',
        especialidades: [
          'Composição Musical',
          'Design de Efeitos Sonoros',
          'Áudio Ambiental',
          'Mixagem e Masterização'
        ],
        contribuicoes: 'Compôs toda a trilha sonora atmosférica, incluindo as músicas do bar e os sons ambientais que reforçam a tensão investigativa.',
        foto: 'assets/images/guilherme_profile.png',
      ),
      DevData(
        numero: '06',
        nome: 'Kevin N. Bezerra',
        cargo: 'Concept Artist',
        area: 'Concept Art',
        descricao: 'Artista conceitual responsável pela criação da identidade visual e conceitos artísticos.',
        especialidades: [
          'Arte Conceitual de Personagens',
          'Design de Ambientes',
          'Paleta de Cores',
          'Direção de Arte Visual'
        ],
        contribuicoes: 'Desenvolveu toda a identidade visual do jogo, desde os designs dos personagens até a estética sombria e investigativa do mundo de Snout\'s Case.',
        foto: 'assets/images/kevin_profile.png',
      ),
    ];

    return Scaffold(
      backgroundColor: devBackgroundDark, // Fundo escuro
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CaseHeader(),
            _buildBackButton(context),
            
            // Container principal com gradiente de papel creme
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
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
                  border: Border.all(color: accentBrown, width: 3),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    
                    // HEADER SECTION - Cabeçalho do documento com carimbo e informações
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: paperLight,
                        border: Border.all(color: accentBrown, width: 2),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 6,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Carimbo rotacionado no canto superior direito
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Transform.rotate(
                              angle: 0.21, // ~12 graus
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: devColor.withValues(alpha: 0.4),
                                    width: 2.6,
                                  ),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Text(
                                  'CRÉDITOS\nEQUIPE DE\nDESENVOLVIMENTO',
                                  textAlign: TextAlign.center,
                                  style: AppFonts.specialElite(
                                    fontSize: 8,
                                    color: devColor.withValues(alpha: 0.4),
                                    letterSpacing: 1.0,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                          // Conteúdo do cabeçalho (número do arquivo e data)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Número do arquivo/caso
                              Text(
                                '#SC-TEAM – EQUIPE SNOUT\'S CASE',
                                style: AppFonts.courier(
                                  fontSize: 8,
                                  color: Colors.black.withValues(alpha: 0.7),
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 10),
                              
                              // Data do documento
                              Text(
                                'Documentado em: 16/11/2025',
                                style: AppFonts.courier(
                                  fontSize: 9,
                                  color: Colors.black.withValues(alpha: 0.6),
                                ),
                              ),
                              const SizedBox(height: 10),
                              
                              // Post-it com informações sobre a equipe
                              Transform.rotate(
                                angle: -0.017,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: stickyPurple,
                                    border: Border.all(
                                      color: devColor.withValues(alpha: 0.3),
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.05),
                                        blurRadius: 2,
                                        offset: const Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    '👥 6 profissionais responsáveis pela criação do jogo',
                                    style: AppFonts.courier(
                                      fontSize: 9,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // TITLE SECTION
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              color: borderDim.withValues(alpha: 0.3),
                              border: Border.all(
                                color: const Color(0xFF564964),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.15),
                                  blurRadius: 8,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              'EQUIPE DE DESENVOLVIMENTO',
                              style: AppFonts.specialElite(
                                fontSize: 18,
                                color: Colors.black.withValues(alpha: 0.9),
                                letterSpacing: 1.3,
                              ),
                            ),
                          ),
                          
                          // Label on top
                          Positioned(
                            top: -5,
                            left: 15,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                              decoration: BoxDecoration(
                                color: devColor,
                                border: Border.all(
                                  color: const Color(0xFF8B7355),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Text(
                                'DESENVOLVEDORES',
                                style: AppFonts.specialElite(
                                  fontSize: 7,
                                  color: Colors.black,
                                  letterSpacing: 0.7,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // INTRODUÇÃO
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: paperLight,
                        border: Border.all(color: borderDim, width: 2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Snout\'s Case é o resultado do trabalho colaborativo de uma equipe multidisciplinar de 6 profissionais especializados. Cada membro trouxe sua expertise única para criar uma experiência investigativa imersiva e tecnicamente polida. Este documento registra os responsáveis pela criação do jogo e suas respectivas contribuições ao projeto.',
                        style: AppFonts.courier(
                          fontSize: 10,
                          color: Colors.black,
                          height: 1.8,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // DESENVOLVEDORES LIST
                    ...desenvolvedores.asMap().entries.map((entry) {
                      final index = entry.key;
                      final dev = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Divisor (except first item)
                            if (index > 0)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: devColor,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withValues(alpha: 0.1),
                                              blurRadius: 2,
                                              offset: const Offset(1, 1),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 1,
                                          margin: const EdgeInsets.symmetric(horizontal: 8),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: devColor.withValues(alpha: 0.3),
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: devColor,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withValues(alpha: 0.1),
                                              blurRadius: 2,
                                              offset: const Offset(1, 1),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            
                            // Label tag
                            Padding(
                              padding: const EdgeInsets.only(left: 16, bottom: 10),
                              child: Transform.rotate(
                                angle: -0.017,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: stickyPurple,
                                    border: Border.all(
                                      color: devColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Text(
                                    'DESENVOLVEDOR ${dev.numero}',
                                    style: AppFonts.specialElite(
                                      fontSize: 7,
                                      color: Colors.black,
                                      letterSpacing: 0.7,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            
                            // Dev Section Card
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: paperLight,
                                border: Border.all(color: borderDim, width: 2),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Nome e Cargo
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: accentBrown,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dev.nome,
                                          style: AppFonts.specialElite(
                                            fontSize: 13,
                                            color: Colors.black.withValues(alpha: 0.9),
                                            letterSpacing: 1.0,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Wrap(
                                          spacing: 5,
                                          runSpacing: 5,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                              decoration: BoxDecoration(
                                                color: devColor.withValues(alpha: 0.15),
                                                border: Border.all(
                                                  color: devColor.withValues(alpha: 0.3),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(2),
                                              ),
                                              child: Text(
                                                dev.cargo,
                                                style: AppFonts.courier(
                                                  fontSize: 7,
                                                  color: devColor,
                                                  letterSpacing: 0.7,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFD6B877).withValues(alpha: 0.2),
                                                border: Border.all(
                                                  color: const Color(0xFFD6B877).withValues(alpha: 0.4),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(2),
                                              ),
                                              child: Text(
                                                dev.area,
                                                style: AppFonts.courier(
                                                  fontSize: 7,
                                                  color: accentBrown,
                                                  letterSpacing: 0.7,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // Foto Placeholder
                                  Container(
                                    width: 130,
                                    height: 130,
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE8E2D5),
                                      border: Border.all(
                                        color: borderDim,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        dev.foto,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  
                                  // Sobre
                                  _buildField('SOBRE', dev.descricao),
                                  const SizedBox(height: 10),
                                  
                                  // Especialidades
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ESPECIALIDADES',
                                        style: AppFonts.courier(
                                          fontSize: 8,
                                          color: Colors.black.withValues(alpha: 0.6),
                                          letterSpacing: 0.7,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      ...dev.especialidades.map((esp) => Padding(
                                        padding: const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 4,
                                              margin: const EdgeInsets.only(top: 7, right: 5),
                                              decoration: const BoxDecoration(
                                                color: devColor,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                esp,
                                                style: AppFonts.courier(
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  height: 1.8,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  
                                  // Contribuição Principal
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: stickyPurple.withValues(alpha: 0.3),
                                      border: const Border(
                                        left: BorderSide(
                                          color: devColor,
                                          width: 3,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'CONTRIBUIÇÃO PRINCIPAL',
                                          style: AppFonts.courier(
                                            fontSize: 7,
                                            color: devColor,
                                            letterSpacing: 0.7,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          dev.contribuicoes,
                                          style: AppFonts.courier(
                                            fontSize: 10,
                                            color: Colors.black,
                                            height: 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    
                    // AGRADECIMENTOS ESPECIAIS
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: paperLight,
                        border: Border.all(color: accentBrown, width: 2),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 6,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            margin: const EdgeInsets.only(bottom: 8),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: accentBrown,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Text(
                              'AGRADECIMENTOS ESPECIAIS',
                              style: AppFonts.specialElite(
                                fontSize: 11,
                                color: Colors.black.withValues(alpha: 0.9),
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                            style: AppFonts.courier(
                              fontSize: 10,
                              color: Colors.black,
                              height: 1.8,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // FOOTER
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: paperLight,
                        border: Border.all(color: accentBrown, width: 2),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 6,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Investigadora: Jessica Campos',
                            style: AppFonts.courier(
                              fontSize: 8,
                              color: Colors.black.withValues(alpha: 0.7),
                            ),
                          ),
                          Text(
                            'Data: 16/11/2025',
                            style: AppFonts.courier(
                              fontSize: 8,
                              color: Colors.black.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFonts.courier(
            fontSize: 8,
            color: Colors.black.withValues(alpha: 0.6),
            letterSpacing: 0.7,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: AppFonts.courier(
            fontSize: 10,
            color: Colors.black,
            height: 1.8,
          ),
        ),
      ],
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
}

class DevData {
  final String numero;
  final String nome;
  final String cargo;
  final String area;
  final String descricao;
  final List<String> especialidades;
  final String contribuicoes;
  final String foto;

  DevData({
    required this.numero,
    required this.nome,
    required this.cargo,
    required this.area,
    required this.descricao,
    required this.especialidades,
    required this.contribuicoes,
    required this.foto,
  });
}