import 'package:flutter/material.dart';
import '../components/case_file_header.dart';
import 'nivel1_screen.dart';

class Nivel2Screen extends StatelessWidget {
  const Nivel2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nivelBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CaseFileHeader(caseId: 'SC-LOC-002', caseTitle: "SNOUT'S CASE"),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
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
                        const Padding(
                          padding: EdgeInsets.only(right: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'NÍVEL 2 — Bar do Bico Torto',
                                style: TextStyle(
                                  fontFamily: 'Courier Prime',
                                  fontSize: 14,
                                  color: nivelInk,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 8),
                              CaseTag(code: 'CASO: SC-LOC-002'),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        _buildSection(
                          'Resumo do Caso',
                          const Text(
                            'O bar é o ponto central de fofocas e informações do submundo. Aqui Jessica encontra figuras suspeitas que conhecem a verdade sobre o Petshop Snout.',
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
                              BulletPoint(text: 'Interior mal iluminado, cheiro de madeira velha e tabaco.'),
                              BulletPoint(text: 'Balcão longo com banquetas de couro rasgado.'),
                              BulletPoint(text: 'Mesas de canto na escuridão.'),
                              BulletPoint(text: 'Ventilador de teto girando lentamente.'),
                              BulletPoint(text: 'Som ambiente: conversas baixas, copos batendo, jazz suave ao fundo.'),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'Objetivos do Jogador',
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              BulletPoint(text: 'Falar com a Garçonete Informal (pista sobre horários).'),
                              BulletPoint(text: 'Observar o Homem Misterioso (sem ser notado).'),
                              BulletPoint(text: 'Tentar interagir com o Homem Solitário.'),
                              BulletPoint(text: 'Descobrir a senha ou dica para acessar os fundos do Petshop.'),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'NPCs Presentes',
                          const Text(
                            'Garçonete Informal • Homem Misterioso • Jovem Ansioso • Homem Solitário',
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
                            'Nível social. Risco de perder informações se escolher diálogos errados.',
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
                            'Puzzle de diálogo: Convencer a garçonete a falar • Decifrar o bilhete do Jovem Ansioso',
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
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Entrada → Balcão → Mesa do Fundo → Saída Discreta',
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
                          'Conexão com a Narrativa',
                          const Text(
                            'Revela que o Petshop não é apenas um comércio, mas uma fachada para algo maior.',
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
                  
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Transform.rotate(
                      angle: -0.017,
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
                          '"As coisas não são o que parecem."',
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
