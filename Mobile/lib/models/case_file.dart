/// Modelo de dados que representa um arquivo/caso individual
/// Usado para armazenar informações sobre personagens, locais, NPCs, easter eggs, etc.
/// 
/// Por que classe em vez de Map?
/// - Type safety: compilador detecta erros de tipo
/// - Autocomplete: IDE sugere campos disponíveis
/// - Documentação: campos claramente definidos
/// - Refatoração segura: renomear campo atualiza todas referências
class CaseFile {
  // ==================== CAMPOS OBRIGATÓRIOS ====================
  // final = imutável após construção (princípio de dados imutáveis)
  // required = DEVE ser fornecido no constructor
  
  /// Código único do caso (ex: "SC-CHAR-001", "SC-LOC-002")
  /// Usado como identificador em favoritos e rotas de navegação
  final String caseNumber;
  
  /// Título/nome principal do caso (ex: "Jessica Campos", "Bar do Bico Torto")
  /// Exibido em cards e cabeçalhos
  final String subject;
  
  // ==================== CAMPOS GERAIS (OPCIONAIS) ====================
  // String? = pode ser null (nem todos os casos têm todos os campos)
  // Economia de memória: só instancia campos necessários
  
  final String? type;          // Tipo de caso (ex: "Personagem", "Local")
  final String? dob;           // Data de nascimento (Date of Birth)
  final String? species;       // Espécie (ex: "Cão", "Gato", "Humano")
  final String? status;        // Status (ex: "Ativo", "Desaparecido")
  final String? location;      // Localização atual
  final String? affiliation;   // Afiliação/organização
  final String? description;   // Descrição geral
  
  // List<String>? = lista opcional de strings
  // Usado para múltiplos itens (evidências, testemunhos, anexos)
  final List<String>? evidence;     // Lista de evidências encontradas
  final List<String>? testimony;    // Lista de testemunhos coletados
  final String? filedBy;            // Quem registrou o arquivo
  final String? date;               // Data de registro
  final List<String>? attachments;  // Arquivos anexados
  
  // ==================== CAMPOS DE PERSONAGENS ====================
  // Específicos para casos do tipo "Personagem Principal"
  
  final String? photo;              // URL/path da foto do personagem
  final String? profession;         // Profissão/ocupação
  final String? personality;        // Traços de personalidade
  final String? background;         // História de fundo
  final List<String>? jessicaNotes; // Notas escritas pela Jessica
  final List<String>? connections;  // Conexões com outros personagens

  // ==================== CAMPOS DE HISTÓRIA ====================
  // Específicos para tela de "História do Jogo"
  
  // List<Map<String, String>>? = lista de objetos chave-valor
  // Cada Map representa um item com múltiplos campos
  // Ex: {"titulo": "Capítulo 1", "descricao": "...", "data": "..."}
  final List<Map<String, String>>? timeline;      // Linha do tempo de eventos
  final List<Map<String, String>>? diaryEntries;  // Entradas de diário
  final List<Map<String, String>>? documents;     // Documentos encontrados
  final List<String>? theories;                    // Teorias investigativas
  final List<String>? clues;                       // Pistas coletadas

  // ==================== CAMPOS DE LOCAIS/NÍVEIS ====================
  // Específicos para casos do tipo "Local" ou "Nível"
  
  final String? locationPhoto;          // Foto do local
  final String? sketch;                 // Esboço/croqui do local
  final String? atmosphere;             // Descrição da atmosfera
  final List<String>? findings;         // Descobertas no local
  final List<String>? relatedItems;     // Itens relacionados
  final List<String>? relatedEvents;    // Eventos relacionados
  final List<String>? relatedCharacters;// Personagens relacionados
  final List<String>? fieldNotes;       // Notas de campo

  // ==================== CAMPOS DE NPCs ====================
  // Específicos para casos do tipo "NPC" (Non-Player Character)
  
