import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/case_header.dart';

// Paleta de cores específica da tela História
// Tons de papel envelhecido, tinta escura e vermelho documental
const histBackground = Color(0xFF100C08);
const histPaperLevel = Color(0xFFF3E9D2);
const histInkHeader = Color(0xFF3D3D3B);
const histBorderDim = Color(0xFFB8A88B);
const histDocRed = Color(0xFFC41E3A);
const histGold = Color(0xFFD6B877);
const histBorderMain = Color(0xFF8B7355);

/// Tela de História do caso Snout's Case.
/// Apresenta linha do tempo, diários, documentos e teorias sobre os eventos misteriosos.
/// Design inspirado em arquivo investigativo com documentos classificados.
class HistoriaFileScreen extends StatelessWidget {
  const HistoriaFileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: histBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho com logo do app
            const CaseHeader(),
            
            // Botão de navegação para voltar
            _buildBackButton(context),
            
            // Faixa de título da categoria "HISTÓRIA"
            _buildCategoryHeader(),
            
            // Conteúdo principal rolável (timeline, documentos, teorias)
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

  // Constrói botão "Voltar" estilizado
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

  // Constrói faixa de título "HISTÓRIA"
  Widget _buildCategoryHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Reduzido padding
      decoration: BoxDecoration(
        color: const Color(0xFF6B7C45).withValues(alpha: 0.8),
        border: const Border(
          top: BorderSide(color: Color(0xFF6B7C45), width: 2),
          bottom: BorderSide(color: Color(0xFF6B7C45), width: 2),
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
        'HISTÓRIA',
        style: AppFonts.specialElite(
          fontSize: 14, // Reduzido de 18 para 14
          color: Colors.white,
          letterSpacing: 2.0,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  // Constrói container principal com layout de papel empilhado e sombras
  // Usa Stack para sobrepor camada de sombra, papel de fundo e conteúdo
  Widget _buildDetailContainer() {
    return Stack(
      children: [
        // Camada de fundo esbranquiçada (efeito de papel sob o documento)
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
          child: const SizedBox(height: 2000),
        ),
        
        // Papel de fundo (shadow layer) - efeito de papel empilhado
        Positioned(
          top: 8,
          left: 4,
          right: -4,
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              color: const Color(0xFF8B7355).withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        
        // Container principal do documento
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 800),
          decoration: BoxDecoration(
            color: histPaperLevel,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: histBorderMain, width: 3),
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
              // Textura de papel (overlay sutil para dar profundidade)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.02),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              // Carimbo "ARQUIVO OFICIAL" rotacionado no canto superior direito
              Positioned(
                top: 32,
                right: 32,
                child: Transform.rotate(
                  angle: 0.21, // ~12 graus
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: histDocRed.withValues(alpha: 0.15), width: 3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Opacity(
                      opacity: 0.15,
                      child: Text(
                        'ARQUIVO\nOFICIAL',
                        textAlign: TextAlign.center,
                        style: AppFonts.specialElite(
                          fontSize: 14,
                          color: histDocRed,
                          height: 1.3,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Conteúdo principal do documento
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cabeçalho principal com título e subtítulo centralizados
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.only(bottom: 12),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: histDocRed, width: 2),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'CASO SNOUT',
                            textAlign: TextAlign.center,
                            style: AppFonts.specialElite(
                              fontSize: 20,
                              color: histDocRed,
                              height: 1.2,
                              letterSpacing: 2.0,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'HISTÓRIA COMPLETA',
                            textAlign: TextAlign.center,
                            style: AppFonts.specialElite(
                              fontSize: 13,
                              color: histDocRed,
                              height: 1.3,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Seções do documento (introdução, linha do tempo, etc.)
                    _buildSection(
                      title: 'Introdução ao Caso',
                      paragraphs: [
                        'O Caso Snout é uma investigação conduzida pela detetive particular Jéssica Campos, residente de São Domingues. Conhecida por sua postura cuidadosa e ética profissional rigorosa, Jéssica trabalha sozinha, prestando serviços de análise, busca por informações, vigilância e resolução de pequenos e médios casos.',
                        'Sua vida cotidiana muda quando ela recebe uma ligação de um informante anônimo identificado apenas como \"Senhor E\". A voz é distorcida e o tom é calculado. Ele afirma que está disposto a pagar S\$ 4.000 se Jéssica resolver uma onda de desaparecimentos de animais — um problema que, segundo ele, está sendo acobertado ou ignorado.',
                        'Apesar da falta de detalhes, o valor e o teor misterioso despertam a curiosidade da detetive.',
                      ],
                    ),
                    const SizedBox(height: 20), // Reduzido de 32

                    // CAPÍTULO 1
                    _buildSection(
                      title: 'Capítulo 1 — A Rua dos Desaparecimentos',
                      paragraphs: [
                        'A investigação começa na rua onde ocorreram a maioria dos desaparecimentos. A região apresenta sinais de inquietação: moradores cautelosos, comerciantes divididos entre medo e indiferença e relatos contraditórios sobre sumiços de animais.',
                        'As lojas locais — cafeteria, sorveteria e o Snout PetShop — são o núcleo social da área. Testemunhas mencionam barulhos noturnos, pagamentos para silenciar reclamações e movimentações estranhas no bar decadente da rua.',
                        'O interior do bar contrasta com sua fachada deteriorada, revelando um ambiente organizado demais. Ao conversar com frequentadores e comerciantes, Jéssica percebe que o Snout PetShop é citado repetidamente de forma suspeita. Ela retorna ao escritório para registrar tudo antes de avançar.',
                      ],
                    ),
                    const SizedBox(height: 20), // Reduzido de 32

                    // CAPÍTULO 2
                    _buildSection(
                      title: 'Capítulo 2 — Infiltração no Snout PetShop',
                      paragraphs: [
                        'Jéssica se infiltra no estabelecimento fingindo ser repórter investigativa. O pet shop é limpo, organizado e gerido por funcionários treinados para serem excessivamente cautelosos.',
                        'Durante entrevistas, ela observa nervosismo ao mencionar horários de entrega, clientes reclamando de visitas noturnas e documentos internos com discrepâncias. Nas docas, Jéssica registra caixas sem identificação e movimentação de mercadorias incomum para o horário.',
                        'Ela se retira antes de levantar suspeitas.',
                      ],
                    ),
                    const SizedBox(height: 20), // Reduzido de 32

                    // CAPÍTULO 3
                    _buildSection(
                      title: 'Capítulo 3 — A Noite Revela',
                      paragraphs: [
                        'Determinada, Jéssica volta ao local à noite. Escondida, ela testemunha contrabandistas fortemente equipados, jaulas com animais vivos e um esquema ativo de contrabando.',
                        'Ela neutraliza um dos homens, veste seu uniforme e se esconde no caminhão que chega para transportar as mercadorias.',
                        'Quando as portas se fecham, a investigação muda completamente de nível.',
                      ],
                    ),
                    const SizedBox(height: 20), // Reduzido de 32

                    // Carimbo do meio
                    Center(
                      child: Transform.rotate(
                        angle: -0.09, // ~-5 graus
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: histDocRed, width: 3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Opacity(
                            opacity: 0.25,
                            child: Text(
                              'CONFIDENCIAL\nNÃO DIVULGAR',
                              textAlign: TextAlign.center,
                              style: AppFonts.specialElite(
                                fontSize: 12,
                                color: histDocRed,
                                height: 1.4,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // CAPÍTULO 4
                    _buildSection(
                      title: 'Capítulo 4 — A Doca Abandonada e o Galpão',
                      paragraphs: [
                        'O caminhão leva Jéssica a um complexo clandestino com uma doca antiga, paredes danificadas e caixas espalhadas. O número de contrabandistas é maior do que o esperado e há pessoas de jaleco participando da operação.',
                        'Ela identifica uma porta reforçada vigiada constantemente. Após neutralizar o guarda e obter seu cartão de acesso, avança para o interior secreto.',
                      ],
                    ),
                    const SizedBox(height: 32),

                    // CAPÍTULO 5
                    _buildSection(
                      title: 'Capítulo 5 — O Laboratório Clandestino',
                      paragraphs: [
                        'O laboratório é completamente diferente do galpão: limpo, tecnológico e equipado com máquinas de análise química.',
                        'Em salas protegidas por vidro, há gatos, cães e calopsitas mutantes, com sinais de experimentação forçada. Jéssica coleta provas, registra documentos, hackeia computadores e descobre substâncias químicas verdes e azuis usadas nos experimentos.',
                        'Ela escapa por pouco, evitando cientistas e guardas.',
                      ],
                    ),
                    const SizedBox(height: 32),

                    // CAPÍTULO FINAL
                    _buildFinalSection(),

                    // Rodapé
                    Container(
                      margin: const EdgeInsets.only(top: 48),
                      padding: const EdgeInsets.only(top: 24),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: histBorderDim, width: 2),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'FIM DO RELATÓRIO — CASO SNOUT',
                            textAlign: TextAlign.center,
                            style: AppFonts.courier(
                              fontSize: 13,
                              color: histBorderDim,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Arquivo preparado por: Detetive Jéssica Campos',
                            textAlign: TextAlign.center,
                            style: AppFonts.courier(
                              fontSize: 11,
                              color: histBorderDim,
                              letterSpacing: 0.5,
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
        ),
      ],
    );
  }

  Widget _buildSection({required String title, required List<String> paragraphs}) {
    return Container(
      padding: const EdgeInsets.all(14), // Aumentado de 10 para 14
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.4),
        border: Border.all(color: histInkHeader, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10), // Aumentado de 6 para 10
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: histBorderDim, width: 1),
              ),
            ),
            child: Text(
              title.toUpperCase(),
              style: AppFonts.georgia(
                fontSize: 14, // Aumentado de 10 para 14 (proporção React)
                color: histDocRed,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10), // Aumentado de 6 para 10
          ...paragraphs.map((p) => Padding(
            padding: const EdgeInsets.only(bottom: 10), // Aumentado de 6 para 10
            child: Text(
              p,
              textAlign: TextAlign.left,
              style: AppFonts.georgia(
                fontSize: 12, // Aumentado de 9 para 12 (proporção React)
                color: histInkHeader,
                height: 1.5, // Aumentado de 1.4 para 1.5
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildFinalSection() {
    return Container(
      padding: const EdgeInsets.all(14), // Aumentado de 12 para 14
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.4),
        border: Border.all(color: histInkHeader, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10), // Aumentado de 8 para 10
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: histBorderDim, width: 1),
              ),
            ),
            child: Text(
              'CAPÍTULO FINAL — AS CONSEQUÊNCIAS E A ESCOLHA',
              style: AppFonts.georgia(
                fontSize: 14, // Aumentado de 11 para 14
                color: histDocRed,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10), // Aumentado de 8 para 10
          Text(
            'De volta ao escritório, Jéssica monta seu relatório oficial. Ela tem duas escolhas:',
            textAlign: TextAlign.left,
            style: AppFonts.georgia(
              fontSize: 12, // Aumentado de 10 para 12
              color: histInkHeader,
              height: 1.5, // Aumentado de 1.4 para 1.5
            ),
          ),
          const SizedBox(height: 14), // Aumentado de 12 para 14

          // Opção 1
          Container(
            margin: const EdgeInsets.only(left: 12, bottom: 10), // Aumentado bottom
            padding: const EdgeInsets.all(12), // Aumentado de 10 para 12
            decoration: BoxDecoration(
              color: histGold.withValues(alpha: 0.15),
              border: const Border(
                left: BorderSide(color: histGold, width: 4),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1. Ligar para a Polícia:',
                  style: AppFonts.georgia(
                    fontSize: 13, // Aumentado de 11 para 13
                    color: histInkHeader,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6), // Aumentado de 4 para 6
                Text(
                  'O esquema é desmantelado, o caso ganha repercussão e a detetive recebe proposta de trabalhar com a polícia.',
                  textAlign: TextAlign.left,
                  style: AppFonts.georgia(
                    fontSize: 12, // Aumentado de 10 para 12
                    color: histInkHeader,
                    height: 1.5, // Aumentado de 1.4 para 1.5
                  ),
                ),
              ],
            ),
          ),

          // Opção 2
          Container(
            margin: const EdgeInsets.only(left: 12, bottom: 14), // Aumentado bottom
            padding: const EdgeInsets.all(12), // Aumentado de 10 para 12
            decoration: BoxDecoration(
              color: histGold.withValues(alpha: 0.15),
              border: const Border(
                left: BorderSide(color: histGold, width: 4),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2. Ligar para o Senhor E:',
                  style: AppFonts.georgia(
                    fontSize: 13, // Aumentado de 11 para 13
                    color: histInkHeader,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6), // Aumentado de 4 para 6
                Text(
                  'Recebe o bônus prometido, mas percebe que o informante sabia demais. Ela envia anonimamente um dossiê à polícia, mesmo após entregar tudo ao Senhor E.',
                  textAlign: TextAlign.left,
                  style: AppFonts.georgia(
                    fontSize: 12, // Aumentado de 10 para 12
                    color: histInkHeader,
                    height: 1.5, // Aumentado de 1.4 para 1.5
                  ),
                ),
              ],
            ),
          ),

          Text(
            'O caso é encerrado, mas deixa claro que o desaparecimento dos animais era parte de uma operação maior — e o Senhor E permanece uma incógnita.',
            textAlign: TextAlign.left,
            style: AppFonts.georgia(
              fontSize: 12, // Aumentado de 10 para 12
              color: histInkHeader,
              height: 1.5, // Aumentado de 1.4 para 1.5
            ),
          ),
        ],
      ),
    );
  }
}