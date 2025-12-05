import 'package:flutter/material.dart';
import '../components/case_file_header.dart';
import 'nivel1_screen.dart';

class Nivel3Screen extends StatelessWidget {
  const Nivel3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nivelBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CaseFileHeader(caseId: 'SC-LOC-003', caseTitle: "SNOUT'S CASE"),
            
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
                                'NÍVEL 3 — Docas do Petshop (Noite)',
                                style: TextStyle(
                                  fontFamily: 'Courier Prime',
                                  fontSize: 14,
                                  color: nivelInk,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 8),
                              CaseTag(code: 'CASO: SC-LOC-003'),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        _buildSection(
                          'Resumo do Caso',
                          const Text(
                            'Sob o manto da escuridão, Jessica se infiltra na área de carga e descarga do Petshop. O local, antes movimentado e barulhento durante o dia, agora é silencioso e mortal.',
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
                              BulletPoint(text: 'Iluminação precária, apenas postes distantes e lanternas dos guardas.'),
                              BulletPoint(text: 'Sombras longas e áreas de total escuridão.'),
                              BulletPoint(text: 'Containers empilhados criando labirintos.'),
                              BulletPoint(text: 'Neblina baixa vinda do mar próximo.'),
                              BulletPoint(text: 'Som de passos, vento e metal rangendo.'),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'Objetivos do Jogador',
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              BulletPoint(text: 'Navegar furtivamente entre os containers.'),
                              BulletPoint(text: 'Evitar o cone de visão dos capangas.'),
                              BulletPoint(text: 'Encontrar documentos de remessa no escritório externo.'),
                              BulletPoint(text: 'Localizar a entrada para o Galpão Principal.'),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildSection(
                          'NPCs Presentes',
                          const Text(
                            'Capangas (Patrulha) • Motorista do Caminhão (Dormindo)',
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
                            'Risco Alto. Capangas armados. Ser visto resulta em falha imediata ou confronto difícil.',
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
                            'Stealth (Furtividade) • Timing de patrulha • Encontrar chave do portão',
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
                              'Cerca externa → Labirinto de Containers → Escritório (Chave) → Portão do Galpão',
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
                            'Confirma o tráfico de animais e eleva a aposta: agora é uma questão de vida ou morte.',
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
                      angle: 0.052,
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
                          '"A noite esconde os crimes."',
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
