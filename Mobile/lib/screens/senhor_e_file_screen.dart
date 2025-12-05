// Arquivo: senhor_e_file_screen.dart
// Descrição: Tela de perfil do personagem "Senhor E", o informante anônimo que
// contrata Jessica e guia a investigação por meio de mensagens indiretas.
// Exibe dados fragmentados, notas de campo e aparições documentadas.

import 'package:flutter/material.dart';
import '../components/case_file_header.dart';

// Paleta de cores personalizada
const senhorBackground = Color(0xFF0D0805);
const senhorPaperMain = Color(0xFFF5F0E8);
const senhorInkMain = Color(0xFF1A1A1A);
const senhorBorder = Color(0xFF6B5A47);

/// Tela de perfil do Senhor E (antagonista misterioso)
/// StatefulWidget (herança do código React, poderia ser Stateless)
class SenhorEFileScreen extends StatefulWidget {
  const SenhorEFileScreen({Key? key}) : super(key: key);

  @override
  State<SenhorEFileScreen> createState() => _SenhorEFileScreenState();
}

class _SenhorEFileScreenState extends State<SenhorEFileScreen> {
  // CAMPOS REMOVIDOS: _evidence1, _evidence2, _evidence3
  // Motivo: Não eram utilizados no código (warning unused_field)
  // Se necessário no futuro, reativar quando implementar seção de evidências

