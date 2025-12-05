// Arquivo: case_file_header.dart
// Descrição: Cabeçalho usado nas telas de arquivos individuais (perfis de personagens, locais, NPCs).
// Exibe botão voltar, título do caso, contador de arquivos e botão de favoritar.
// Sincroniza automaticamente com o serviço de favoritos.

import 'package:flutter/material.dart';
import '../services/favorites_service.dart';

/// Cabeçalho para telas de arquivo individual (personagem, local, NPC, etc.).
/// Inclui botão voltar, título centralizado, contador de arquivos e estrela de favorito.
/// Observa mudanças no serviço de favoritos para atualizar o ícone automaticamente.
class CaseFileHeader extends StatefulWidget {
  final String caseId; // ID do caso para controle de favoritos
  final String caseTitle; // Título exibido no centro
  final int totalFiles; // Total de arquivos no sistema

  const CaseFileHeader({
    Key? key,
    required this.caseId,
    this.caseTitle = "SNOUT'S CASE",
    this.totalFiles = 37,
  }) : super(key: key);

  @override
  State<CaseFileHeader> createState() => _CaseFileHeaderState();
}

class _CaseFileHeaderState extends State<CaseFileHeader> {
  bool isFavorite = false; // Estado local do favorito

  @override
  void initState() {
    super.initState();
    // Verifica se já está nos favoritos ao iniciar
    _checkFavorite();
    // Escuta mudanças no serviço de favoritos
    FavoritesService().favoriteIds.addListener(_checkFavorite);
  }

  @override
  void dispose() {
    // Remove o listener ao destruir o widget
    FavoritesService().favoriteIds.removeListener(_checkFavorite);
    super.dispose();
  }

  // Verifica se este caso está marcado como favorito
  void _checkFavorite() {
    final favs = FavoritesService().favoriteIds.value;
    if (mounted) {
      setState(() {
        isFavorite = favs.contains(widget.caseId);
      });
    }
  }

  // Alterna o estado de favorito deste caso
  void _toggleFavorite() {
    FavoritesService().toggleFavorite(widget.caseId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Botão Voltar (esquerda)
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 28,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF2D2419),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF6D5A47), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.arrow_back,
                      size: 12,
                      color: Color(0xFFF4E4C1),
                    ),
                    SizedBox(width: 6),
                    Text(
                      "VOLTAR",
                      style: TextStyle(
                        fontFamily: 'Courier Prime',
                        fontSize: 10,
                        color: Color(0xFFF4E4C1),
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Título e contador centralizados
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Nome do caso
                  Text(
                    widget.caseTitle,
                    style: const TextStyle(
                      fontFamily: 'Special Elite',
                      color: Color(0xFFF4E4C1),
                      fontSize: 14,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Contador de arquivos com bolinha decorativa
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 3,
                        height: 3,
                        decoration: const BoxDecoration(
                          color: Color(0xFF8B7355),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${widget.totalFiles} Arquivos",
                        style: TextStyle(
                          fontFamily: 'Courier Prime',
                          color: const Color(0xFFD4C4A8).withValues(alpha: 0.6),
                          fontSize: 7,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Botão Favorito (direita)
            GestureDetector(
              onTap: _toggleFavorite,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isFavorite ? const Color(0xFFF4E4C1) : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  color: const Color(0xFFF4E4C1),
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}