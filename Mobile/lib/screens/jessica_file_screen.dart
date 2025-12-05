import 'package:flutter/material.dart';
import '../components/case_file_header.dart';

// ==================== PALETA DE CORES DA JESSICA ====================
// const = valores conhecidos em compile-time (otimização)
// Cada personagem tem paleta própria para identidade visual única

/// Fundo escuro da tela (marrom muito escuro, quase preto)
const jessBackground = Color(0xFF100C08);

/// Cor do papel principal (bege muito claro/off-white)
/// Simula papel envelhecido de dossiê investigativo
const jessPaperMain = Color(0xFFFBF9F4);

/// Cor do papel do cabeçalho (amarelo claro)
/// Destaca área do header
const jessPaperHeader = Color(0xFFFFFACD);

/// Cor da tinta principal (cinza escuro)
/// Usada em texto de corpo
const jessInkMain = Color(0xFF2E2E2C);

/// Cor da tinta atenuada (marrom acinzentado)
/// Usada em texto secundário e labels
const jessInkMuted = Color(0xFF6D5A47);

/// Cor das bordas (marrom médio)
const jessBorder = Color(0xFF8B7355);

/// Tela de perfil completo da protagonista Jessica Campos
/// 
/// StatefulWidget porque armazena URLs de evidências como estado
/// (poderia ser StatelessWidget com const, mas mantém flexibilidade para futuro)
/// 
/// DESIGN: Dossiê investigativo com:
/// - Foto polaroid com clipe
/// - Cartões de informações
/// - Seções de habilidades e aparições
/// - Post-its e elementos decorativos
class JessicaFileScreen extends StatefulWidget {
  const JessicaFileScreen({Key? key}) : super(key: key);

  @override
  State<JessicaFileScreen> createState() => _JessicaFileScreenState();
}

class _JessicaFileScreenState extends State<JessicaFileScreen> {
  // ==================== DADOS DE EVIDÊNCIAS ====================
  // URLs do Unsplash para imagens de evidências/documentos
  // final = imutável após inicialização
  // Poderiam ser const, mas URLs podem mudar (flexibilidade)
  final String _evidence1 = "https://images.unsplash.com/photo-1554494583-c4e1649bfe71?w=500&auto=format&fit=crop&q=60"; 
  final String _evidence2 = "https://images.unsplash.com/photo-1516961642265-531546e84af2?w=500&auto=format&fit=crop&q=60"; 
  final String _evidence3 = "https://images.unsplash.com/photo-1524661135-423995f22d0b?w=500&auto=format&fit=crop&q=60"; 

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    
    // Define responsive padding - REDUZIDO
    final horizontalPadding = screenWidth > 600 ? 16.0 : 12.0;
    
    // Define max width for larger screens
    final maxContentWidth = screenWidth > 900 ? 800.0 : double.infinity;
    
