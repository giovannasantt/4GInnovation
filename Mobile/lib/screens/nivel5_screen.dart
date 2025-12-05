// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../components/case_file_header.dart';
import 'nivel1_screen.dart';

class Nivel5Screen extends StatelessWidget {
  const Nivel5Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nivelBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CaseFileHeader(caseId: 'SC-LOC-005', caseTitle: "SNOUT'S CASE"),
            
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
                    child: Stack(
                      children: [
                        // Watermark "TOP SECRET"
                        Positioned.fill(
                          child: Center(
                            child: Transform.rotate(
                              angle: -0.44,
                              child: Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: nivelRed.withValues(alpha: 0.05),
                                    width: 10,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'TOP\nSECRET',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Special Elite',
                                      fontSize: 28,
                                      color: nivelRed.withValues(alpha: 0.05),
                                      letterSpacing: 2,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        // Conteúdo principal
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 100),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NÍVEL 5 — Laboratório Oculto',
                                    style: TextStyle(
                                      fontFamily: 'Courier Prime',
                                      fontSize: 14,
                                      color: nivelInk,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  CaseTag(code: 'CASO: SC-LOC-005'),
                                ],
                              ),
                            ),
                            
                            const SizedBox(height: 20),
                            
                            _buildSection(
                              'Resumo do Caso',
                              const Text(
                                'O segredo final. Um laboratório estéril e tecnológico escondido sob o galpão sujo. Aqui, cientistas realizam experimentos genéticos nos animais roubados para criar "pets perfeitos".',
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
                                  BulletPoint(text: 'Paredes brancas, aço inoxidável, vidro.'),
                                  BulletPoint(text: 'Monitores piscando com dados biológicos.'),
                                  BulletPoint(text: 'Tubos de ensaio e cápsulas de contenção.'),
                                  BulletPoint(text: 'Frio intenso (ar condicionado no máximo).'),
                                  BulletPoint(text: 'Silêncio absoluto quebrado apenas por bips de máquinas.'),
                                ],
                              ),
                            ),
                            
                            const SizedBox(height: 16),
                            
                            _buildSection(
                              'Objetivos do Jogador',
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  BulletPoint(text: 'Hackear o computador principal para baixar os dados.'),
                                  BulletPoint(text: 'Libertar a "Cobaya Zero" (O animal original).'),
                                  BulletPoint(text: 'Confrontar o Cientista Chefe (Diálogo final).'),
                                  BulletPoint(text: 'Escapar antes da autodestruição/chegada da polícia.'),
                                ],
                              ),
                            ),
                            
                            const SizedBox(height: 16),
                            
                            _buildSection(
                              'NPCs Presentes',
                              const Text(
                                'Cientistas (Neutros/Hostis) • Cientista Chefe (Antagonista)',
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
                                'Risco Extremo. Qualquer erro pode bloquear o final verdadeiro.',
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
                                'Puzzle de Hacking (Minigame de lógica) • Decisão Moral Final',
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
                                  'Corredor de Descontaminação → Sala de Amostras → Mainframe → Saída de Emergência',
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
                                'O clímax da história. Todas as perguntas são respondidas e o destino de Snout é decidido.',
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
                      ],
                    ),
                  ),
                  
                  // Badge "NÍVEL FINAL"
                  Positioned(
                    top: -12,
                    left: -12,
                    child: Transform.rotate(
                      angle: -0.785,
                      child: Container(
                        width: 70,
                        height: 70,
                        color: nivelRed,
                        child: Transform.rotate(
                          angle: -0.785,
                          child: Center(
                            child: Text(
                              'NÍVEL\nFINAL',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Special Elite',
                                fontSize: 8,
                                color: const Color(0xFFF3E9D2),
                                letterSpacing: 1,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  // Post-it
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Transform.rotate(
                      angle: 0.017,
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
                          '"O coração da operação."',
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
