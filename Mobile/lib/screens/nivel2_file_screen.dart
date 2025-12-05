import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
import '../widgets/case_header.dart';

// Constantes de cores usadas em toda a tela de níveis
// const permite otimização em compile-time (valores não mudam)
const levelBackground = Color(0xFF100C08);  // Fundo escuro quase preto
const levelPaperLevel = Color(0xFFF3E9D2);  // Cor bege do papel
const levelInk = Color(0xFF2B2B2B);          // Cor da tinta (texto)
const levelRed = Color(0xFFC41E3A);          // Vermelho para alertas
const levelBlue = Color(0xFF1F2A44);         // Azul escuro
const levelPostit = Color(0xFFFFF9C4);       // Amarelo do post-it
const levelBorderMain = Color(0xFF8B7355);   // Cor da borda marrom

/// StatelessWidget porque não há estado mutável nesta tela
/// Toda a informação é estática e não muda durante o ciclo de vida
class Nivel2FileScreen extends StatelessWidget {
  // const constructor permite que o Flutter reutilize instâncias idênticas
  // Key? permite identificação única do widget na árvore (útil para animações)
  const Nivel2FileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold fornece estrutura básica de Material Design (AppBar, Body, etc)
    return Scaffold(
      backgroundColor: levelBackground,
      // SafeArea evita que conteúdo fique sob notch/barra de status
      body: SafeArea(
        // Column organiza filhos verticalmente (eixo principal = vertical)
        child: Column(
          children: [
            // Widget reutilizável que mostra cabeçalho "SNOUT'S CASE"
            const CaseHeader(),
            
            // Método privado que retorna widget do botão voltar
            _buildBackButton(context),
            
            // Método privado que retorna faixa de categoria "NÍVEIS"
            _buildCategoryHeader(),
            
            // Expanded faz o SingleChildScrollView ocupar todo espaço restante
            // Sem Expanded, Column não saberia quanto espaço dar para scroll
            Expanded(
              // SingleChildScrollView permite rolagem vertical quando conteúdo excede altura
              child: SingleChildScrollView(
                // Padding adiciona espaço interno de 16px horizontal e vertical
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

  /// Constrói botão "VOLTAR" interativo
  /// Recebe context para acessar Navigator e fazer pop da tela
  Widget _buildBackButton(BuildContext context) {
    return Container(
      // Padding externo ao redor do botão
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      // Row organiza filhos horizontalmente (ícone + texto)
      child: Row(
        children: [
          // GestureDetector captura eventos de toque (tap, long press, etc)
          GestureDetector(
            // onTap executa quando usuário toca no botão
            // Navigator.pop remove a tela atual da pilha de navegação
            onTap: () => Navigator.pop(context),
            child: Container(
              // Padding interno do botão (entre borda e conteúdo)
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              // BoxDecoration permite customizar aparência (cor, borda, sombra, etc)
              decoration: BoxDecoration(
                // withValues(alpha: 0.2) cria cor semi-transparente (20% opacidade)
                color: const Color(0xFF8B7355).withValues(alpha: 0.2),
                // Border.all cria borda em todos os lados
                border: Border.all(
                  color: const Color(0xFFD4C4A8).withValues(alpha: 0.4),
                  width: 1,
                ),
                // BorderRadius.circular cria cantos arredondados uniformes
                borderRadius: BorderRadius.circular(4),
              ),
              // Row interno para ícone + texto lado a lado
              child: Row(
                // MainAxisSize.min faz Row ocupar apenas espaço necessário
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Ícone de seta para esquerda (Material Icons)
                  const Icon(
                    Icons.arrow_back,
                    size: 14,
                    color: Color(0xFFD4C4A8),
                  ),
                  // SizedBox cria espaço horizontal de 6px entre ícone e texto
                  const SizedBox(width: 6),
                  // Texto "VOLTAR" usando fonte customizada Courier
                  Text(
                    'VOLTAR',
                    // AppFonts.courier() retorna TextStyle com fonte Courier Prime
                    style: AppFonts.courier(
                      fontSize: 11,
                      color: const Color(0xFFD4C4A8).withValues(alpha: 0.9),
                      letterSpacing: 0.3,  // Espaçamento entre letras
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

  /// Constrói faixa horizontal de categoria "NÍVEIS"
  /// Ocupa largura total da tela e tem sombra para dar profundidade
  Widget _buildCategoryHeader() {
    return Container(
      // double.infinity faz Container ocupar toda largura disponível
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        // Cor de fundo semi-transparente (80% opacidade)
        color: const Color(0xFF7C6B45).withValues(alpha: 0.8),
        // Border permite customizar cada lado individualmente
        border: const Border(
          top: BorderSide(color: Color(0xFF7C6B45), width: 2),
          bottom: BorderSide(color: Color(0xFF7C6B45), width: 2),
        ),
        // boxShadow cria lista de sombras (pode ter múltiplas)
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 12,  // Quanto maior, mais difusa a sombra
            offset: const Offset(0, 4),  // Desloca sombra 4px para baixo
          ),
        ],
      ),
      child: Text(
        'NÍVEIS',
        // AppFonts.specialElite() retorna TextStyle com fonte Special Elite
        style: AppFonts.specialElite(
          fontSize: 14,
          color: Colors.white,
          letterSpacing: 2.0,  // Espaçamento largo entre letras (estilo título)
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  /// Constrói container principal com todo conteúdo do nível
  /// Usa Stack para sobrepor camada de sombra (background) e conteúdo real
  Widget _buildDetailContainer() {
    // Stack permite sobrepor widgets (children são empilhados)
    // Primeiro child fica no fundo, último child fica em cima
    return Stack(
      children: [
        // Camada de sombra/fundo (fica atrás do conteúdo)
        // Este Container cria efeito de "papel empilhado"
        Container(
          // margin desloca Container criando espaço visual de profundidade
          margin: const EdgeInsets.only(top: 4, left: 6, right: 6, bottom: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFE5DCC3),  // Bege mais escuro
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          // SizedBox com altura fixa para criar "papel de fundo"
          child: const SizedBox(height: 1600),
        ),
        
        // Container principal com todo o conteúdo real
        Container(
          width: double.infinity,
          // BoxConstraints limita largura máxima (responsividade para tablets)
          constraints: const BoxConstraints(maxWidth: 800),
          decoration: BoxDecoration(
            // LinearGradient cria gradiente vertical (top -> bottom)
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF5F0E1),  // Bege claro no topo
                Color(0xFFE8DCC8),  // Bege mais escuro embaixo
              ],
            ),
            borderRadius: BorderRadius.circular(8),
            // Border.all cria borda sólida em todos os lados
            border: Border.all(color: levelBorderMain, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          // Padding interno do container principal
          padding: const EdgeInsets.all(20),
          // Column organiza seções verticalmente
          child: Column(
            // CrossAxisAlignment.start alinha filhos à esquerda
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título principal do arquivo
              _buildFileTitle(),
              const SizedBox(height: 24),  // Espaço vertical de 24px
              
              // Post-it amarelo posicionado no topo
              _buildPostIt(),
              const SizedBox(height: 24),
              
              // Seções de informações (várias)
              _buildSection(
                'INFORMAÇÕES GERAIS',
                [
                  'Nome: Bar do Bico Torto',
                  'Tipo: Estabelecimento Comercial / Bar',
                  'Localização: Rua Sombria, Centro',
                  'Horário: 18h - 02h (apenas noturno)',
                ],
              ),
              const SizedBox(height: 20),
              
              _buildSection(
                'DESCRIÇÃO DO LOCAL',
                [
                  'Bar de aparência deteriorada no centro da cidade. Iluminação fraca, música alta e atmosfera tensa. Popular entre figuras duvidosas e criminosos. Proprietário: desconhecido.',
                ],
                isSingleParagraph: true,  // Parâmetro opcional para texto corrido
              ),
              const SizedBox(height: 20),
              
              _buildSection(
                'NPCs IMPORTANTES',
                [
                  '• Garçonete Informal - Observadora, conhece frequentadores',
                  '• Homem Misterioso - Suspeito, diálogos enigmáticos',
                  '• Jovem Ansioso - Nervoso, possível testemunha',
                  '• Mulher Silenciosa - Observadora, relutante em falar',
                ],
              ),
              const SizedBox(height: 20),
              
              _buildSection(
                'OBJETIVOS DO NÍVEL',
                [
                  '1. Interrogar NPCs e coletar informações',
                  '2. Descobrir conexões com o contrabando',
                  '3. Identificar possíveis informantes',
                  '4. Evitar confronto direto (investigação sutil)',
                ],
              ),
              const SizedBox(height: 20),
              
              _buildSection(
                'PISTAS E EVIDÊNCIAS',
                [
                  '• Conversas suspeitas sobre "carregamento"',
                  '• Mapa das docas encontrado em mesa',
                  '• Símbolos estranhos rabiscados em guardanapo',
                  '• Foto polaroid de container nas docas',
                ],
              ),
              const SizedBox(height: 20),
              
              // Caixa de alerta vermelho
              _buildDangerBox(),
              
              const SizedBox(height: 32),
              
              // Rodapé com data de atualização
              _buildFooter(),
            ],
          ),
        ),
      ],
    );
  }

  /// Constrói título do arquivo com número e data
  /// Usa Special Elite em caixa alta com espaçamento largo
  Widget _buildFileTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Número do arquivo em fonte pequena
        Text(
          'ARQUIVO #SC-N002',
          style: AppFonts.courier(
            fontSize: 9,
            color: Colors.black.withValues(alpha: 0.6),
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 4),
        // Título principal grande
        Text(
          'NÍVEL 2: BAR DO BICO TORTO',
          style: AppFonts.specialElite(
            fontSize: 20,
            color: levelInk,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        // Data de criação/atualização
        Text(
          'Data: 15/10/2024',
          style: AppFonts.courier(
            fontSize: 9,
            color: Colors.black.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  /// Constrói post-it amarelo rotacionado
  /// Usa Transform.rotate para inclinar -2 graus (efeito realista)
  Widget _buildPostIt() {
    // Transform.rotate permite rotacionar widget filho
    return Transform.rotate(
      // angle em radianos: -0.035 ≈ -2 graus
      // Negativo = rotação anti-horária
      angle: -0.035,
      child: Container(
        // Padding interno do post-it
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: levelPostit,  // Amarelo do post-it
          // Sombra para dar profundidade (post-it "colado" no papel)
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 8,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Text(
          '⚠ CUIDADO: Ambiente hostil. Não revelar identidade de investigador!',
          style: AppFonts.courier(
            fontSize: 10,
            color: Colors.black87,
            height: 1.6,  // Espaçamento entre linhas
          ),
        ),
      ),
    );
  }

  /// Constrói seção de informações com título e conteúdo
  /// @param title - Título da seção (ex: "INFORMAÇÕES GERAIS")
  /// @param content - Lista de strings com conteúdo
  /// @param isSingleParagraph - Se true, exibe como texto corrido ao invés de lista
  Widget _buildSection(String title, List<String> content, {bool isSingleParagraph = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título da seção com fundo cinza claro
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.08),
            border: const Border(
              left: BorderSide(color: levelBorderMain, width: 4),
            ),
          ),
          child: Text(
            title,
            style: AppFonts.specialElite(
              fontSize: 12,
              color: levelInk,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 12),
        
        // Container com padding para o conteúdo
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: isSingleParagraph
              // Se for parágrafo único, exibe texto corrido
              ? Text(
                  content[0],
                  style: AppFonts.courier(
                    fontSize: 11,
                    color: Colors.black87,
                    height: 1.7,  // Espaçamento entre linhas
                  ),
                )
              // Se não, exibe cada item da lista verticalmente
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // map transforma cada string em um Widget Text
                  // toList() converte Iterable em List (requerido por Column)
                  children: content.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      item,
                      style: AppFonts.courier(
                        fontSize: 11,
                        color: Colors.black87,
                        height: 1.7,
                      ),
                    ),
                  )).toList(),
                ),
        ),
      ],
    );
  }

  /// Constrói caixa de alerta de perigo (vermelho)
  /// Container com borda vermelha grossa e ícone de alerta
  Widget _buildDangerBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // Fundo vermelho muito claro
        color: levelRed.withValues(alpha: 0.1),
        // Borda vermelha sólida
        border: Border.all(color: levelRed, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ícone de aviso
          Icon(
            Icons.warning_rounded,
            color: levelRed,
            size: 20,
          ),
          const SizedBox(width: 12),
          // Expanded faz texto ocupar espaço restante (evita overflow)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ALERTA DE PERIGO',
                  style: AppFonts.courier(
                    fontSize: 10,
                    color: levelRed,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Capangas do Senhor E frequentam este estabelecimento. Evite confronto direto. Mantenha discrição máxima durante investigação.',
                  style: AppFonts.courier(
                    fontSize: 10,
                    color: Colors.black87,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Constrói rodapé com data de última atualização
  /// Texto pequeno e discreto no final do documento
  Widget _buildFooter() {
    return Center(
      child: Text(
        'Última atualização: 15/10/2024',
        style: AppFonts.courier(
          fontSize: 9,
          color: Colors.black.withValues(alpha: 0.4),
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
