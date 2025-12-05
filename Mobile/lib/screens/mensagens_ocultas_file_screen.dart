import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/easter_egg_file_header.dart';
import '../widgets/easter_egg_file_section.dart';
import '../widgets/case_header.dart';

const easterEggBackground = Color(0xFF100C08);
const easterEggColor = Color(0xFF8B5A8B);

/// Tela de Easter Egg "Mensagens Ocultas".
/// Apresenta detalhes sobre mensagens cifradas escondidas no jogo:
/// localização, técnicas de decodificação, conteúdo revelado e recompensa.
/// Design de dossiê com estilo de descoberta secreta e anotações criptográficas.
class MensagensOcultasFileScreen extends StatelessWidget {
  const MensagensOcultasFileScreen({Key? key}) : super(key: key);

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
                          fileNumber: '#SC-EE-002 – MENSAGENS OCULTAS',
                          date: 'Descoberto em: 09/11/2024',
                          stickyNoteText: '📝 Código cifrado escondido nos diálogos',
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
                                'MENSAGENS OCULTAS',
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
                              _buildInfoField('TIPO', 'Código Linguístico'),
                              const SizedBox(height: 9),
                              _buildInfoField('LOCALIZAÇÃO', 'Diálogos específicos de NPCs do bar - Primeiras letras de cada frase'),
                              const SizedBox(height: 9),
                              _buildInfoField('MÉTODO DE CIFRAGEM', 'Acróstico invertido'),
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
                                'Ao conversar com todos os NPCs do bar em uma ordem específica e anotar as primeiras letras de cada frase do diálogo, forma-se uma mensagem oculta quando lida de trás para frente. A mensagem revela coordenadas de um local secreto e um aviso crítico sobre a investigação.',
                              ),
                              SizedBox(height: 12),
                              Text(
                                'A ordem correta de conversação é: Garçonete → Homem Misterioso → Jovem Ansioso → Homem Solitário → Mulher Silenciosa.',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        EasterEggFileSection(
                          title: 'MENSAGEM DECODIFICADA',
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF8B1E1E).withValues(alpha: 0.1),
                              border: Border.all(
                                color: const Color(0xFF8B1E1E),
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'MENSAGEM REVELADA',
                                  style: AppFonts.specialElite(
                                    fontSize: 8,
                                    color: const Color(0xFF8B1E1E),
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '"EXPERIMENTO FALHOU\nTODOS SABEM\nNINGUÉM FALA\nPORÃO NÍVEL ZERO"',
                                  textAlign: TextAlign.center,
                                  style: AppFonts.courier(
                                    fontSize: 11,
                                    color: Colors.black,
                                    height: 1.8,
                                    letterSpacing: 0.7,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        EasterEggFileSection(
                          title: 'COMO ENCONTRAR',
                          child: Column(
                            children: [
                              _buildStep(
                                'PASSO 1',
                                'Visite o bar no Nível 4 entre 21h e 23h no horário do jogo.',
                              ),
                              const SizedBox(height: 9),
                              _buildStep(
                                'PASSO 2',
                                'Converse com cada NPC na ordem exata: Garçonete, Homem Misterioso, Jovem Ansioso, Homem Solitário, Mulher Silenciosa.',
                              ),
                              const SizedBox(height: 9),
                              _buildStep(
                                'PASSO 3',
                                'Anote as primeiras letras de cada frase completa do diálogo. Leia de trás para frente.',
                              ),
                              const SizedBox(height: 9),
                              _buildStep(
                                'PASSO 4',
                                'Use a mensagem decodificada para acessar a porta escondida atrás do quadro de avisos no Petshop.',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        const EasterEggFileSection(
                          title: 'RECOMPENSA',
                          child: Text(
                            'Desbloqueia conquista "Decodificador" + Acesso ao Nível Secreto "Porão Nível Zero" + 3 documentos confidenciais extras',
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        Text(
                          'Atualizado em: 09/11/2024',
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