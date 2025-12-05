import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/easter_egg_file_header.dart';
import '../widgets/easter_egg_file_section.dart';
import '../widgets/case_header.dart';

const easterEggBackground = Color(0xFF100C08);
const easterEggColor = Color(0xFF8B5A8B);

/// Tela de Easter Egg "Relógio Quebrado".
/// Apresenta detalhes sobre este segredo oculto no jogo: como encontrar,
/// localização, pistas, significado para a narrativa e recompensa.
/// Design de dossiê com estilo de descoberta secreta e anotações misteriosas.
class RelogioQuebradoFileScreen extends StatelessWidget {
  const RelogioQuebradoFileScreen({Key? key}) : super(key: key);

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
                          fileNumber: '#SC-EE-001 – RELÓGIO QUEBRADO',
                          date: 'Descoberto em: 31/10/2024',
                          stickyNoteText: '⏰ Sempre marca 3:33 - o que isso significa?',
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
                                'RELÓGIO QUEBRADO',
                                textAlign: TextAlign.center,
                                style: AppFonts.specialElite(
                                  fontSize: 20, // 36px → 20px
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
                              _buildInfoField('TIPO', 'Objeto Recorrente'),
                              const SizedBox(height: 9),
                              _buildInfoField('LOCALIZAÇÃO', 'Aparece em todos os níveis - sempre na mesma posição relativa'),
                              const SizedBox(height: 9),
                              _buildInfoField('HORÁRIO MARCADO', '3:33 - Nunca muda'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        const EasterEggFileSection(
                          title: 'DESCRIÇÃO DA DESCOBERTA',
                          child: Text(
                            'Um relógio de parede antigo aparece pendurado em cada nível do jogo. O ponteiro está sempre parado exatamente às 3:33. Não importa o contexto da cena ou o horário narrativo, o relógio permanece congelado nesse momento. Interagir com ele 33 vezes consecutivas revela uma mensagem oculta na parede atrás dele.',
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        EasterEggFileSection(
                          title: 'TEORIAS E SIGNIFICADO',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTheory(
                                'TEORIA 1: TIMESTAMP DO INCIDENTE',
                                'O relógio pode marcar o momento exato em que o experimento falhou, quando tudo começou a dar errado nas instalações do Petshop Snout. 3:33 AM seria o "hora zero" da conspiração.',
                              ),
                              const SizedBox(height: 12),
                              _buildTheory(
                                'TEORIA 2: NÚMERO SIMBÓLICO',
                                'O número 3 repetido pode representar os três níveis de conhecimento do caso: o que o público sabe, o que os envolvidos sabem, e o que realmente aconteceu. A repetição sugere camadas de verdade.',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        EasterEggFileSection(
                          title: 'COMO ENCONTRAR',
                          child: Column(
                            children: [
                              _buildStep(
                                'PASSO 1',
                                'Localize o relógio de parede em cada nível. Está sempre em um corredor ou sala de espera.',
                              ),
                              const SizedBox(height: 9),
                              _buildStep(
                                'PASSO 2',
                                'Clique no relógio 33 vezes consecutivas sem interromper a sequência.',
                              ),
                              const SizedBox(height: 9),
                              _buildStep(
                                'PASSO 3',
                                'O relógio cairá, revelando coordenadas escritas na parede: "NÃO CONFIE NOS DOCUMENTOS OFICIAIS"',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        const EasterEggFileSection(
                          title: 'RECOMPENSA',
                          child: Text(
                            'Desbloqueia conquista "Cronometrista" + Acesso a documentos alternativos no arquivo final',
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        Text(
                          'Atualizado em: 31/10/2024',
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