  @override
  Widget build(BuildContext context) {
    // Obtém informações da tela para layout responsivo
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    
    // Define padding e largura máxima baseados no tamanho da tela
    final horizontalPadding = screenWidth > 600 ? 16.0 : 12.0;
    final maxContentWidth = screenWidth > 900 ? 800.0 : double.infinity;
    
    return Scaffold(
      backgroundColor: senhorBackground,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxContentWidth),
            child: Column(
              children: [
                // Cabeçalho do arquivo com código do caso
                const CaseFileHeader(caseId: 'SC-CHAR-002'),
                
                // Container principal que envolve todo o conteúdo do arquivo
                // Usa gradiente de papel envelhecido e sombra para efeito de profundidade
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
                      border: Border.all(color: senhorBorder, width: 3),
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
                      children: [
                        // Sequência de seções do arquivo do Senhor E
                        _buildProfileHeaderCard(),
                        const SizedBox(height: 24),

                        _buildPhotoSection(),
                        const SizedBox(height: 24),

                        _buildSummaryCard(),
                        const SizedBox(height: 24),

                        _buildTabbedCard(
                          tabTitle: "INFORMAÇÕES GERAIS",
                          child: _buildGeneralInfoContent(),
                          color: senhorPaperMain,
                          tabWidth: 160,
                        ),
                        const SizedBox(height: 24),

                        _buildTabbedCard(
                          tabTitle: "PERFIL PSICOLÓGICO",
                          child: _buildPsychProfileContent(),
                          color: senhorPaperMain,
                          tabWidth: 160,
                        ),
                        const SizedBox(height: 24),

                        _buildHistoryCard(),
                        const SizedBox(height: 24),

                        _buildTabbedCard(
                          tabTitle: "CONEXÕES NA HISTÓRIA",
                          child: _buildConnectionsContent(),
                          color: const Color(0xFFFFFFFF).withValues(alpha: 0.75),
                          tabWidth: 170,
                        ),
                        const SizedBox(height: 24),

                        _buildTabbedCard(
                          tabTitle: "APARIÇÕES DOCUMENTADAS",
                          child: _buildAppearancesContent(),
                          color: senhorPaperMain,
                          tabWidth: 190,
                        ),
                        const SizedBox(height: 24),

                        _buildNotesCard(),
                        const SizedBox(height: 24),

                        _buildEndMarker(),
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

  // Constrói um cartão com aba superior (estilo arquivo de fichário)
  // Usado para separar visualmente diferentes seções do dossiê
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
        // Aba superior posicionada acima do cartão principal
        Positioned(
          top: -20,
          left: 16,
          child: Container(
            width: tabWidth,
            height: 24,
            decoration: BoxDecoration(
              color: senhorBorder,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              border: Border.all(color: const Color(0xFF654321)),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 2)],
            ),
            alignment: Alignment.center,
            child: Text(tabTitle, style: const TextStyle(fontFamily: 'Courier Prime', color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ),
        // Cartão principal que contém o conteúdo
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: borderColor ?? senhorBorder.withValues(alpha: 0.5),
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
          padding: const EdgeInsets.fromLTRB(14, 20, 14, 14),
          child: child,
        ),
      ],
    );
  }

  // Monta o cabeçalho do perfil com identidade desconhecida e post-it de informante
  Widget _buildProfileHeaderCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Cartão principal com informações básicas (identidade desconhecida)
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
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Ícone de documento
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.05),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.description_outlined,
                      size: 16,
                      color: Colors.black.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '#??? – IDENTIDADE DESCONHECIDA',
                          style: TextStyle(
                            fontFamily: 'Courier Prime',
                            fontSize: 10,
                            color: Colors.black.withValues(alpha: 0.7),
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          '[DADOS INCOMPLETOS]',
                          style: TextStyle(
                            fontFamily: 'Courier Prime',
                            fontSize: 9,
                            color: Colors.black.withValues(alpha: 0.6),
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        // Post-it amarelo posicionado no canto superior direito
        // Indica o papel do personagem como informante anônimo
        Positioned(
          top: -8,
          right: -8,
          child: Transform.rotate(
            angle: 0.087,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9C4),
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: const Color(0xFFE6D89F)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: const Text(
                'Informante Anônimo\nRecorrente',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Special Elite',
                  fontSize: 8,
                  color: Color(0xFF2E2E2C),
                  height: 1.2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Monta a seção de foto estilo polaroid com clipe metálico
  // Exibe a imagem do personagem revelado (Juan Santos) com legenda
  Widget _buildPhotoSection() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Polaroid rotacionado levemente para dar aspecto analógico
          Transform.rotate(
            angle: -0.017,
            child: Container(
              width: 220,
              padding: const EdgeInsets.all(10),
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
                  // Foto do personagem (carregada de asset local)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Image.asset(
                      'assets/images/senhor_e_profile.png',
                      width: double.infinity,
                      height: 200,
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
                              'Foto do Senhor E',
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
                  const SizedBox(height: 8),
                  // Legenda escrita à mão na parte inferior do polaroid
                  const Text(
                    'Juan Santos, o verdadeiro\nSenhor E — Identidade\nrevelada.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Special Elite',
                      fontSize: 9,
                      color: Color(0xFF2E2E2C),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Clipe metálico no topo da polaroid (efeito visual)
          Positioned(
            top: -12,
            left: 90,
            child: Container(
              width: 40,
              height: 16,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFB8B8B8), Color(0xFFD8D8D8), Color(0xFFA0A0A0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Cartão de resumo geral do personagem
  // Explica o papel do Senhor E na história e seu comportamento misterioso
  Widget _buildSummaryCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFF9C4), Color(0xFFFFF59D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: senhorBorder, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'RESUMO GERAL',
            style: TextStyle(
              fontFamily: 'Special Elite',
              fontSize: 12,
              color: senhorInkMain,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'O Senhor E é uma figura misteriosa que se comunica exclusivamente por meios indiretos: ligações anônimas, mensagens distorcidas e bilhetes entregues sem remetente. Ele inicia a investigação ao contratar Jessica para solucionar os desaparecimentos de animais na cidade de São Domingues, oferecendo S\$ 4.000 pelo serviço.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 15,
              color: senhorInkMain,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Seu comportamento demonstra conhecimento prévio e profundo sobre eventos e locais relacionados ao caso, embora nunca revele identidade, motivação ou qualquer dado pessoal.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 15,
              color: senhorInkMain,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  // Conteúdo de informações gerais (nome, idade, profissão, etc.)
  // Todos os dados são marcados como desconhecidos ou não-verificados
  Widget _buildGeneralInfoContent() {
    final items = [
      {'label': 'Nome:', 'value': 'Senhor E (codinome)'},
      {'label': 'Idade:', 'value': 'Desconhecida'},
      {'label': 'Profissão:', 'value': 'Informante anônimo / Fonte não-verificada'},
      {'label': 'Local de atuação:', 'value': 'Não estabelecida'},
      {'label': 'Status:', 'value': 'Presença indireta — contato exclusivamente remoto'},
      {'label': 'Primeira aparição:', 'value': 'Caso Snout\'s Case — Início da investigação'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Monta lista de itens de informação em formato label: valor
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 140,
                child: Text(
                  item['label']!,
                  style: TextStyle(
                    fontFamily: 'Courier Prime',
                    fontSize: 14,
                    color: senhorInkMain,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  item['value']!,
                  style: const TextStyle(
                    fontFamily: 'Courier Prime',
                    fontSize: 14,
                    color: senhorInkMain,
                  ),
                ),
              ),
            ],
          ),
        )),
        const SizedBox(height: 16),
        // Caixa destacada com perfil comportamental observado
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.03),
            border: Border.all(
              color: Colors.black.withValues(alpha: 0.15),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Perfil e Comportamento Observado:',
                style: TextStyle(
                  fontFamily: 'Special Elite',
                  fontSize: 13,
                  color: Colors.black.withValues(alpha: 0.85),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'O Senhor E nunca aparece fisicamente. Todas as informações chegam por meios anônimos e demonstra acompanhamento constante da investigação. Comunica-se de forma calculada, usando linguagem neutra e ambígua. Encerra conversas abruptamente quando pressionado sobre identidade. Parece saber mais do que revela, escolhendo cuidadosamente o que e quando informar.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 15,
                  color: senhorInkMain,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Conteúdo do perfil psicológico
  // Lista traços de comportamento observados ao longo da investigação
  Widget _buildPsychProfileContent() {
    final traits = [
      'Nunca aparece fisicamente',
      'Todas as informações chegam por meios anônimos',
      'Demonstra acompanhamento constante da investigação',
      'Comunica-se de forma calculada, usando linguagem neutra e ambígua',
      'Encerra conversas abruptamente quando pressionado sobre identidade',
      'Parece saber mais do que revela, escolhendo cuidadosamente o que e quando informar',
      'Seu padrão de fala sugere intenção, mas não é possível definir se é benéfico ou manipulativo',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Traços principais:',
          style: TextStyle(
            fontFamily: 'Special Elite',
            fontSize: 14,
            color: Colors.black.withValues(alpha: 0.85),
          ),
        ),
        const SizedBox(height: 12),
        // Cada traço é listado com marcador de bullet
        ...traits.map((trait) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• ',
                style: TextStyle(
                  fontFamily: 'Courier Prime',
                  fontSize: 14,
                  color: Colors.black.withValues(alpha: 0.5),
                ),
              ),
              Expanded(
                child: Text(
                  trait,
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 15,
                    color: Colors.black.withValues(alpha: 0.85),
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  // Cartão de histórico com marca d'água "INCOMPLETO"
  // Indica que quase nada é confirmado sobre o passado do personagem
  Widget _buildHistoryCard() {
    return Stack(
      children: [
        // Cartão principal com histórico fragmentado
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: senhorPaperMain,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: senhorBorder.withValues(alpha: 0.5), width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Etiqueta de seção
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: senhorBorder,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Text(
                  'HISTÓRICO CONHECIDO',
                  style: TextStyle(
                    fontFamily: 'Special Elite',
                    fontSize: 11,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black.withValues(alpha: 0.2),
                    ),
                  ),
                ),
                child: Text(
                  'Registros disponíveis:',
                  style: TextStyle(
                    fontFamily: 'Special Elite',
                    fontSize: 15,
                    color: Colors.black.withValues(alpha: 0.9),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Quase nada é confirmado sobre o passado do Senhor E. Os registros que parecem pertencer a ele — bilhetes, gravações e anotações antigas — surgem sempre em locais estratégicos e momentos críticos.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 15,
                  color: senhorInkMain,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Alguns textos sugerem que ele monitora certos personagens antes mesmo do caso atual começar, mas essas mensagens são fragmentadas demais para formar conclusões. A inexistência de dados concretos torna impossível estabelecer sua origem, idade ou relação direta com os desaparecimentos.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 15,
                  color: senhorInkMain,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
        // Marca d'água "INCOMPLETO" rotacionada no centro do cartão
        Positioned.fill(
          child: Center(
            child: Transform.rotate(
              angle: -0.436,
              child: Text(
                'INCOMPLETO',
                style: TextStyle(
                  fontFamily: 'Special Elite',
                  fontSize: 48,
                  color: const Color(0xFFC41E3A).withValues(alpha: 0.1),
                  letterSpacing: 4,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Conteúdo de conexões com outros personagens e locais da história
  // Mostra relação com Jessica, Snout e NPCs
  Widget _buildConnectionsContent() {
    final connections = [
      {
        'title': 'Com Jessica Campos:',
        'description': 'É ele quem inicia oficialmente toda a investigação. Age como guia, porém nunca de forma completa; oculta informações importantes.',
      },
      {
        'title': 'Com Snout (empresa/pet shop):',
        'description': 'Demonstra conhecimento profundo sobre movimentações internas e locais restritos. Sugere familiaridade prévia com irregularidades do pet shop.',
      },
      {
        'title': 'Com NPCs e locais:',
        'description': 'Cita pessoas e áreas não registradas oficialmente. Mostra saber caminhos, horários e rotinas que não são públicos. Indica acesso a pontos abandonados ou esquecidos da cidade.',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: connections.map((conn) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: senhorBorder.withValues(alpha: 0.08),
            border: Border.all(color: senhorBorder.withValues(alpha: 0.2)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                conn['title']!,
                style: TextStyle(
                  fontFamily: 'Special Elite',
                  fontSize: 14,
                  color: Colors.black.withValues(alpha: 0.85),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                conn['description']!,
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 15,
                  color: Colors.black.withValues(alpha: 0.85),
                  height: 1.6,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Conteúdo de aparições documentadas do personagem
  // Lista de eventos onde o Senhor E se comunicou (gravações, bilhetes, mensagens)
  Widget _buildAppearancesContent() {
    final List<Map<String, dynamic>> appearances = [
      {
        'name': 'Gravação 01 — "O Começo"',
        'details': [
          'Primeiro contato com Jessica, oferecendo o caso e a recompensa',
          'A voz está distorcida e impossível de rastrear',
          'Menciona S\$ 4.000 como pagamento',
        ],
      },
      {
        'name': 'Bilhete anônimo entregue no escritório',
        'details': [
          'Conteúdo técnico demais para um cidadão comum',
          'Indica conhecimento interno sobre operações suspeitas',
          'Papel comum, sem impressões digitais',
        ],
      },
      {
        'name': 'Mensagem deixada próximo a uma área restrita',
        'details': [
          'Chegou antes de Jessica',
          'Indica que acompanha seus movimentos',
          'Fornece pistas sobre localização específica',
        ],
      },
      {
        'name': 'Nota datilografada antiga',
        'details': [
          'O papel é velho e desgastado',
          'Sugere que o Senhor E utiliza documentos antigos de propósito',
          'Dificulta rastreamento por análise forense',
        ],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: appearances.map((app) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: senhorBorder, width: 1.5),
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                app['name'] as String,
                style: const TextStyle(
                  fontFamily: 'Special Elite',
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              // Lista de detalhes de cada aparição
              ...(app['details'] as List<dynamic>).map((detail) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    '• ${detail as String}',
                    style: TextStyle(
                      fontFamily: 'Courier Prime',
                      fontSize: 13,
                      color: Colors.black.withValues(alpha: 0.75),
                      height: 1.5,
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Cartão de notas e curiosidades em papel amarelo
  // Lista observações importantes sobre o comportamento do Senhor E
  Widget _buildNotesCard() {
    final notes = [
      'Nenhum método conseguiu rastrear suas mensagens.',
      'A letra "E" pode ser apenas um símbolo, não inicial de nome.',
      'Parece seguir um plano maior e a longo prazo.',
      'Suas mensagens mudam constantemente de estilo para evitar padrões.',
      'Não demonstra medo ou urgência, apenas controle.',
      'Alguns investigadores suspeitam que já acompanhava Jessica antes do caso começar.',
      'Nunca fez exigências além de manter o caso em sigilo.',
    ];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Cartão amarelo principal
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF9C4),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: senhorBorder,
              width: 2,
              style: BorderStyle.solid,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              // Cada nota é exibida em uma caixa dourada destacada
              ...notes.map((note) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: senhorBorder.withValues(alpha: 0.1),
                    border: Border.all(color: senhorBorder.withValues(alpha: 0.3)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '▸ ',
                        style: TextStyle(
                          fontFamily: 'Courier Prime',
                          fontSize: 16,
                          color: senhorBorder,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          note,
                          style: TextStyle(
                            fontFamily: 'Times New Roman',
                            fontSize: 14,
                            color: Colors.black.withValues(alpha: 0.85),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        // Etiqueta dourada posicionada acima do cartão
        Positioned(
          top: -10,
          left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: senhorBorder,
              border: Border.all(color: const Color(0xFFB8860B)),
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Text(
              '📋 NOTAS E CURIOSIDADES',
              style: TextStyle(
                fontFamily: 'Special Elite',
                fontSize: 12,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Marcador de fim de arquivo
  // Indica que a visualização do dossiê foi concluída
  Widget _buildEndMarker() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF4A3F35), Color(0xFF3E342C)],
          ),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: senhorInkMain),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Text(
          'FIM DO ARQUIVO – SENHOR E',
          style: TextStyle(
            fontFamily: 'Special Elite',
            fontSize: 12,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}