  final String? portrait;      // Retrato/foto do NPC
  final String? role;          // Papel/função no jogo
  final List<String>? quotes;  // Citações/diálogos importantes
  final String? foundAt;       // Onde pode ser encontrado
  final String? credibility;   // Nível de credibilidade (ex: "Alta", "Baixa")
  final String? behavior;      // Descrição do comportamento

  // ==================== CAMPOS DE EASTER EGGS ====================
  // Específicos para casos do tipo "Easter Egg" (segredos ocultos)
  
  final String? secretImage;           // Imagem do easter egg
  final String? secretName;            // Nome do segredo
  final String? context;               // Contexto da descoberta
  final String? meaning;               // Significado/interpretação
  final List<String>? annotations;     // Anotações investigativas

  // ==================== CAMPOS DE MAPAS ====================
  // Específicos para casos do tipo "Mapa"
  
  final String? mapImage;                            // Imagem do mapa
  final String? mapEnvironment;                      // Descrição do ambiente
  final List<String>? mapPointsOfInterest;          // Pontos de interesse
  final String? mapRelevance;                        // Relevância investigativa
  final List<Map<String, String>>? exploredLocations;// Locais já explorados
  final List<String>? routes;                        // Rotas disponíveis

  // ==================== CAMPOS DE MÚSICAS ====================
  // Específicos para casos do tipo "Música"
  
  final String? trackName;     // Nome da faixa
  final String? composition;   // Composição/compositor
  final String? heardIn;       // Onde a música é tocada no jogo

  // ==================== CAMPOS DE DESENVOLVEDORES ====================
  // Específicos para casos do tipo "Desenvolvedor" (créditos)
  
  final String? devRole;                  // Cargo/função no desenvolvimento
  final String? devArea;                  // Área de atuação
  final List<String>? devSpecialties;     // Especialidades técnicas
  final String? devContribution;          // Contribuição principal

  // ==================== CONSTRUCTOR ====================
  // Constructor nomeado com parâmetros opcionais nomeados
  // Por que usar {} nos parâmetros?
  // - Parâmetros nomeados (melhor legibilidade)
  // - Ordem não importa ao instanciar
  // - Campos opcionais podem ser omitidos
  //
  // Exemplo de uso:
  // CaseFile(
  //   caseNumber: "SC-CHAR-001",
  //   subject: "Jessica Campos",
  //   species: "Cão",
  //   photo: "assets/images/jessica.png",
  // )
  CaseFile({
    // required = campo obrigatório (gera erro se não fornecido)
    required this.caseNumber,
    required this.subject,
    
    // this.campo = atalho que atribui parâmetro ao campo automaticamente
    // Equivale a: String? type; this.type = type;
    this.type,
    this.dob,
    this.species,
    this.status,
    this.location,
    this.affiliation,
    this.description,
    this.evidence,
    this.testimony,
    this.filedBy,
    this.date,
    this.attachments,
    this.photo,
    this.profession,
    this.personality,
    this.background,
    this.jessicaNotes,
    this.connections,
    this.timeline,
    this.diaryEntries,
    this.documents,
    this.theories,
    this.clues,
    this.locationPhoto,
    this.sketch,
    this.atmosphere,
    this.findings,
    this.relatedItems,
    this.relatedEvents,
    this.relatedCharacters,
    this.fieldNotes,
    this.portrait,
    this.role,
    this.quotes,
    this.foundAt,
    this.credibility,
    this.behavior,
    this.secretImage,
    this.secretName,
    this.context,
    this.meaning,
    this.annotations,
    this.mapImage,
    this.mapEnvironment,
    this.mapPointsOfInterest,
    this.mapRelevance,
    this.exploredLocations,
    this.routes,
    this.trackName,
    this.composition,
    this.heardIn,
    this.devRole,
    this.devArea,
    this.devSpecialties,
    this.devContribution,
  });
}
