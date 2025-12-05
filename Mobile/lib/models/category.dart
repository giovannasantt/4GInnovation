import 'package:flutter/material.dart';
import 'case_file.dart';

/// Modelo de dados que representa uma categoria/pasta de casos
/// Agrupa casos relacionados por tema (Personagens, Locais, NPCs, etc.)
/// 
/// Por que usar classe ao invés de Map?
/// - Type safety: IconData e Color são tipados (previne erros)
/// - IDE support: autocomplete mostra campos disponíveis
/// - Organização: estrutura clara e documentada
class Category {
  // ==================== CAMPOS ====================
  // Todos os campos são final (imutáveis) e required (obrigatórios)
  // Imutabilidade facilita debugging e previne bugs de estado
  
  /// Identificador único da categoria (usado em lógica/rotas)
  /// Exemplo: "personagens", "locais", "npcs", "historia"
  /// Usado para navegação condicional (if category.id == 'historia')
  final String id;
  
  /// Título exibido na UI (pode ter acentos e espaços)
  /// Exemplo: "Personagens", "Níveis", "Easter Eggs"
  /// Exibido em cards de pasta e cabeçalhos de tela
  final String title;
  
  /// Ícone representativo da categoria (do conjunto Material Icons)
  /// IconData é tipo do Flutter que representa ícones
  /// Exemplo: Icons.person, Icons.location_on, Icons.music_note
  final IconData icon;
  
  /// Cor temática da categoria (usada em bordas, backgrounds, etc)
  /// Color é tipo do Flutter (ex: Color(0xFFFF5722))
  /// Cada categoria tem cor única para diferenciação visual
  final Color color;
  
  /// Lista de casos/arquivos pertencentes a esta categoria
  /// List<CaseFile> permite iterar, filtrar e exibir casos
  /// Exemplo: categoria "Personagens" contém [Jessica, Senhor E, ...]
  final List<CaseFile> cases;

  // ==================== CONSTRUCTOR ====================
  /// Constructor com parâmetros nomeados obrigatórios
  /// required garante que todos os campos sejam fornecidos
  /// 
  /// Exemplo de uso:
  /// ```dart
  /// Category(
  ///   id: 'personagens',
  ///   title: 'Personagens',
  ///   icon: Icons.person,
  ///   color: Color(0xFFFF5722),
  ///   cases: [jessica, senhorE],
  /// )
  /// ```
  Category({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
    required this.cases,
  });
}
