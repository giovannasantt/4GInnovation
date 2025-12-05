import 'package:flutter/material.dart';

/// Configuração global do tema visual do aplicativo
/// Define cores, fontes e estilos aplicados em toda a aplicação
/// 
/// Por que usar classe static em vez de const?
/// - Permite criar Theme complexo com métodos
/// - Centraliza configuração (fácil manutenção)
/// - Um único ponto de verdade para estilo
/// 
/// PATTERN: Theme Provider (fornecedor de tema)
/// MaterialApp recebe theme e aplica globalmente
class AppTheme {
  // ==================== PALETA DE CORES ====================
  // static const = constantes de classe (acessíveis sem instanciar)
  // const = valor conhecido em compile-time (otimização)
  
  /// Cor de fundo principal (preto quase total)
  /// Usado em Scaffold.backgroundColor
  static const Color backgroundDark = Color(0xFF121212);
  
  /// Cor de superfície (cards, containers)
  /// Cinza escuro levemente mais claro que background
  static const Color surfaceDark = Color(0xFF1E1E1E);
  
  /// Cor de texto principal (branco suave)
  /// Menos agressivo que branco puro (#FFFFFF)
  static const Color textLight = Color(0xFFE0E0E0);
  
  /// Cor de texto secundário (cinza médio)
  /// Usado para labels, subtítulos, textos menos importantes
  static const Color textDim = Color(0xFFAAAAAA);
  
  /// Cor de destaque/acento (dourado)
  /// Usado para elementos importantes, botões, títulos
  static const Color accentGold = Color(0xFFD6B877);
  
  // ==================== THEME DATA ====================
  /// Getter que retorna ThemeData configurado
  /// get = propriedade computada (chamado como AppTheme.theme, não AppTheme.theme())
  /// 
  /// ThemeData = objeto Flutter que configura aparência global
  /// Contém centenas de propriedades (cores, fontes, estilos, etc)
  static ThemeData get theme {
    return ThemeData(
      // ===== CONFIGURAÇÕES GERAIS =====
      
      /// brightness define se tema é claro ou escuro
      /// Brightness.dark faz Flutter ajustar automaticamente:
      /// - StatusBar (barra superior) fica escura
      /// - Alguns widgets adaptam cores
      brightness: Brightness.dark,
      
      /// Cor de fundo padrão de todos os Scaffold
      /// Scaffold = estrutura básica de tela (AppBar + Body + Bottom)
      /// Sem definir em cada Scaffold, usa esta cor
      scaffoldBackgroundColor: backgroundDark,
      
      /// Cor primária do app (usada em vários componentes)
      /// Ex: AppBar padrão, ProgressIndicator, etc
      primaryColor: backgroundDark,
      
      /// Fonte padrão aplicada globalmente
      /// Todos os Text sem fontFamily explícito usam esta
      fontFamily: 'Courier Prime',  // Fonte monospace investigativa
      
      // ===== COLOR SCHEME =====
      /// ColorScheme é sistema de cores do Material Design 3
      /// Define cores semânticas (primary, secondary, surface, error, etc)
      /// Widgets Material automaticamente usam cores apropriadas
      colorScheme: const ColorScheme.dark(
        primary: accentGold,      // Cor primária (botões, destaques)
        surface: surfaceDark,      // Cor de superfície (cards)
        onSurface: textLight,      // Cor de texto sobre surface
      ),

      // ===== APP BAR THEME =====
      /// AppBarTheme configura aparência de todas as AppBar do app
      /// Sem isso, cada AppBar precisaria definir cores manualmente
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundDark,  // Fundo escuro
        foregroundColor: textLight,       // Cor de texto/ícones
        elevation: 0,                     // Sem sombra (flat design)
        centerTitle: true,                // Título centralizado
      ),

      // ===== TEXT THEME =====
      /// TextTheme define estilos de texto pré-configurados
      /// Widgets Material usam automaticamente (ex: ListTile.title usa bodyLarge)
      /// 
      /// Hierarquia Material Design 3:
      /// - displayLarge/Medium/Small = Títulos muito grandes
      /// - headlineLarge/Medium/Small = Títulos de seções
      /// - titleLarge/Medium/Small = Títulos de cards/dialogs
      /// - bodyLarge/Medium/Small = Texto de corpo/conteúdo
      /// - labelLarge/Medium/Small = Labels de botões/campos
      textTheme: const TextTheme(
        // displayLarge = Títulos principais (ex: logo, tela de boas-vindas)
        displayLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: accentGold,        // Dourado para destaque
          letterSpacing: 1.5,       // Espaçamento largo (estilo título)
        ),
        
        // displayMedium = Subtítulos importantes
        displayMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: textLight,
          letterSpacing: 1.0,
        ),
        
        // bodyLarge = Texto de corpo principal (parágrafos)
        bodyLarge: TextStyle(
          fontSize: 16,
          color: textLight,
          height: 1.6,  // Line height (espaçamento entre linhas)
        ),
        
        // bodyMedium = Texto de corpo secundário (descrições, subtextos)
        bodyMedium: TextStyle(
          fontSize: 14,
          color: textDim,   // Cinza médio (menos destaque)
          height: 1.5,
        ),
      ),
      
      // NOTA: ThemeData tem MUITAS outras propriedades não definidas aqui:
      // - buttonTheme (estilos de botões)
      // - iconTheme (estilos de ícones)
      // - inputDecorationTheme (estilos de TextField)
      // - cardTheme (estilos de Card)
      // - etc...
      // 
      // Propriedades não definidas usam valores padrão do Flutter
      // baseados em brightness e colorScheme
    );
  }
  
  // NOTA: Este tema não é usado diretamente pelas telas customizadas
  // As telas usam cores específicas hardcoded (Color(0xFF...))
  // Este theme serve como fallback e para widgets Material padrão
}
