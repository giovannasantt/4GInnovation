import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/case_header.dart';

const mapasBackground = Color(0xFF100C08); // Fundo escuro como NPCs
const mapasColor = Color(0xFF5A6B45);
const accentBrown = Color(0xFF8B7355);
const borderGold = Color(0xFFD6B877);

class MapasFileScreen extends StatelessWidget {
  const MapasFileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapas = [
      MapaData(
        numero: '01',
        titulo: 'ESCRITÓRIO DA DETETIVE',
        descricao: 'O local onde Jessica Campos organiza sua investigação. Uma sala pequena, com paredes cobertas por quadros de anotações, fotos e fios conectando suspeitos. Aqui a jogadora revisa pistas, interpreta documentos e estabelece conexões. É a base narrativa da história.',
        ambiente: 'Silencioso, íntimo, iluminação quente',
        npcs: 'Nenhum',
        pontosInteresse: [
          'Mesa com dossiês',
          'Quadro de conexões',
          'Gaveta trancada (elemento narrativo)'
        ],
        relevancia: 'Apresenta o objetivo do jogo e contextualiza o caso.',
      ),
      MapaData(
        numero: '02',
        titulo: 'RUA PRINCIPAL DE SNOUT\'S CASE',
        descricao: 'A rua mais movimentada da cidade. Um cenário urbano com lojas, ciclistas, carros e transeuntes. Representa a conexão entre todos os ambientes e prepara o jogador para o ritmo da investigação.',
        ambiente: 'Rua aberta, iluminação natural',
        npcs: 'Civis variados',
        pontosInteresse: [
          'Vitrine do petshop Snout',
          'Faixa de pedestres',
          'Poste com cartazes rasgados'
        ],
        relevancia: 'Introduz o clima da cidade e esconde pequenas pistas ambientais.',
      ),
      MapaData(
        numero: '03',
        titulo: 'BAR DO BICO TORTO',
        descricao: 'Um bar pouco iluminado frequentado por trabalhadores e indivíduos suspeitos. É onde Jessica coleta as primeiras informações reais sobre o que está acontecendo no petshop.',
        ambiente: 'Escuro, fumaça leve, mesas apertadas',
        npcs: 'Homem Misterioso, Garçonete Informal, Jovem Ansioso, Figurantes',
        pontosInteresse: [
          'Mesa do Homem Misterioso',
          'Balcão do bar',
          'Porta dos fundos'
        ],
        relevancia: 'Primeiro contato com testemunhos importantes.',
      ),
      MapaData(
        numero: '04',
        titulo: 'PETSHOP SNOUT',
        descricao: 'Uma loja aparentemente comum com gaiolas, balcão e funcionários educados demais. O ambiente é limpo, porém há uma sensação sutil de artificialidade.',
        ambiente: 'Iluminação branca, cheiro de produtos de limpeza',
        npcs: 'Funcionários do petshop',
        pontosInteresse: [
          'Gaiolas com animais',
          'Balcão de atendimento',
          'Porta restrita para funcionários'
        ],
        relevancia: 'Revela a ligação entre o petshop e atividades ilegais.',
      ),
      MapaData(
        numero: '05',
        titulo: 'DOCAS DO PETSHOP (DIA)',
        descricao: 'Uma área de carga e descarga usada para movimentar caixas e animais capturados. Durante o dia, parece apenas mais um ponto turístico ou comercial.',
        ambiente: 'Ao ar livre, barulho de trabalhadores e gaivotas',
        npcs: 'Capangas e contrabandistas',
        pontosInteresse: [
          'Caixas marcadas',
          'Caminhão de entrega',
          'Moita onde pistas podem ser encontradas'
        ],
        relevancia: 'Introduz a operação clandestina que funciona por trás do petshop.',
      ),
      MapaData(
        numero: '06',
        titulo: 'DOCAS DO PETSHOP (NOITE)',
        descricao: 'A mesma área, mas agora silenciosa, obscura e muito mais perigosa. Guardas patrulham de maneira agressiva e a tensão é muito mais elevada.',
        ambiente: 'Pouca luz, sombras longas, clima ameaçador',
        npcs: 'Capangas armados',
        pontosInteresse: [
          'Containers trancados',
          'Área de vigilância',
          'Embarcação abandonada'
        ],
        relevancia: 'Parte crucial da investigação de campo.',
      ),
      MapaData(
        numero: '07',
        titulo: 'GALPÃO DE CONTRABANDISTAS',
        descricao: 'Um galpão amplo e frio, repleto de caixas, gaiolas e equipamentos usados para armazenar os animais do tráfico.',
        ambiente: 'Metal, eco, pouca luz',
        npcs: 'Contrabandistas, capangas',
        pontosInteresse: [
          'Área de triagem',
          'Escritório interno',
          'Gaiolas empilhadas'
        ],
        relevancia: 'Reforça o escopo do esquema ilegal.',
      ),
      MapaData(
        numero: '08',
        titulo: 'LABORATÓRIO OCULTO',
        descricao: 'A revelação final: um laboratório escondido onde cientistas manipulam animais para fins comerciais. Tudo é limpo, organizado, mas perturbador.',
        ambiente: 'Cirúrgico, silencioso, frio',
        npcs: 'Cientistas',
        pontosInteresse: [
          'Bancadas com amostras',
          'Sala trancada',
          'Computador com dados do esquema'
        ],
        relevancia: 'Peça final da narrativa. Explica tudo.',
      ),
    ];

