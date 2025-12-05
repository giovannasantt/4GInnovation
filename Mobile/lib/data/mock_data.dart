import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/case_file.dart';

/// Função que retorna lista de categorias mockadas com todos os casos do jogo
/// 
/// MOCK DATA (Dados Simulados):
/// - Usado durante desenvolvimento e para demonstração
/// - Substitui backend/API real (que não existe neste projeto)
/// - Em produção real, viria de banco de dados ou API REST
/// 
/// ESTRUTURA:
/// - List<Category> = lista de categorias (Personagens, Locais, NPCs, etc)
/// - Cada Category contém List<CaseFile> (casos dessa categoria)
/// - Dados organizados hierarquicamente: Categorias → Casos
/// 
/// POR QUE FUNÇÃO EM VEZ DE CONST?
/// - Permite modificação futura (ex: filtros, ordenação)
/// - Pode ser estendida para carregar dados de arquivo JSON
/// - Flexibilidade para adicionar lógica (ex: localização)
/// 
/// TOTAL DE DADOS:
/// - ~9 categorias
/// - ~27 casos totais
/// - Cada caso tem 10-20 campos opcionais
/// 
/// @return List<Category> com todas as categorias e casos mockados
List<Category> getMockCategories() {
  // return = retorna lista de Category construídas inline
  // [] = array/lista literal (similar a [...] em JavaScript)
  return [
    // ==================== CATEGORIA: PERSONAGENS PRINCIPAIS ====================
    // Category() cria nova instância com parâmetros nomeados
    Category(
      id: "personagens",  // ID único usado em lógica (ex: if category.id == 'personagens')
      title: "Personagens",  // Título exibido na UI
      icon: Icons.people_outline,  // Ícone Material Design
      color: const Color(0xFF8B4545),  // Cor da pasta (vermelho tijolo)
      
      // cases = lista de CaseFile (casos desta categoria)
      cases: [
        // ===== CASO 1: JESSICA CAMPOS (PROTAGONISTA) =====
        // CaseFile() com dezenas de parâmetros opcionais
        CaseFile(
          caseNumber: "SC-CHAR-001",  // Código único (SC = Snout's Case, CHAR = Character)
          subject: "Jessica Campos",  // Nome do caso
          type: "character",  // Tipo genérico
          dob: "24/07/2001",  // Date of Birth
          
          // photo = URL do Unsplash (imagem externa)
          // Em produção, seria URL de CDN ou caminho local (assets/)
          photo: "https://images.unsplash.com/photo-1671875579704-48f4bdc31699?w=1080",
          
          species: "Humana",  // Espécie (humano/animal)
          status: "ATIVO",  // Status atual
          location: "Região urbana próxima ao escritório",
          affiliation: "Detetive Particular",
          
          // description = string multi-linha (usa aspas triplas ou \n)
          // Texto longo formatado com parágrafos
          description:
            "Jessica Moreau é uma detetive particular experiente, conhecida por resolver casos complexos envolvendo fenômenos paranormais. Chegou a Snout's Case em 2024 após receber uma carta anônima sobre os desaparecimentos misteriosos.\\n\\nSua especialidade inclui investigações forenses e análise de padrões. Possui um histórico de cinco anos trabalhando em casos não solucionados pela polícia convencional.",
          
          // evidence = List<String> (array de strings)
          // Cada item é uma evidência relacionada ao caso
          evidence: [
            "Carta anônima datada de 10/10/2024",
            "Licença de investigador particular válida",
            "Equipamento de gravação de áudio especializado",
            "Diário de investigação com anotações sobre os Ecos",
          ],
          
          // testimony = citações/testemunhos (strings com aspas escapadas)
          // ' dentro de ' precisa ser escapado como \'
          testimony: [
            '\"Há algo errado com esta cidade. Os sons... eles não são naturais.\"',
            '\"Encontrei padrões nos desaparecimentos que a polícia ignorou.\"',
          ],
          
          filedBy: "Dep. Arthur Hale",  // Quem registrou o arquivo
          date: "25/10/2024",
        ),
        
        // ===== CASO 2: SENHOR E (ANTAGONISTA/MISTERIOSO) =====
        CaseFile(
          caseNumber: "SC-CHAR-002",
          subject: "Senhor E",
          type: "character",
          dob: "Desconhecido",  // Informação não disponível
          species: "Humano",
          status: "SUSPEITO",  // Status diferente = código de cor diferente
          location: "Não localizado",
          affiliation: "Informante / Possível envolvido",
          
          // String com aspas simples (não precisa escapar " dentro de '')
          // Usando sintaxe normal sem escapes
          description: 'O autoproclamado "Senhor E" é a figura mais enigmática do caso. Contratou Jessica Campos por S\$ 4.000 para investigar o desaparecimento de animais. Sua identidade permanece desconhecida.',
          
          evidence: [
            "Gravações de chamadas telefônicas",
            "Registros de transferência bancária",
          ],
          
          filedBy: "Jessica Campos",
          date: "Início da investigação",
          photo: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=400",
        ),
      ],
    ),
    
    // ==================== CATEGORIA: HISTÓRIA DO JOGO ====================
    Category(
      id: "historia",
      title: "História",
      icon: Icons.menu_book_outlined,
      color: const Color(0xFF6B7C45),
      cases: [
        CaseFile(
          caseNumber: "SC-HIST-001",
          subject: "Incidente de Snout's Case",
          dob: "N/A",
          species: "Evento",
          status: "ARQUIVADO",
          location: "Snout's Case - Múltiplas Localizações",
          affiliation: "Histórico Municipal",
          description:
            'Na noite de 31 de outubro de 1987, vinte e três pessoas desapareceram simultaneamente em Snout\'s Case. O evento ficou conhecido como "Incidente de Snout\'s Case".\n\nTestemunhas reportaram sons estranhos, luzes inexplicáveis e uma sensação de desorientação. As investigações nunca foram conclusivas, e o caso permanece oficialmente não solucionado.\n\nEste evento marca o primeiro registro documentado dos "Ecos" - fenômeno paranormal de sons e vozes que parecem vir de outra dimensão.',
          evidence: [
            "Relatórios policiais de 23 desaparecimentos simultâneos",
            "Gravações de áudio com interferências anômalas",
            "Testemunhos de 47 residentes",
          ],
          filedBy: "Delegacia Central",
          date: "01/11/1987",
        ),
        CaseFile(
          caseNumber: "SC-HIST-002",
          subject: "Fundação da 4GInnovation",
          dob: "N/A",
          species: "Evento Corporativo",
          status: "RESOLVIDO",
          location: "Snout's Case - Zona Industrial",
          affiliation: "4GInnovation Corp.",
          description:
            "A 4GInnovation foi fundada em 1995 por um grupo de cientistas e investidores anônimos. Oficialmente, a empresa desenvolve tecnologias de interface neural.\n\nExistem suspeitas de que a fundação está diretamente relacionada ao Incidente de 1987.",
          evidence: [
            "Documentos de incorporação datados de 15/03/1995",
            "Lista de acionistas majoritários (redacted)",
          ],
          filedBy: "Agente Kade Rossi",
          date: "18/10/2024",
        ),
      ],
    ),
    // ==================== CATEGORIA: NÍVEIS DE INVESTIGAÇÃO ====================
    Category(
      id: "niveis",
      title: "Níveis",
      icon: Icons.map_outlined,
      color: const Color(0xFF7C6B45),
      cases: [
        CaseFile(
          caseNumber: "SC-LOC-001",
          subject: "Rua Principal de São Domingues",
          type: "location",
          status: "COMPLETO",
          description: "Nível introdutório focado em diálogo e coleta de informações iniciais.",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
        ),
        CaseFile(
          caseNumber: "SC-LOC-002",
          subject: "Bar do Bico Torto",
          type: "location",
          status: "COMPLETO",
          description: "O bar é o ponto central de fofocas e informações do submundo.",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
        ),
        CaseFile(
          caseNumber: "SC-LOC-003",
          subject: "Docas do Petshop (Noite)",
          type: "location",
          status: "EM ANDAMENTO",
          description: "Infiltração furtiva nas docas durante a noite.",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
        ),
        CaseFile(
          caseNumber: "SC-LOC-004",
          subject: "Galpão dos Contrabandistas",
          type: "location",
          status: "PENDENTE",
          description: "Investigação da operação de contrabando de animais.",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
        ),
        CaseFile(
          caseNumber: "SC-LOC-005",
          subject: "Laboratório Oculto",
          type: "location",
          status: "CONFIDENCIAL",
          description: "O nível final. Laboratório secreto onde ocorrem experimentos genéticos.",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
        ),
      ],
    ),
    // ==================== CATEGORIA: NPCs (PERSONAGENS NÃO JOGÁVEIS) ====================
    Category(
      id: "npcs",
      title: "NPCs",
      icon: Icons.account_circle_outlined,
      color: const Color(0xFF45638B),
      cases: [
        CaseFile(
          caseNumber: "SC-NPC-001",
          subject: "Capangas",
          type: "npc",
          status: "AMEAÇA",
          foundAt: "Petshop, Galpão, Laboratório",
          role: "Segurança e controle das instalações clandestinas",
          description: "Capangas atuam como a linha de frente da segurança nas instalações ligadas ao Petshop Snout. Mantêm o controle das áreas internas, afastam curiosos e acompanham movimentações suspeitas.",
          behavior: "Roupas escuras e discretas, jaquetas táticas leves. Postura rígida e movimentos calculados.",
          credibility: "Alto risco - patrulham áreas sensíveis",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
          photo: "https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?w=400",
        ),
        CaseFile(
          caseNumber: "SC-NPC-002",
          subject: "Funcionários",
          type: "npc",
          status: "OBSERVAÇÃO",
          foundAt: "Petshop",
          role: "Manter fachada de normalidade do estabelecimento",
          description: "Funcionários treinados para manter a fachada de normalidade do Petshop. Trabalham com eficiência exagerada, como se seguissem instruções rígidas.",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
          photo: "https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=400",
        ),
        CaseFile(
          caseNumber: "SC-NPC-003",
          subject: "Cientistas",
          type: "npc",
          status: "SUSPEITO",
          foundAt: "Galpão e Laboratório",
          role: "Processos técnicos e experimentais",
          description: "Profissionais que cuidam dos processos técnicos e experimentais. Não interagem com o mundo exterior sem permissão e raramente demonstram emoção.",
          behavior: "Jalecos brancos sobre roupas simples. Luvas descartáveis e óculos de proteção.",
          credibility: "Alto risco - envolvidos diretamente nos experimentos",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
        ),
        CaseFile(
          caseNumber: "SC-NPC-004",
          subject: "Contrabandistas",
          type: "npc",
          status: "PERICULOSO",
          foundAt: "Galpão",
          role: "Transporte ilegal de produtos e animais",
          description: "Indivíduos responsáveis pelo transporte ilegal de produtos e animais para as operações clandestinas.",
          behavior: "Roupas casuais gastas, jeans velhos, coturnos. Tatuagens, cicatrizes e aparência descuidada.",
          credibility: "Extremo risco - envolvidos diretamente no crime",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
        ),
        CaseFile(
          caseNumber: "SC-NPC-005",
          subject: "Civis",
          type: "npc",
          status: "NEUTRO",
          foundAt: "Ruas, Bar, Livraria",
          role: "Ambientação urbana",
          description: "Civis compõem o ambiente urbano da cidade. Alguns ignoram os acontecimentos; outros percebem mais do que deveriam.",
          behavior: "Roupas casuais variadas. Caminham naturalmente, conversam, olham vitrines.",
          credibility: "Sem risco - testemunhas em potencial",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
          photo: "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=400",
        ),
        CaseFile(
          caseNumber: "SC-NPC-006",
          subject: "Homem Misterioso",
          type: "npc",
          status: "INTERAGÍVEL",
          foundAt: "Bar",
          role: "Informante potencial",
          description: "Frequentador reservado do bar local. Observa tudo em silêncio, como se estivesse sempre interpretando a cena ao redor.",
          behavior: "Jaqueta escura, jeans gastos, boné virado para trás. Barba por fazer, olhar desconfiado.",
          credibility: "Médio - informações indiretas e pistas obscuras",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
          photo: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400",
        ),
        CaseFile(
          caseNumber: "SC-NPC-007",
          subject: "Garçonete Informal",
          type: "npc",
          status: "INTERAGÍVEL",
          foundAt: "Bar",
          role: "Observadora do ambiente",
          description: "Tem acesso a conversas, rostos e horários. Observadora experiente, nota mais do que aparenta.",
          behavior: "Uniforme preto, avental vermelho. Cabelo preso em coque. Sorriso simpático, olhar atento.",
          credibility: "Alto - acesso a informações privilegiadas",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
          photo: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400",
        ),
        CaseFile(
          caseNumber: "SC-NPC-008",
          subject: "Jovem Ansioso",
          type: "npc",
          status: "INTERAGÍVEL",
          foundAt: "Bar",
          role: "Testemunha nervosa",
          description: "Parece saber algo, mas o nervosismo constante o faz se contradizer. Tenta ajudar, porém teme as consequências.",
          behavior: "Moletom com capuz, mochila, óculos redondos. Mexe no celular o tempo todo.",
          credibility: "Baixo - pistas incompletas mas potencialmente importantes",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
          photo: "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=400",
        ),
        CaseFile(
          caseNumber: "SC-NPC-009",
          subject: "Mulher Silenciosa",
          type: "npc",
          status: "FIGURANTE",
          foundAt: "Bar",
          role: "Ambientação",
          description: "Figura reservada que observa o salão em silêncio. Às vezes sussurra algo no celular.",
          behavior: "Sempre sozinha em uma mesa do canto. Roupa escura e discreta.",
          credibility: "Desconhecido - observadora misteriosa",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
        ),
        CaseFile(
          caseNumber: "SC-NPC-010",
          subject: "Homem Solitário",
          type: "npc",
          status: "FIGURANTE",
          foundAt: "Bar",
          role: "Ambientação",
          description: "Homem introspectivo, sempre com uma cerveja e um cigarro apagado. Parece desligado, mas percebe tudo.",
          behavior: "Sentado sempre no mesmo banco próximo ao balcão. Olhar distante, mas ouve todas as conversas ao redor.",
          credibility: "Baixo - detalhes narrativos menores",
          filedBy: "Jessica Campos",
          date: "15/11/2025",
        ),
      ],
    ),
    // ==================== CATEGORIA: EASTER EGGS ====================
    Category(
      id: "easter-eggs",
      title: "Easter Eggs",
      icon: Icons.auto_awesome_outlined,
      color: const Color(0xFF8B5A8B),
      cases: [
        CaseFile(
          caseNumber: "SC-EE-001",
          subject: "Relógio Quebrado",
          dob: "N/A",
          species: "Objeto Recorrente",
          status: "CATALOGADO",
          location: "Múltiplas Localizações",
          description: "Em diversos locais-chave da investigação, há relógios parados exatamente às 3:33 AM. Esta é a hora em que os Ecos são mais intensos.",
          filedBy: "Jessica Campos",
          date: "31/10/2024",
        ),
        CaseFile(
          caseNumber: "SC-EE-002",
          subject: "Mensagens Ocultas",
          dob: "N/A",
          species: "Código Cifrado",
          status: "CATALOGADO",
          location: "Diálogos dos NPCs",
          description: "Mensagens codificadas escondidas nos diálogos de personagens-chave. Quando decifradas, revelam coordenadas e pistas sobre o paradeiro dos desaparecidos.",
          filedBy: "Jessica Campos",
          date: "09/11/2024",
        ),
        CaseFile(
          caseNumber: "SC-EE-003",
          subject: "Símbolo Recursivo",
          dob: "N/A",
          species: "Padrão Visual",
          status: "CATALOGADO",
          location: "Múltiplas Localizações",
          description: "Um símbolo que aparece repetidamente em locais relacionados aos desaparecimentos. Cada aparição contém uma versão menor dele mesmo, criando um padrão fractal infinito.",
          filedBy: "Jessica Campos",
          date: "22/11/2024",
        ),
      ],
    ),
    // ==================== CATEGORIA: MÚSICAS ====================
    Category(
      id: "musicas",
      title: "Músicas",
      icon: Icons.music_note_outlined,
      color: const Color(0xFF7C5A45),
      cases: [
        CaseFile(
          caseNumber: "SC-MUS-001",
          subject: "Noite em Snout's Case",
          dob: "N/A",
          species: "Composição Musical",
          status: "PLAYING",
          location: "Trilha Sonora Principal",
          description: "Piano melancólico com sintetizadores atmosféricos e texturas ambientes. Evoca isolamento, mistério e a atmosfera opressiva da cidade.",
          filedBy: "Marcus Silva",
          date: "15/08/2024",
          trackName: "night_in_snouts.mp3",
          heardIn: "Menu Principal",
        ),
        CaseFile(
          caseNumber: "SC-MUS-002",
          subject: "Ecos do Passado",
          status: "STOPPED",
          description: "Jazz noir com saxofone melancólico, contrabaixo profundo e piano.",
          trackName: "echoes_past.mp3",
          heardIn: "Investigação",
          filedBy: "Dark Echo Studios",
        ),
      ],
    ),
    // ==================== CATEGORIA: MAPAS ====================
    Category(
      id: "mapas",
      title: "Mapas",
      icon: Icons.location_on_outlined,
      color: const Color(0xFF5A6B45),
      cases: [
        CaseFile(
          caseNumber: "MAP-01",
          subject: "Escritório da Detetive",
          type: "map",
          status: "BASE",
          mapEnvironment: "Silencioso, íntimo, iluminação quente",
          mapRelevance: "Apresenta o objetivo do jogo e contextualiza o caso.",
          mapPointsOfInterest: ["Mesa com dossiês", "Quadro de conexões", "Gaveta trancada"],
          description: "O local onde Jessica Campos organiza sua investigação. Uma sala pequena, com paredes cobertas por quadros de anotações, fotos e fios conectando suspeitos.",
          filedBy: "Jessica Campos",
        ),
        CaseFile(
          caseNumber: "MAP-02",
          subject: "Rua Principal",
          type: "map",
          status: "PÚBLICO",
          mapEnvironment: "Rua aberta, iluminação natural",
          mapRelevance: "Introduz o clima da cidade e esconde pequenas pistas ambientais.",
          mapPointsOfInterest: ["Vitrine do petshop Snout", "Faixa de pedestres", "Poste com cartazes rasgados"],
          description: "A rua mais movimentada da cidade. Um cenário urbano com lojas, ciclistas, carros e transeuntes.",
          filedBy: "Jessica Campos",
        ),
        CaseFile(
          caseNumber: "MAP-03",
          subject: "Bar do Bico Torto",
          type: "map",
          status: "INVESTIGAÇÃO",
          mapEnvironment: "Escuro, fumaça leve, mesas apertadas",
          mapRelevance: "Primeiro contato com testemunhos importantes.",
          mapPointsOfInterest: ["Mesa do Homem Misterioso", "Balcão do bar", "Porta dos fundos"],
          description: "Um bar pouco iluminado frequentado por trabalhadores e indivíduos suspeitos.",
          filedBy: "Jessica Campos",
        ),
      ],
    ),
    // ==================== CATEGORIA: DESENVOLVEDORES ====================
    Category(
      id: "desenvolvedores",
      title: "Desenvolvedores",
      icon: Icons.code,
      color: const Color(0xFF6B5A7C),
      cases: [
        CaseFile(
          caseNumber: "01",
          subject: "Bruno S. Ichikawa",
          type: "developer",
          devRole: "Web/Mobile Developer",
          devArea: "Development",
          status: "ATIVO",
          description: "Especialista em desenvolvimento web e mobile, responsável pela arquitetura tecnológica dos projetos.",
          devSpecialties: ["Desenvolvimento Web Full-Stack", "Aplicações Mobile Nativas", "Arquitetura de Software", "APIs e Backend Systems"],
          devContribution: "Responsável pela implementação técnica da jogabilidade e sistemas de interface do usuário.",
          photo: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&auto=format&fit=crop&q=60",
          filedBy: "Snout's Team",
        ),
        CaseFile(
          caseNumber: "02",
          subject: "Giovanna C. de Santana",
          type: "developer",
          devRole: "3D Modeler",
          devArea: "3D Modeling",
          status: "ATIVO",
          description: "Artista 3D especializada na criação de modelos, texturas e assets visuais dos jogos.",
          devSpecialties: ["Modelagem 3D de Personagens", "Criação de Ambientes", "Texturização e Materiais", "Otimização de Assets"],
          devContribution: "Criou todos os modelos 3D dos personagens, NPCs e ambientes do jogo, incluindo o visual característico do Petshop Snout.",
          photo: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400&auto=format&fit=crop&q=60",
          filedBy: "Snout's Team",
        ),
        CaseFile(
          caseNumber: "03",
          subject: "Igor Michelini Pereira",
          type: "developer",
          devRole: "Game Developer",
          devArea: "Game Development",
          status: "ATIVO",
          description: "Desenvolvedor de jogos focado na programação de mecânicas e sistemas de gameplay.",
          devSpecialties: ["Programação de Mecânicas de Jogo", "Sistemas de Física e Colisão", "IA de NPCs", "Scripting e Eventos"],
          devContribution: "Implementou as mecânicas principais de investigação, sistema de diálogos e comportamento dos NPCs.",
          photo: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&auto=format&fit=crop&q=60",
          filedBy: "Snout's Team",
        ),
        CaseFile(
          caseNumber: "04",
          subject: "Gabriel L. Villarinho",
          type: "developer",
          devRole: "Level Designer",
          devArea: "Level Design",
          status: "ATIVO",
          description: "Designer responsável pela criação e estruturação dos níveis e ambientes dos jogos.",
          devSpecialties: ["Design de Níveis", "Balanceamento de Gameplay", "Criação de Puzzles", "Flow e Pacing Narrativo"],
          devContribution: "Projetou os 8 locais principais da investigação, distribuiu pistas estrategicamente e criou a progressão narrativa.",
          photo: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=400&auto=format&fit=crop&q=60",
          filedBy: "Snout's Team",
        ),
        CaseFile(
          caseNumber: "05",
          subject: "Guilherme S. Pereira",
          type: "developer",
          devRole: "Sound Designer",
          devArea: "Audio Design",
          status: "ATIVO",
          description: "Especialista em design de áudio, criação de trilhas sonoras e efeitos sonoros.",
          devSpecialties: ["Composição Musical", "Design de Efeitos Sonoros", "Áudio Ambiental", "Mixagem e Masterização"],
          devContribution: "Compôs toda a trilha sonora atmosférica, incluindo as músicas do bar e os sons ambientais que reforçam a tensão investigativa.",
          photo: "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=400&auto=format&fit=crop&q=60",
          filedBy: "Snout's Team",
        ),
        CaseFile(
          caseNumber: "06",
          subject: "Kevin N. Bezerra",
          type: "developer",
          devRole: "Concept Artist",
          devArea: "Concept Art",
          status: "ATIVO",
          description: "Artista conceitual responsável pela criação da identidade visual e conceitos artísticos.",
          devSpecialties: ["Arte Conceitual de Personagens", "Design de Ambientes", "Paleta de Cores", "Direção de Arte Visual"],
          devContribution: "Desenvolveu toda a identidade visual do jogo, desde os designs dos personagens até a estética sombria e investigativa do mundo de Snout's Case.",
          photo: "https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=400&auto=format&fit=crop&q=60",
          filedBy: "Snout's Team",
        ),
      ],
    ),
  ];
}