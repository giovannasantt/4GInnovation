import 'package:flutter/material.dart';
import '../components/case_file_header.dart';
import 'nivel1_screen.dart';

class Nivel4Screen extends StatelessWidget {
  const Nivel4Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nivelBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CaseFileHeader(caseId: 'SC-LOC-004', caseTitle: "SNOUT'S CASE"),
            
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
                                'NÍVEL 4 — Galpão dos Contrabandistas',
                                style: TextStyle(
                                  fontFamily: 'Courier Prime',
                                  fontSize: 14,
                                  color: nivelInk,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 8),
                              CaseTag(code: 'CASO: SC-LOC-004'),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        _buildSection(
                          'Resumo do Caso',
                          const Text(
                            'Dentro do galpão, a escala da operação é revelada. Gaiolas empilhadas até o teto, animais exóticos e uma infraestrutura logística complexa. Jessica precisa encontrar provas definitivas.',
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
                              BulletPoint(text: 'Espaço amplo, teto alto, eco constante.'),
                              BulletPoint(text: 'Cheiro forte de animais e serragem.'),
                              BulletPoint(text: 'Gaiolas cobertas com panos, caixas marcadas com "FRÁGIL".'),
                              BulletPoint(text: 'Escritório suspenso no segundo andar com vista para o galpão.'),
                              BulletPoint(text: 'Iluminação industrial amarela e forte.'),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'Objetivos do Jogador',
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              BulletPoint(text: 'Fotografar os animais (prova de crime).'),
                              BulletPoint(text: 'Encontrar o manifesto de carga.'),
                              BulletPoint(text: 'Acessar o escritório do chefe da operação.'),
                              BulletPoint(text: 'Descobrir a passagem secreta para o laboratório.'),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'NPCs Presentes',
                          const Text(
                            'Contrabandistas (Trabalhando) • Chefe da Operação (No escritório)',
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
                            'Risco Médio. Trabalhadores podem chamar segurança. Evite confronto direto.',
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 13,
                              color: nivelRed,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'Desafios e Puzzles',
                          const Text(
                            'Encontrar código do cofre • Mover caixas para criar caminho (Sokoban simplificado)',
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
                              'Térreo (Fotos) → Passarelas Superiores → Escritório → Passagem Secreta',
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
                            'As provas coletadas aqui são suficientes para a polícia, mas a passagem secreta sugere que há mais.',
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
                      angle: -0.035,
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
                          '"Onde tudo se conecta."',
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
