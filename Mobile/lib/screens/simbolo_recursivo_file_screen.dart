import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/easter_egg_file_header.dart';
import '../widgets/easter_egg_file_section.dart';
import '../widgets/case_header.dart';

const easterEggBackground = Color(0xFF100C08);
const easterEggColor = Color(0xFF8B5A8B);

/// Tela de Easter Egg "Símbolo Recursivo".
/// Apresenta detalhes sobre um símbolo misterioso que se repete no jogo:
/// localizações, padrão de aparição, teoria sobre seu significado e recompensa.
/// Design de dossiê com estilo de descoberta secreta e anotações investigativas.
class SimboloRecursivoFileScreen extends StatelessWidget {
  const SimboloRecursivoFileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: easterEggBackground,
      body: SafeArea(
        child: Column(
          children: [
            const CaseHeader(),
            _buildBackButton(context),
            _buildCategoryHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 16, 12, 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFF5EFE7), // Bege claro
                          Color(0xFFE8DCC8), // Bege escuro
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
                      children: [
                        const EasterEggFileHeader(
                          fileNumber: '#SC-EE-003 – SÍMBOLO RECURSIVO',
                          date: 'Descoberto em: 22/11/2024',
                          stickyNoteText: '∞ O símbolo que se repete infinitamente',
                        ),
                        const SizedBox(height: 24),
                        
                        // Title with Label
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6D5F7),
                            border: Border.all(
                              color: easterEggColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'EASTER EGG',
                                style: AppFonts.courier(
                                  fontSize: 8,
                                  color: easterEggColor,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'SÍMBOLO RECURSIVO',
                                textAlign: TextAlign.center,
                                style: AppFonts.specialElite(
                                  fontSize: 20,
                                  color: const Color(0xFF2B2B2B),
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        EasterEggFileSection(
                          title: 'INFORMAÇÕES GERAIS',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoField('TIPO', 'Símbolo Geométrico'),
                              const SizedBox(height: 9),
                              _buildInfoField('FORMA', 'Espiral triangular que se dobra sobre si mesma'),
                              const SizedBox(height: 9),
                              _buildInfoField('OCORRÊNCIAS', 'Aparece 7 vezes em locais diferentes - cada vez maior que a anterior'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        const EasterEggFileSection(
                          title: 'DESCRIÇÃO DA DESCOBERTA',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Um símbolo geométrico estranho aparece gravado, desenhado ou projetado em superfícies ao longo de todos os níveis do jogo. O símbolo consiste em uma espiral triangular que parece se dobrar sobre si mesma, criando um efeito de profundidade impossível - como se fosse uma estrutura 3D vista de um ângulo específico.',
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Cada vez que o símbolo aparece, ele é ligeiramente maior e mais complexo. A primeira ocorrência é quase imperceptível, gravada na base de uma gaiola no Petshop. A sétima e última aparição é enorme, ocupando uma parede inteira no laboratório secreto.',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        EasterEggFileSection(
                          title: 'LOCALIZAÇÕES CONHECIDAS',
                          child: Column(
                            children: [
                              _buildLocation('OCORRÊNCIA 1', 'Petshop - Base da gaiola do papagaio roxo', 'Tamanho: 3cm'),
                              const SizedBox(height: 9),
                              _buildLocation('OCORRÊNCIA 2', 'Galpão - Porta de metal do container', 'Tamanho: 8cm'),
                              const SizedBox(height: 9),
                              _buildLocation('OCORRÊNCIA 3', 'Rua - Grafite no beco ao lado do bar', 'Tamanho: 15cm'),
                              const SizedBox(height: 9),
                              _buildLocation('OCORRÊNCIA 4', 'Bar - Tatuagem no braço do Homem Misterioso', 'Tamanho: 6cm'),
                              const SizedBox(height: 9),
                              _buildLocation('OCORRÊNCIA 5', 'Livraria - Marca d\'água em livro específico', 'Tamanho: 20cm'),
                              const SizedBox(height: 9),
                              _buildLocation('OCORRÊNCIA 6', 'Laboratório - Projeção holográfica no teto', 'Tamanho: 1m'),
                              const SizedBox(height: 9),
                              _buildLocation('OCORRÊNCIA 7', 'Sala Secreta - Parede completa', 'Tamanho: 3m'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        EasterEggFileSection(
                          title: 'TEORIAS INVESTIGATIVAS',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTheory(
                                'TEORIA 1: ASSINATURA DO EXPERIMENTO',
                                'O símbolo pode ser a "assinatura" ou marca registrada do projeto científico clandestino. Cada ocorrência marca um estágio do experimento, crescendo conforme a escala das operações aumentava.',
                              ),
                              const SizedBox(height: 12),
                              _buildTheory(
                                'TEORIA 2: MAPA DIMENSIONAL',
                                'A progressão do símbolo pode indicar pontos de "ressonância" onde o experimento afetou a realidade. A forma recursiva sugere dobras dimensionais ou loops temporais.',
                              ),
                              const SizedBox(height: 12),
                              _buildTheory(
                                'TEORIA 3: LINGUAGEM ALIENÍGENA',
                                'Alguns investigadores acreditam que o símbolo não é humano. Pode ser uma forma de comunicação ou aviso deixado por algo que foi despertado ou invocado durante os experimentos.',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        EasterEggFileSection(
                          title: 'COMO DESBLOQUEAR O SEGREDO',
                          child: Column(
                            children: [
                              _buildStep(
                                'PASSO 1',
                                'Fotografe todas as 7 ocorrências do símbolo ao longo do jogo.',
                              ),
                              const SizedBox(height: 9),
                              _buildStep(
                                'PASSO 2',
                                'Sobreponha todas as imagens digitalmente no computador de Jessica (Modo Investigação).',
                              ),
                              const SizedBox(height: 9),
                              _buildStep(
                                'PASSO 3',
                                'A sobreposição revela coordenadas matemáticas que apontam para um ponto específico no mapa.',
                              ),
                              const SizedBox(height: 9),
                              _buildStep(
                                'PASSO 4',
                                'Vá até as coordenadas (atrás do laboratório) e cave no local exato para encontrar a Cápsula do Tempo.',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        const EasterEggFileSection(
                          title: 'RECOMPENSA',
                          child: Text(
                            'Desbloqueia conquista "Geometrista Interdimensional" + Cápsula do Tempo contendo: Diário do cientista principal, Plantas originais do laboratório, Vídeo VHS com experimento filmado, Final alternativo do jogo',
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        Text(
                          'Atualizado em: 22/11/2024',
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
            ),
          ],
        ),
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
                color: easterEggColor.withValues(alpha: 0.15),
                border: Border.all(
                  color: easterEggColor,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 14,
                    color: easterEggColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'VOLTAR',
                    style: AppFonts.courier(
                      fontSize: 10,
                      color: easterEggColor,
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
        color: easterEggColor.withValues(alpha: 0.85),
        border: Border(
          top: BorderSide(color: easterEggColor, width: 1),
          bottom: BorderSide(color: easterEggColor, width: 1),
        ),
      ),
      child: Text(
        'EASTER EGGS',
        style: AppFonts.specialElite(
          fontSize: 11,
          color: const Color(0xFFF5EFE7),
          letterSpacing: 2.0,
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, String value) {
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
        const SizedBox(height: 2),
        Text(
          value,
          style: AppFonts.courier(
            fontSize: 10,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildLocation(String occurrenceLabel, String location, String size) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: const Color(0xFFE6D5F7).withValues(alpha: 0.3),
        border: const Border(
          left: BorderSide(
            color: easterEggColor,
            width: 3,
          ),
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                occurrenceLabel,
                style: AppFonts.courier(
                  fontSize: 8,
                  color: easterEggColor,
                  letterSpacing: 0.7,
                ),
              ),
              Text(
                size,
                style: AppFonts.courier(
                  fontSize: 8,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            location,
            style: AppFonts.courier(
              fontSize: 10,
              color: Colors.black,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTheory(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.courier(
            fontSize: 9,
            color: easterEggColor,
            letterSpacing: 0.7,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: AppFonts.courier(
            fontSize: 10,
            color: Colors.black,
            height: 1.8,
          ),
        ),
      ],
    );
  }

  Widget _buildStep(String stepLabel, String stepText) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: const Color(0xFFE6D5F7).withValues(alpha: 0.3),
        border: const Border(
          left: BorderSide(
            color: easterEggColor,
            width: 3,
          ),
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stepLabel,
            style: AppFonts.courier(
              fontSize: 8,
              color: easterEggColor,
              letterSpacing: 0.7,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            stepText,
            style: AppFonts.courier(
              fontSize: 10,
              color: Colors.black,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}