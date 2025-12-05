import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Classe utilitária para fontes personalizadas do aplicativo
/// Fornece métodos estáticos que retornam TextStyle pré-configurados
/// 
/// Por que usar factory methods em vez de TextStyle direto?
/// - Centralização: um único lugar para mudança de fonte
/// - Consistência: garante uso correto das fontes do design system
/// - Flexibilidade: permite customização via parâmetros nomeados
/// - Manutenibilidade: fácil trocar fonte globalmente
/// 
/// GOOGLE_FONTS package:
/// - Baixa fontes automaticamente (não precisa adicionar assets)
/// - Cache local após primeiro uso
/// - Suporte a todas as fontes do Google Fonts
/// - Fallback automático se download falhar
/// 
/// FONTES DO DESIGN (matching React CSS):
/// - Courier Prime: máquina de escrever (labels, códigos)
/// - Special Elite: títulos investigativos (cabeçalhos)
/// - Kalam: manuscrita (post-its, anotações)
/// - Libre Baskerville: serif clássica (corpo de texto)
/// - IBM Plex Sans/Mono: moderna (UI técnica)
class AppFonts {
  // ==================== COURIER PRIME ====================
  /// Fonte tipo máquina de escrever (monospace)
  /// Evoca estética de arquivos datilografados
  /// 
  /// Uso típico:
  /// - Labels de formulário ("CASO N°", "SUJEITO:")
  /// - Códigos e identificadores
  /// - Textos de campo de busca
  /// - Datas e timestamps
  /// 
  /// @param fontSize - Tamanho da fonte em pixels (padrão: 14)
  /// @param color - Cor do texto (padrão: herda do theme)
  /// @param fontWeight - Peso da fonte (normal, bold, etc)
  /// @param height - Line height (espaçamento entre linhas)
  /// @param letterSpacing - Espaçamento entre caracteres
  /// @param fontStyle - Estilo (normal, italic)
  /// @return TextStyle configurado com Courier Prime
  static TextStyle courier({
    double fontSize = 14,
    Color? color,
    FontWeight? fontWeight,
    double? height,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) {
    // GoogleFonts.courierPrime() retorna TextStyle com fonte baixada
    // Se download falhar, usa fallback monospace do sistema
    return GoogleFonts.courierPrime(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  // ==================== SPECIAL ELITE ====================
  /// Fonte investigativa com estética de selo/carimbo
  /// Usada em títulos e elementos de destaque
  /// 
  /// Uso típico:
  /// - Logo "SNOUT'S CASE"
  /// - Títulos de seções ("INFORMAÇÕES GERAIS", "PISTAS")
  /// - Nomes de casos/personagens
  /// - Cabeçalhos de categoria
  /// 
  /// NOTA: Special Elite funciona melhor em CAIXA ALTA
  /// letterSpacing alto (2.0-3.0) melhora legibilidade
  static TextStyle specialElite({
    double fontSize = 14,
    Color? color,
    FontWeight? fontWeight,
    double? height,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) {
    return GoogleFonts.specialElite(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  // ==================== KALAM (MANUSCRITA) ====================
  /// Fonte que simula escrita à mão
  /// Adiciona toque pessoal e humaniza a interface
  /// 
  /// Uso típico:
  /// - Post-its amarelos com avisos
  /// - Anotações pessoais de Jessica
  /// - Comentários marginais
  /// - Elementos que parecem escritos manualmente
  /// 
  /// DICA: Combinar com Transform.rotate() para efeito realista
  static TextStyle kalam({
    double fontSize = 14,
    Color? color,
    FontWeight? fontWeight,
    double? height,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) {
    return GoogleFonts.kalam(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  // ==================== HANDWRITING (ALIAS) ====================
  /// Alias semântico para kalam()
  /// Mesmo resultado, nome mais descritivo em alguns contextos
  /// 
  /// Ex: AppFonts.handwriting() pode ser mais claro que AppFonts.kalam()
  /// quando lido por desenvolvedores não familiarizados com nome da fonte
  static TextStyle handwriting({
    double fontSize = 14,
    Color? color,
    FontWeight? fontWeight,
    double? height,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) {
    // Chama método kalam() com mesmos parâmetros
    // Evita duplicação de código
    return kalam(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  // ==================== GEORGIA (SERIF) ====================
  /// Fonte serif clássica para corpo de texto
  /// 
  /// NOTA IMPORTANTE: Georgia não está disponível no Google Fonts
  /// Solução: usar Libre Baskerville (serif similar)
  /// 
  /// Uso típico:
  /// - Corpo de texto longo (descrições, histórias)
  /// - Parágrafos narrativos
  /// - Conteúdo de leitura extensa
  /// 
  /// Serif fonts melhoram legibilidade em textos longos
  static TextStyle georgia({
    double fontSize = 16,  // Padrão maior (corpo de texto)
    Color? color,
    FontWeight? fontWeight,
    double? height,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) {
    // Libre Baskerville = substituto de Georgia
    // Características similares: serif clássica, elegante, legível
    return GoogleFonts.libreBaskerville(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  // ==================== IBM PLEX SANS ====================
  /// Fonte sans-serif moderna e técnica
  /// Contrasta com fontes vintage (courier, special elite)
  /// 
  /// Uso típico:
  /// - Elementos de UI moderna
  /// - Botões e controles
  /// - Interfaces técnicas
  /// - Dados estruturados
  /// 
  /// Sans-serif funciona bem em tamanhos pequenos
  static TextStyle ibmPlexSans({
    double fontSize = 14,
    Color? color,
    FontWeight? fontWeight,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.ibmPlexSans(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // ==================== IBM PLEX MONO ====================
  /// Fonte monospace moderna (alternativa a Courier Prime)
  /// Caracteres alinhados verticalmente
  /// 
  /// Uso típico:
  /// - Código / snippets
  /// - Dados tabulares
  /// - IDs e códigos técnicos
  /// - Logs e timestamps
  /// 
  /// Monospace garante alinhamento perfeito em colunas
  static TextStyle ibmPlexMono({
    double fontSize = 14,
    Color? color,
    FontWeight? fontWeight,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.ibmPlexMono(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // ==================== TIMES NEW ROMAN ====================
  /// Fonte serif clássica mais formal
  /// 
  /// NOTA IMPORTANTE: Times New Roman não está no Google Fonts
  /// Solução: usar Libre Baskerville (serif similar)
  /// 
  /// Uso típico:
  /// - Documentos formais
  /// - Relatórios oficiais
  /// - Texto acadêmico/profissional
  /// 
  /// Similar a georgia() mas com contexto diferente
  static TextStyle timesNewRoman({
    double fontSize = 16,
    Color? color,
    FontWeight? fontWeight,
    double? height,
    double? letterSpacing,
  }) {
    // Mesmo substituto que georgia (Libre Baskerville)
    // Ambas são serif clássicas com características similares
    return GoogleFonts.libreBaskerville(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
  
  // PADRÃO DE USO:
  // Text(
  //   "CASO #001",
  //   style: AppFonts.courier(
  //     fontSize: 12,
  //     color: Colors.black87,
  //     fontWeight: FontWeight.bold,
  //     letterSpacing: 1.5,
  //   ),
  // )
}
