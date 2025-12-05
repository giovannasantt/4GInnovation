import 'package:flutter/material.dart';
import '../components/case_file_header.dart';

const nivelBackground = Color(0xFF100C08);
const nivelPaper = Color(0xFFF5F0E1);
const nivelInk = Color(0xFF2B2B2B);
const nivelRed = Color(0xFFC41E3A);
const nivelBlue = Color(0xFF1F2A44);
const nivelPostit = Color(0xFFFFFACD);

class Nivel1Screen extends StatelessWidget {
  const Nivel1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nivelBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CaseFileHeader(caseId: 'SC-LOC-001', caseTitle: "SNOUT'S CASE"),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Container principal
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: nivelPaper,
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
                        const Padding(
                          padding: EdgeInsets.only(right: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'NÍVEL 1 — Rua Principal de São Domingues',
                                style: TextStyle(
                                  fontFamily: 'Courier Prime',
                                  fontSize: 14,
                                  color: nivelInk,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 8),
                              CaseTag(code: 'CASO: SC-LOC-001'),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Seções
                        _buildSection(
                          'Resumo do Caso',
                          const Text(
                            'Jéssica inicia a investigação conversando com moradores e comerciantes da rua onde os desaparecimentos ocorreram. É um nível introdutório focado em diálogo e coleta de informações iniciais.',
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 13,
                              color: nivelInk,
                              height: 1.5,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'Descrição do Ambiente',
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              BulletPoint(text: 'Rua residencial com comércios locais: cafeteria, sorveteria, pet shop, bar e pequenos mercados.'),
                              BulletPoint(text: 'Asfalto escuro, calçadas cinzas.'),
                              BulletPoint(text: 'Pessoas caminhando, carros passando.'),
                              BulletPoint(text: 'Clima de manhã cedo, iluminação suave.'),
                              BulletPoint(text: 'Bar no final da rua: fachada rústica, interior limpo e elegante com balcão, clientes e garçonete.'),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'Objetivos do Jogador',
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              BulletPoint(text: 'Conversar com todos os NPCs.'),
                              BulletPoint(text: 'Investigar comércios (cafeteria / sorveteria / bar).'),
                              BulletPoint(text: 'Identificar pistas iniciais sobre desaparecimentos.'),
                              BulletPoint(text: 'Encontrar informação sobre o bar ao final da rua.'),
                              BulletPoint(text: 'Retornar ao carro da agência para completar o nível.'),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'NPCs Presentes',
                          const Text(
                            'Comerciantes da rua • Clientes do bar • Moradores locais',
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 13,
                              color: nivelInk,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'Inimigos / Ameaças',
                          const Text(
                            'Nenhuma ameaça direta. Nível totalmente seguro.',
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 13,
                              color: nivelInk,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'Desafios e Puzzles',
                          const Text(
                            'Pequenos puzzles de diálogo • Identificação de pistas ambientais',
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 13,
                              color: nivelInk,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'Fluxo do Nível',
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: nivelBlue.withValues(alpha: 0.08),
                              border: Border.all(
                                color: nivelBlue,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Rua → bar → conversa com NPCs → retorno ao carro → escritório → quadro investigativo',
                              style: TextStyle(
                                fontFamily: 'Courier Prime',
                                fontSize: 11,
                                color: nivelBlue,
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'Itens Importantes / Fotos',
                          const Text(
                            'Fotos opcionais do bar e arredores • Anotações de depoimentos',
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 13,
                              color: nivelInk,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'Conexão com a Narrativa',
                          const Text(
                            'Este nível introduz a história e apresenta as primeiras hipóteses.',
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 13,
                              color: nivelInk,
                            ),
                          ),
                          highlight: true,
                        ),
                      ],
                    ),
                  ),
                  
                  // Post-it
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Transform.rotate(
                      angle: 0.035,
                      child: Container(
                        width: 130,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: nivelPostit,
                          border: Border.all(
                            color: Colors.black.withValues(alpha: 0.15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Text(
                          '"Início calmo. Atenção aos detalhes."',
                          style: TextStyle(
                            fontFamily: 'Kalam',
                            fontSize: 11,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSection(String title, Widget content, {bool highlight = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black.withValues(alpha: 0.15),
                width: 1,
              ),
            ),
          ),
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Special Elite',
              fontSize: 11,
              color: highlight ? nivelRed : nivelInk,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 8),
        content,
      ],
    );
  }
}

class CaseTag extends StatelessWidget {
  final String code;
  
  const CaseTag({Key? key, required this.code}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: nivelRed.withValues(alpha: 0.15),
        border: Border.all(color: nivelRed, width: 1),
      ),
      child: Text(
        code,
        style: const TextStyle(
          fontFamily: 'Courier Prime',
          fontSize: 9,
          color: nivelRed,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  
  const BulletPoint({Key? key, required this.text}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 13,
              color: nivelInk,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 13,
                color: nivelInk,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
