import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

/// Função principal que inicia o aplicativo Flutter
/// É o primeiro método executado quando o app é aberto
/// runApp() infla o widget raiz e o anexa à tela
void main() {
  // const permite que o Flutter reutilize a instância em vez de recriar
  runApp(const SnoutsCaseApp());
}

/// Widget raiz do aplicativo Snout's Case Wiki
/// StatelessWidget porque a configuração do MaterialApp não muda
/// Todas as mudanças de estado acontecem nas telas filhas
class SnoutsCaseApp extends StatelessWidget {
  // Constructor const permite otimizações do compilador
  // Key? é opcional e permite identificar widget na árvore
  const SnoutsCaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp é widget raiz que fornece:
    // - Navigator para navegação entre telas
    // - Theme para estilização global
    // - MediaQuery para informações de dispositivo
    // - Localizations para i18n
    return MaterialApp(
      // Título exibido na barra de tarefas (Android) ou app switcher
      title: "Snout's Case Wiki",
      
      // Remove banner "DEBUG" do canto superior direito
      // Útil para screenshots e apresentações
      debugShowCheckedModeBanner: false,
      
      // Tema global do app definido em app_theme.dart
      // Contém cores, fontes e estilos padrão
      theme: AppTheme.theme,
      
      // Tela inicial que será exibida ao abrir o app
      // const HomeScreen() será a primeira rota da pilha de navegação
      home: const HomeScreen(),
    );
  }
}