    return Scaffold(
      backgroundColor: mapasBackground,
      body: Column(
        children: [
          const CaseHeader(),
          _buildBackButton(context),
          _buildCategoryHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 20),
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '#MAP-FULL – MAPEAMENTO COMPLETO DA INVESTIGAÇÃO',
                          style: AppFonts.courier(
                            fontSize: 9,
                            color: Colors.black.withValues(alpha: 0.7),
                            letterSpacing: 0.7,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '16/11/2025',
                      style: AppFonts.courier(
                        fontSize: 9,
                        color: Colors.black.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 12),
                    
                    // Sticky Note
                    Transform.rotate(
                      angle: -0.03,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF9DB),
                          border: Border.all(
                            color: const Color(0xFFD6B877).withValues(alpha: 0.3),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          '8 locais mapeados - ordem cronológica da investigação',
                          textAlign: TextAlign.center,
                          style: AppFonts.courier(
                            fontSize: 10,
                            color: const Color(0xFF2B2B2B),
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Stamp
                    Align(
                      alignment: Alignment.centerRight,
                      child: Transform.rotate(
                        angle: 0.09,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFC41E3A),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'ARQUIVO DE\nINVESTIGAÇÃO\nCASO: SNOUT\'S CASE',
                            textAlign: TextAlign.center,
                            style: AppFonts.specialElite(
                              fontSize: 8,
                              color: const Color(0xFFC41E3A),
                              letterSpacing: 1.0,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Title
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: borderGold,
                        border: Border.all(
                          color: accentBrown,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 6,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'MAPAS',
                            style: AppFonts.courier(
                              fontSize: 8,
                              color: accentBrown,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'LOCAIS DA INVESTIGAÇÃO',
                            textAlign: TextAlign.center,
                            style: AppFonts.specialElite(
                              fontSize: 18,
                              color: const Color(0xFF2B2B2B),
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Mapas List
                    ...mapas.asMap().entries.map((entry) {
                      final index = entry.key;
                      final mapa = entry.value;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Divisor (except first item)
                          if (index > 0) ...[
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                Container(
                                  width: 9,
                                  height: 9,
                                  decoration: const BoxDecoration(
                                    color: accentBrown,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    margin: const EdgeInsets.symmetric(horizontal: 9),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                          color: accentBrown.withValues(alpha: 0.3),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 9,
                                  height: 9,
                                  decoration: const BoxDecoration(
                                    color: accentBrown,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                          ] else
                            const SizedBox(height: 0),
                          
                          // Label tag
                          Transform.rotate(
                            angle: -0.017,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                              decoration: BoxDecoration(
                                color: borderGold,
                                border: Border.all(
                                  color: const Color(0xFF8B7355),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Text(
                                'MAPA ${mapa.numero}',
                                style: AppFonts.specialElite(
                                  fontSize: 7,
                                  color: Colors.black,
                                  letterSpacing: 0.6,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          
                          // Map Section Card
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFAF8F3),
                              border: Border.all(
                                color: const Color(0xFFD4C4A8),
                                width: 2,
                              ),
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
                                // Title
                                Container(
                                  padding: const EdgeInsets.only(bottom: 6),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: accentBrown,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    mapa.titulo,
                                    style: AppFonts.specialElite(
                                      fontSize: 12,
                                      color: Colors.black.withValues(alpha: 0.9),
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                
                                // Image Placeholder
                                Container(
                                  width: double.infinity,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8E2D5),
                                    border: Border.all(
                                      color: const Color(0xFFD4C4A8),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '[FOTOGRAFIA DO LOCAL]',
                                      style: AppFonts.specialElite(
                                        fontSize: 8,
                                        color: Colors.black.withValues(alpha: 0.4),
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                
                                // Descrição
                                _buildField('DESCRIÇÃO', mapa.descricao),
                                const SizedBox(height: 10),
                                
                                // Ambiente
                                _buildField('AMBIENTE', mapa.ambiente),
                                const SizedBox(height: 10),
                                
                                // NPCs
                                _buildField('NPCs ENCONTRADOS', mapa.npcs),
                                const SizedBox(height: 10),
                                
                                // Pontos de Interesse
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PONTOS DE INTERESSE',
                                      style: AppFonts.courier(
                                        fontSize: 8,
                                        color: Colors.black.withValues(alpha: 0.6),
                                        letterSpacing: 0.7,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    ...mapa.pontosInteresse.map((ponto) => Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 4,
                                            height: 4,
                                            margin: const EdgeInsets.only(top: 6, right: 6),
                                            decoration: const BoxDecoration(
                                              color: accentBrown,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              ponto,
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
                                const SizedBox(height: 12),
                                
                                // Relevância Narrativa
                                Container(
                                  padding: const EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    color: borderGold.withValues(alpha: 0.2),
                                    border: const Border(
                                      left: BorderSide(
                                        color: borderGold,
                                        width: 3,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'RELEVÂNCIA NARRATIVA',
                                        style: AppFonts.courier(
                                          fontSize: 8,
                                          color: accentBrown,
                                          letterSpacing: 0.7,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        mapa.relevancia,
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
                      );
                    }),
                    
                    const SizedBox(height: 32),
                    
                    Text(
                      'Atualizado em: 16/11/2025',
                      style: AppFonts.courier(
                        fontSize: 9,
                        color: Colors.black.withValues(alpha: 0.5),
                      ),
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
                color: const Color(0xFF8B7355).withValues(alpha: 0.15),
                border: Border.all(
                  color: accentBrown,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 14,
                    color: accentBrown,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'VOLTAR',
                    style: AppFonts.courier(
                      fontSize: 10,
                      color: accentBrown,
                      letterSpacing: 0.5,
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

  Widget _buildCategoryHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: mapasColor.withValues(alpha: 0.15),
        border: Border(
          top: BorderSide(color: mapasColor.withValues(alpha: 0.3), width: 1),
          bottom: BorderSide(color: mapasColor.withValues(alpha: 0.3), width: 1),
        ),
      ),
      child: Text(
        'MAPAS',
        style: AppFonts.specialElite(
          fontSize: 11,
          color: mapasColor,
          letterSpacing: 2.0,
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
        const SizedBox(height: 4),
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
}

class MapaData {
  final String numero;
  final String titulo;
  final String descricao;
  final String ambiente;
  final String npcs;
  final List<String> pontosInteresse;
  final String relevancia;

  MapaData({
    required this.numero,
    required this.titulo,
    required this.descricao,
    required this.ambiente,
    required this.npcs,
    required this.pontosInteresse,
    required this.relevancia,
  });
}