    return Scaffold(
      backgroundColor: jessBackground, // Fundo escuro
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxContentWidth),
            child: Column(
              children: [
                const CaseFileHeader(caseId: 'SC-CHAR-001'),
                
                Padding(
                  padding: EdgeInsets.fromLTRB(horizontalPadding, 12, horizontalPadding, 20),
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
                      border: Border.all(color: const Color(0xFF8B7355), width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.4),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16), // REDUZIDO de 24 para 16
                    child: Column(
                      children: [
                        _buildProfileHeaderCard(),
                        const SizedBox(height: 24), // REDUZIDO de 40 para 24

                        _buildPhotoSection(),
                        const SizedBox(height: 24),

                        _buildSummaryCard(),
                        const SizedBox(height: 24),

                        _buildTabbedCard(
                          tabTitle: "INFORMAÇÕES GERAIS",
                          child: _buildGeneralInfoContent(),
                          color: jessPaperMain,
                          tabWidth: 160,
                        ),
                        const SizedBox(height: 24),

                        _buildTabbedCard(
                          tabTitle: "PERFIL PSICOLÓGICO",
                          child: _buildPsychProfileContent(),
                          color: jessPaperMain,
                          tabWidth: 160,
                        ),
                        const SizedBox(height: 24),

                        _buildHistoryCard(),
                        const SizedBox(height: 24),

                        _buildTabbedCard(
                          tabTitle: "CONEXÕES NA HISTÓRIA",
                          child: _buildConnectionsContent(),
                          color: jessPaperMain,
                          tabWidth: 170,
                        ),
                        const SizedBox(height: 24),

                        _buildTabbedCard(
                          tabTitle: "RELAÇÕES E CONTATOS",
                          child: _buildSpecificRelationsContent(),
                          color: jessPaperMain,
                          tabWidth: 160,
                        ),
                        const SizedBox(height: 24),

                        _buildTabbedCard(
                          tabTitle: "ENVOLVIMENTO NO CASO SNOUT",
                          child: _buildInvolvementContent(),
                          color: jessPaperMain,
                          tabWidth: 200,
                        ),
                        const SizedBox(height: 24),

                        _buildTabbedCard(
                          tabTitle: "HABILIDADES E MÉTODOS",
                          child: _buildSkillsContent(),
                          color: jessPaperMain,
                          tabWidth: 190,
                        ),
                        const SizedBox(height: 24),

                        _buildTabbedCard(
                          tabTitle: "APARÊNCIA E CARACTERÍSTICAS",
                          child: _buildAppearanceContent(),
                          color: jessPaperMain,
                          tabWidth: 210,
                        ),
                        const SizedBox(height: 24),

                        _buildTabbedCard(
                          tabTitle: "EVIDÊNCIAS E DOCUMENTOS",
                          child: _buildEvidenceContent(),
                          color: const Color(0xFFFFFFFF).withValues(alpha: 0.7),
                          tabWidth: 190,
                        ),
                        const SizedBox(height: 24),

                        _buildChaptersSection(),
                        const SizedBox(height: 24),

                        _buildTriviaCard(),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- WIDGETS DE ESTRUTURA ---

  Widget _buildTabbedCard({
    required String tabTitle,
    required Widget child,
    required Color color,
    double tabWidth = 160,
    Color? borderColor,
    double borderWidth = 2.0,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -20, // REDUZIDO de -24
          left: 16, // REDUZIDO de 20
          child: Container(
            width: tabWidth,
            height: 24, // REDUZIDO de 28
            decoration: BoxDecoration(
              color: const Color(0xFF8B7355),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              border: Border.all(color: const Color(0xFF654321)),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 2)],
            ),
            alignment: Alignment.center,
            child: Text(tabTitle, style: const TextStyle(fontFamily: 'Courier Prime', color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)), // REDUZIDO de 11
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: borderColor ?? const Color(0xFF8B7355).withValues(alpha: 0.5),
              width: borderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: borderWidth > 1.5 ? 12 : 8,
                offset: const Offset(0, 4),
              )
            ],
          ),
          padding: const EdgeInsets.fromLTRB(14, 20, 14, 14), // REDUZIDO de (20, 24, 20, 20)
          child: child,
        ),
      ],
    );
  }

  // --- CONTEÚDO DETALHADO ---

  Widget _buildProfileHeaderCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Container principal do cabeçalho
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFF5F0E1), Color(0xFFEBE5D5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFD4C4A8), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.4),
                blurRadius: 2,
                offset: const Offset(0, 1),
                spreadRadius: 0,
                blurStyle: BlurStyle.inner,
              ),
            ],
          ),
          padding: const EdgeInsets.all(16), // REDUZIDO de 24
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ícone e infos básicas
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6), // REDUZIDO de 8
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.05),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.description_outlined,
                      size: 16, // REDUZIDO de 20
                      color: Colors.black.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '#001 – PERFIL DO INVESTIGADOR',
                          style: TextStyle(
                            fontFamily: 'Courier Prime',
                            fontSize: 10, // REDUZIDO de 12
                            color: Colors.black.withValues(alpha: 0.7),
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          'Atualizado em: 15/11/2025',
                          style: TextStyle(
                            fontFamily: 'Courier Prime',
                            fontSize: 9, // REDUZIDO de 13
                            color: Colors.black.withValues(alpha: 0.6),
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50), // AUMENTADO para dar espaço ao carimbo
              // Post-it - MOVIDO PARA BAIXO
              Transform.rotate(
                angle: -0.017,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), // REDUZIDO
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFFACD), Color(0xFFFFF8DC)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(color: const Color(0xFFD4AF37).withValues(alpha: 0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 0,
                        offset: const Offset(0, -1),
                        spreadRadius: 0,
                        blurStyle: BlurStyle.inner,
                      ),
                    ],
                  ),
                  child: const Text(
                    'Detetive Responsável pelo Caso',
                    style: TextStyle(
                      fontFamily: 'Kalam',
                      fontSize: 12, // REDUZIDO de 14
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Carimbo rotacionado - AJUSTADO POSIÇÃO
        Positioned(
          top: 12, // AJUSTADO de 16
          right: 12,
          child: Transform.rotate(
            angle: 0.26,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // REDUZIDO
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFC41E3A),
                  width: 3, // REDUZIDO de 4
                ),
                borderRadius: BorderRadius.circular(4),
                color: Colors.transparent,
              ),
              child: Opacity(
                opacity: 0.4,
                child: Column(
                  children: const [
                    Text(
                      'ARQUIVO DE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Special Elite',
                        fontSize: 8, // REDUZIDO de 10
                        color: Color(0xFFC41E3A),
                        letterSpacing: 1.2,
                        height: 1.1,
                      ),
                    ),
                    Text(
                      'INVESTIGAÇÃO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Special Elite',
                        fontSize: 8,
                        color: Color(0xFFC41E3A),
                        letterSpacing: 1.2,
                        height: 1.1,
                      ),
                    ),
                    Text(
                      'CASO: SNOUT\'S CASE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Special Elite',
                        fontSize: 8,
                        color: Color(0xFFC41E3A),
                        letterSpacing: 1.2,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoSection() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Polaroid com foto
          Transform.rotate(
            angle: -0.017,
            child: Container(
              width: 220, // REDUZIDO de 240
              padding: const EdgeInsets.all(10), // REDUZIDO de 12
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Foto
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Image.asset(
                      'assets/images/jessica_profile.png',
                      width: double.infinity,
                      height: 200, // REDUZIDO de 280
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => Container(
                        height: 200,
                        color: const Color(0xFFE8DCC8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              size: 64,
                              color: Colors.black.withValues(alpha: 0.3),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Foto da Jéssica',
                              style: TextStyle(
                                fontFamily: 'Special Elite',
                                fontSize: 12,
                                color: Colors.black.withValues(alpha: 0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8), // REDUZIDO de 12
                  // Legenda
                  const Text(
                    'Retrato de registro – Jessica Campos, detetive particular.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Courier Prime',
                      fontSize: 10, // REDUZIDO de 11
                      color: Colors.black38,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Clip metálico no topo
          Positioned(
            top: -10, // REDUZIDO de -12
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 28, // REDUZIDO de 32
                height: 20, // REDUZIDO de 24
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF888888),
                      const Color(0xFFAAAAAA),
                      const Color(0xFF888888),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -22, left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(color: const Color(0xFFD4AF37), borderRadius: BorderRadius.circular(4), border: Border.all(color: const Color(0xFFB8960F))),
            child: const Text("RESUMO ATUAL", style: TextStyle(fontFamily: 'Special Elite', color: Colors.white, fontSize: 11)),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFFFFFACD), Color(0xFFFFF8DC)]), borderRadius: BorderRadius.circular(8.75), border: Border.all(color: const Color(0xFFD4AF37))),
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
          child: Column(children: const [
            Text("Jessica Campos é a detetive particular contratada para investigar o caso central do jogo.", style: TextStyle(fontFamily: 'Times New Roman', fontSize: 15, height: 1.4, color: jessInkMain), textAlign: TextAlign.justify),
            SizedBox(height: 8),
            Text("Sua abordagem pragmática e sua resistência emocional são chaves na narrativa.", style: TextStyle(fontFamily: 'Times New Roman', fontSize: 15, height: 1.4, color: jessInkMain), textAlign: TextAlign.justify),
          ]),
        ),
      ],
    );
  }

  Widget _buildGeneralInfoContent() {
    return Column(children: [
      _buildInfoRow("Nome:", "Jéssica Campos"),
      _buildInfoRow("Idade:", "24 anos"),
      _buildInfoRow("Profissão:", "Detetive particular operando como freelancer"),
      _buildInfoRow("Local de atuação:", "Região urbana próxima ao escritório"),
      _buildInfoRow("Status:", "Ativa — responsável pela investigação do caso dos animais desaparecidos"),
      _buildInfoRow("Primeira aparição:", "Caso Snout's Case — Etapa 1"),
      const Divider(height: 32, color: Color(0xFF8B7355)),
      _buildUnderlinedTitle("Perfil Profissional:"),
      const Text(
        "Detetive particular operando como freelancer. Trabalha majoritariamente em casos de desaparecimento e vigilância. Conhecida por atuar de forma independente e metódica.",
        style: TextStyle(
          fontFamily: 'Times New Roman',
          fontSize: 15,
          height: 1.5,
          color: Colors.black87,
        ),
        textAlign: TextAlign.justify,
      ),
    ]);
  }

  Widget _buildPsychProfileContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _buildUnderlinedTitle("Traços principais:"),
      _buildBulletList([
        "Determinada, não desiste facilmente",
        "Curiosa — investiga além do esperado",
        "Analítica — organiza pistas e evidências com método",
        "Calma sob pressão, mesmo diante de situações perigosas",
        "Empática com vítimas (incluindo animais)",
        "Desconfiada por natureza, mas não paranóica"
      ]),
      const SizedBox(height: 16),
      _buildSectionTitle("Pontos fortes:"),
      _buildSymbolList([
        "Observação de detalhes mínimos",
        "Boa comunicação ao entrevistar NPCs",
        "Facilidade em interpretar comportamentos suspeitos",
        "Resistência mental e foco prolongado"
      ], symbol: "+", color: const Color(0xFF2E7D32)),
      const SizedBox(height: 16),
      _buildSectionTitle("Pontos fracos:"),
      _buildSymbolList([
        "Às vezes se arrisca demais",
        "Trabalha sozinha com frequência",
        "Tendência a confiar em teorias antes de confirmar provas"
      ], symbol: "-", color: const Color(0xFFC41E3A)),
    ]);
  }

  Widget _buildHistoryCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -24,
          left: 20,
          child: Container(
            width: 100,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFF8B7355),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              border: Border.all(color: const Color(0xFF654321)),
            ),
            alignment: Alignment.center,
            child: const Text(
              "HISTÓRICO",
              style: TextStyle(
                fontFamily: 'Courier Prime',
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFF5F0E1), Color(0xFFEBE5D5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF8B7355).withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 10,
                offset: const Offset(0, 3),
              )
            ],
          ),
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUnderlinedTitle2("Origem profissional:"),
              Text(
                "Jéssica começou na área investigativa trabalhando para uma agência local, realizando trabalhos menores, como vigilância e coleta de informações. Com o tempo, abriu seu próprio pequeno escritório, mantendo contratos com a agência conforme a demanda.",
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.black.withValues(alpha: 0.85),
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Text(
                "Após anos trabalhando de forma independente, Jessica desenvolveu uma reputação de confiabilidade entre clientes informais e empresas menores. Apesar disso, evita atenção pública e mantém sua vida privada rigidamente protegida.",
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.black.withValues(alpha: 0.85),
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 24),
              _buildUnderlinedTitle2("O Caso Snout's Case (evento central da história):"),
              _buildNumberedList([
                "Recebe ligação anônima de um informante autodenominado \"Senhor E\"",
                "É contratada por S\$ 4.000 para investigar desaparecimentos de animais",
                "Inicia a busca pelas ruas, conversando com civis e comerciantes",
                "Descobre que os desaparecimentos começaram após uma campanha do Snout PetShop",
                "Investiga o pet shop disfarçada de repórter",
                "Flagrou operação clandestina nas docas",
                "Infiltrou-se no caminhão e foi levada a uma doca abandonada",
                "Descobriu o galpão cheio de contrabandistas e laboratório clandestino",
                "Fotografou provas e extraiu dados de computador",
                "Concluiu que o pet shop era apenas parte de uma rede maior",
                "Final do caso varia conforme a escolha do jogador"
              ], textColor: Colors.black.withValues(alpha: 0.85)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConnectionsContent() {
    return Column(children: [
      _buildConnectionBox("Relação com Snout:", "Investigadora responsável por interpretar os eventos."),
      const SizedBox(height: 12),
      _buildConnectionBox("Relação com a Cidade:", "Conhece bem áreas periféricas."),
      const SizedBox(height: 12),
      _buildConnectionBox("Relação com NPCs:", "Histórico profissional com informantes."),
    ]);
  }

  Widget _buildSpecificRelationsContent() {
    return Column(children: [
      _buildNPCDetailCard("Senhor E (Informante)", ["Identidade desconhecida", "Contato inicial", "Suspeito de envolvimento"]),
      const SizedBox(height: 16),
      _buildNPCDetailCard("Líder do Contrabando", ["Homem imponente", "Chefe da operação", "Visto no galpão"]),
      const SizedBox(height: 16),
      _buildNPCDetailCard("Funcionários Snout", ["Comportamento monitorado", "Usam fardas oficiais", "Repassam informações"]),
      const SizedBox(height: 16),
      _buildNPCDetailCard("Cientistas", ["Conduta fria", "Responsáveis pela mutação", "Raramente fazem contato"]),
      const SizedBox(height: 16),
      _buildNPCDetailCard("Civis / Garçonete", ["Fornecem pistas", "Comportamentos específicos"]),
    ]);
  }

  Widget _buildInvolvementContent() {
    return Column(children: [
      Row(children: [
        const SizedBox(width: 60, child: Text("Papel:", style: TextStyle(fontFamily: 'Courier Prime', fontSize: 13, color: jessInkMuted))),
        Expanded(child: Text("PROTAGONISTA", style: const TextStyle(fontFamily: 'Special Elite', fontSize: 13, color: jessInkMain)))
      ]),
      const SizedBox(height: 12),
      Row(children: [
        const SizedBox(width: 60, child: Text("Risco:", style: TextStyle(fontFamily: 'Courier Prime', fontSize: 13, color: jessInkMuted))),
        Expanded(child: Text("ALTO — Área Criminosa", style: const TextStyle(fontFamily: 'Special Elite', fontSize: 13, color: Color(0xFFC41E3A))))
      ]),
      const SizedBox(height: 24),
      _buildSectionTitle("Participação:"),
      _buildChecklist(["Depoimentos de civis", "Provas no pet shop", "Investigação nas docas", "Infiltração no laboratório", "Coleta de evidências", "Revelação da operação"]),
      const SizedBox(height: 16),
      _buildConnectionBox("Desfecho (decisão):", "Polícia ou Senhor E? O futuro de Jessica depende disso."),
    ]);
  }

  Widget _buildSkillsContent() {
    return Column(children: [
      _buildSkillRow(Icons.person_outline, "Disfarces simples"),
      _buildSkillRow(Icons.camera_alt_outlined, "Fotografia investigativa"),
      _buildSkillRow(Icons.visibility_outlined, "Análise de comportamento"),
      _buildSkillRow(Icons.directions_run, "Infiltração e furtividade"),
      _buildSkillRow(Icons.mic_none, "Entrevistas direcionadas"),
      _buildSkillRow(Icons.folder_open, "Organização de provas"),
      _buildSkillRow(Icons.computer, "Hacking básico"),
    ]);
  }

  Widget _buildAppearanceContent() {
    return Column(children: [
      _buildBulletRow("»", "Mulher morena, cabelo liso"),
      _buildBulletRow("»", "Roupas discretas"),
      _buildBulletRow("»", "Expressão observadora"),
      _buildBulletRow("»", "Fisicamente ágil"),
      _buildBulletRow("»", "Carrega: bloco, celular, câmera"),
    ]);
  }

  Widget _buildEvidenceContent() {
    return Column(children: [
      const Text(
        "Evidências Fotográficas e Documentos",
        style: TextStyle(fontFamily: 'Special Elite', fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
      const SizedBox(height: 16),
      _buildPhotoCard(_evidence1, "Fachada Snout", "Reconhecimento inicial.", -2),
      const SizedBox(height: 16),
      _buildPhotoCard(_evidence2, "Jaulas e Mutantes", "Evidência de experimentos.", 1),
      const SizedBox(height: 16),
      _buildPhotoCard(_evidence3, "Mapa da Rota", "Conexões entre locais.", -1),
      const SizedBox(height: 32),
      const Text(
        "Anotações Manuscritas:",
        style: TextStyle(fontFamily: 'Special Elite', fontSize: 12, color: Colors.black87),
      ),
      const SizedBox(height: 16),
      Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: [
          _buildPostIt(const Color(0xFFFFF9C4), "\"O Senhor E sabe mais do que demonstra.\"", -0.07),
          _buildPostIt(const Color(0xFFFFCCBC), "\"Verificar conexão entre pet shop e docas.\"", 0.05),
          _buildPostIt(const Color(0xFFC5E1A5), "\"Cientistas seguem ordens — de quem?\"", -0.03),
          _buildPostIt(const Color(0xFFB2DFDB), "\"Timeline: desaparecimentos há 3 meses.\"", 0.07),
        ],
      ),
    ]);
  }

  Widget _buildChaptersSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -24,
          left: 20,
          child: Container(
            width: 150,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFF6B5D4F),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              border: Border.all(color: const Color(0xFF4A3F35)),
            ),
            alignment: Alignment.center,
            child: const Text(
              "APARIÇÕES NO JOGO",
              style: TextStyle(fontFamily: 'Courier Prime', color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFF5F5DC), Color(0xFFFFFAF0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF8B7355), width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 12,
                offset: const Offset(0, 4),
              )
            ],
          ),
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
          child: Column(
            children: [
              _buildChapterCard(1, "Primeiro Contato", "Recebe ligação e aceita o caso.", "Jogador conhece a protagonista."),
              const SizedBox(height: 16),
              _buildChapterCard(2, "Investigação", "Entrevista civis e busca padrões.", "Revelação sobre o Snout PetShop."),
              const SizedBox(height: 16),
              _buildChapterCard(3, "Infiltração", "Investiga pet shop como repórter.", "Primeiras evidências concretas."),
              const SizedBox(height: 16),
              _buildChapterCard(4, "Docas", "Flagra transporte e segue caminhão.", "Conexão com rede de contrabando."),
              const SizedBox(height: 16),
              _buildChapterCard(5, "Laboratório", "Descobre experimentos no galpão.", "Verdadeira escala do esquema."),
              const SizedBox(height: 16),
              _buildChapterCard(6, "Desfecho", "Decide destino das provas.", "Escolha impacta destino de Jessica."),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTriviaCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(top: -24, left: 20, child: Container(width: 180, height: 28, decoration: BoxDecoration(color: const Color(0xFFD4AF37), borderRadius: BorderRadius.circular(4)), alignment: Alignment.center, child: const Text("NOTAS E CURIOSIDADES", style: TextStyle(fontFamily: 'Courier Prime', color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)))),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFFFFF8DC), Color(0xFFF5F5DC)]), borderRadius: BorderRadius.circular(8.75), border: Border.all(color: const Color(0xFFD4AF37))),
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
          child: Column(children: [
            _buildBulletRow("★", "Jessica raramente fala sobre seu passado.", bulletColor: const Color(0xFFD4AF37)),
            _buildBulletRow("★", "Acesso direto a áreas restritas.", bulletColor: const Color(0xFFD4AF37)),
            _buildBulletRow("★", "Já investigou eventos semelhantes.", bulletColor: const Color(0xFFD4AF37)),
            _buildBulletRow("★", "Respeitada no submundo.", bulletColor: const Color(0xFFD4AF37)),
            const SizedBox(height: 16),
            Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: jessPaperMain, border: Border.all(color: const Color(0xFFD4AF37).withValues(alpha: 0.5))), child: Row(children: [const Icon(Icons.info_outline, size: 20, color: Color(0xFF8B7355)), const SizedBox(width: 12), const Expanded(child: Text("STATUS ATUAL: EM ANDAMENTO", style: TextStyle(fontFamily: 'Special Elite', fontWeight: FontWeight.bold, color: jessInkMain)))])),
          ]),
        ),
      ],
    );
  }

  // --- HELPERS ---
  
  Widget _buildInfoRow(String label, String value) => Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Courier Prime',
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontFamily: 'Courier Prime',
              fontSize: 14,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
        ),
      ],
    ),
  );
  
  Widget _buildSectionTitle(String title) => Padding(padding: const EdgeInsets.only(bottom: 8.0), child: Text(title, style: const TextStyle(fontFamily: 'Special Elite', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)));
  
  Widget _buildUnderlinedTitle(String title) => Container(width: double.infinity, decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFF4E4C1)))), margin: const EdgeInsets.only(bottom: 8), child: Text(title, style: const TextStyle(fontFamily: 'Special Elite', fontSize: 15, color: Color(0xFFF4E4C1))));

  Widget _buildUnderlinedTitle2(String title) => Container(width: double.infinity, decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFF8B7355)))), margin: const EdgeInsets.only(bottom: 8), child: Text(title, style: const TextStyle(fontFamily: 'Special Elite', fontSize: 15, color: Color(0xFF8B7355))));

  Widget _buildBulletList(List<String> items) => Column(children: items.map((item) => _buildBulletRow("•", item)).toList());
  
  Widget _buildSymbolList(List<String> items, {required String symbol, required Color color}) => Column(children: items.map((item) => _buildBulletRow(symbol, item, bulletColor: color)).toList());

  Widget _buildBulletRow(String bullet, String text, {Color bulletColor = Colors.black54}) => Padding(padding: const EdgeInsets.only(bottom: 6), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(width: 20, child: Text(bullet, style: TextStyle(color: bulletColor, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Courier Prime'))), Expanded(child: Text(text, style: const TextStyle(fontFamily: 'Times New Roman', fontSize: 14, color: Colors.black87)))]));

  Widget _buildNumberedList(List<String> items, {Color textColor = Colors.black87}) => Column(children: items.asMap().entries.map((entry) => Padding(padding: const EdgeInsets.only(bottom: 12), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(width: 30, child: Text("[${entry.key + 1}]", style: TextStyle(fontFamily: 'Courier Prime', color: textColor.withValues(alpha: 0.7), fontSize: 13))), Expanded(child: Text(entry.value, style: TextStyle(fontFamily: 'Times New Roman', fontSize: 14, color: textColor)))]))).toList());

  Widget _buildConnectionBox(String title, String desc) => Container(width: double.infinity, padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFF8B7355).withValues(alpha: 0.15), borderRadius: BorderRadius.circular(4), border: Border.all(color: const Color(0xFF8B7355).withValues(alpha: 0.2))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontFamily: 'Special Elite', fontSize: 13, fontWeight: FontWeight.bold, color: jessInkMain)), const SizedBox(height: 4), Text(desc, style: const TextStyle(fontFamily: 'Times New Roman', fontSize: 14, color: jessInkMain))]));

  Widget _buildNPCDetailCard(String name, List<String> details) => Container(width: double.infinity, padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xFF8B7355)), borderRadius: BorderRadius.circular(4)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(fontFamily: 'Kalam', fontSize: 14, fontWeight: FontWeight.bold, color: jessInkMain)), const SizedBox(height: 8), ...details.map((d) => Padding(padding: const EdgeInsets.only(bottom: 4), child: Text("• $d", style: const TextStyle(fontFamily: 'Courier Prime', fontSize: 12, color: Colors.black87))))]));

  Widget _buildChecklist(List<String> items) => Column(children: items.map((item) => Padding(padding: const EdgeInsets.only(bottom: 6), child: Row(children: [const Text("✓", style: TextStyle(color: Color(0xFF2E7D32), fontSize: 14, fontWeight: FontWeight.bold)), const SizedBox(width: 8), Expanded(child: Text(item, style: const TextStyle(fontFamily: 'Times New Roman', fontSize: 14, color: jessInkMain)))]))).toList());

  Widget _buildSkillRow(IconData icon, String text) => Container(margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: const Color(0xFF8B7355).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)), child: Row(children: [Icon(icon, size: 16, color: const Color(0xFF8B7355)), const SizedBox(width: 12), Expanded(child: Text(text, style: const TextStyle(fontFamily: 'Courier Prime', fontSize: 13, color: jessInkMain)))]));

  Widget _buildPhotoCard(String imagePath, String title, String caption, double angle) => Transform.rotate(angle: angle * 0.0174533, child: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(4), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 6, offset: const Offset(0, 3))]), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.asset(imagePath, height: 140, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(height: 140, color: Colors.grey[300], child: const Icon(Icons.image, size: 48, color: Colors.grey)))), const SizedBox(height: 8), Text(title, style: const TextStyle(fontFamily: 'Courier Prime', fontWeight: FontWeight.bold, fontSize: 12, color: jessInkMain)), Text(caption, style: const TextStyle(fontFamily: 'Courier Prime', fontSize: 11, color: Colors.black54))])));

  Widget _buildPostIt(Color color, String text, double rotation) => Transform.rotate(angle: rotation, child: Container(width: 110, padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: color, boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 4)]), child: Text(text, style: const TextStyle(fontFamily: 'Kalam', fontSize: 11, color: Color(0xFF1A237E)))));

  Widget _buildChapterCard(int number, String title, String role, String info) => Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF).withValues(alpha: 0.6),
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: const Color(0xFF8B7355).withValues(alpha: 0.3), width: 1.5),
      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.15), blurRadius: 6, offset: const Offset(0, 2))],
    ),
    padding: const EdgeInsets.all(12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFF8B7355),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            number.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Special Elite',
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Special Elite',
                  fontSize: 14,
                  color: Colors.black.withValues(alpha: 0.9),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Papel:",
                style: const TextStyle(
                  fontFamily: 'Courier Prime',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                role,
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 14,
                  color: Colors.black.withValues(alpha: 0.85),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Revelado ao jogador:",
                style: const TextStyle(
                  fontFamily: 'Courier Prime',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                info,
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.black.withValues(alpha: 0.75),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}