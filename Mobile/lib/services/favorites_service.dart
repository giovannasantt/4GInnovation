import 'package:flutter/material.dart';

/// Serviço singleton para gerenciar favoritos globalmente
/// 
/// PATTERN: Singleton (apenas uma instância existe na aplicação)
/// Por quê? Favoritos devem ser compartilhados entre todas as telas
/// Se cada tela criasse seu próprio serviço, teriam dados desconectados
/// 
/// REATIVIDADE: Usa ValueNotifier para notificar mudanças
/// Widgets podem "escutar" mudanças e reconstruir automaticamente
/// Mais eficiente que setState global ou passar callbacks por toda árvore
class FavoritesService {
  // ==================== SINGLETON PATTERN ====================
  
  /// Instância única (privada) do serviço
  /// static = compartilhada por todas as instâncias da classe
  /// final = não pode ser reatribuída após inicialização
  /// _instance = privado (underscore) - só acessível dentro desta classe
  static final FavoritesService _instance = FavoritesService._internal();
  
  /// Factory constructor - retorna sempre a MESMA instância
  /// Quando você chama FavoritesService(), sempre recebe _instance
  /// 
  /// Diferença de constructor normal:
  /// - Normal: cria nova instância toda vez
  /// - Factory: pode retornar instância existente
  factory FavoritesService() => _instance;
  
  /// Constructor privado (impede instanciação externa)
  /// Underscore = privado - só pode ser chamado dentro desta classe
  /// Garante que ninguém crie FavoritesService() diretamente
  FavoritesService._internal();

  // ==================== ESTADO REATIVO ====================
  
  /// ValueNotifier notifica listeners quando valor muda
  /// Set<String> armazena IDs únicos de casos favoritos
  /// 
  /// Por que Set em vez de List?
  /// - Set não permite duplicatas (cada caso só pode ser favorito uma vez)
  /// - contains() é O(1) em Set vs O(n) em List (muito mais rápido)
  /// - add() automaticamente ignora duplicatas
  /// 
  /// ValueNotifier<Set<String>> vs ValueNotifier<List<String>>:
  /// - ValueNotifier detecta mudanças quando você faz .value = novoSet
  /// - Apenas modificar Set interno (add/remove) NÃO notifica
  /// - Por isso recriamos Set toda vez em toggleFavorite()
  final ValueNotifier<Set<String>> favoriteIds = ValueNotifier({});

  // ==================== MÉTODOS PÚBLICOS ====================
  
  /// Alterna estado de favorito (toggle)
  /// Se caso já está favoritado → remove
  /// Se caso não está favoritado → adiciona
  /// 
  /// @param caseNumber - ID único do caso (ex: "SC-CHAR-001")
  void toggleFavorite(String caseNumber) {
    // Set<String>.from() cria NOVO Set copiando valores do atual
    // Por que criar novo Set em vez de modificar o existente?
    // - ValueNotifier só notifica quando .value é REATRIBUÍDO
    // - Modificar Set interno (current.add) não dispara notificação
    // - Criar novo Set e atribuir a .value garante que listeners sejam notificados
    final current = Set<String>.from(favoriteIds.value);
    
    // contains() verifica se caseNumber existe no Set (O(1) - muito rápido)
    if (current.contains(caseNumber)) {
      // remove() tira elemento do Set
      current.remove(caseNumber);
    } else {
      // add() adiciona elemento ao Set (ignora se já existir)
      current.add(caseNumber);
    }
    
    // Atribui novo Set ao ValueNotifier
    // Isso dispara notificação para TODOS os ValueListenableBuilder escutando
    // Widgets subscr escritos reconstruem automaticamente
    favoriteIds.value = current;
  }

  /// Verifica se um caso está marcado como favorito
  /// Usado para exibir ícone de estrela preenchida/vazia
  /// 
  /// @param caseNumber - ID único do caso
  /// @return true se está nos favoritos, false caso contrário
  bool isFavorite(String caseNumber) {
    // contains() retorna bool (true/false)
    // O(1) complexity (busca instantânea em Set)
    return favoriteIds.value.contains(caseNumber);
  }
  
  // NOTA: Favoritos são armazenados apenas em memória (RAM)
  // Ao fechar o app, favoritos são perdidos
  // Para persistir, seria necessário:
  // - SharedPreferences (armazenamento local key-value)
  // - SQLite (banco de dados local)
  // - Hive (banco NoSQL local)
}
