import 'package:flutter/material.dart';
import 'dart:async';
import '../theme/app_fonts.dart';
import '../services/favorites_service.dart';

class MusicPlayerScreen extends StatefulWidget {
  final dynamic caseFile;

  const MusicPlayerScreen({Key? key, this.caseFile}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  // Lista completa de músicas
  final List<Map<String, dynamic>> _allTracks = [
    {
      'caseNumber': 'SC-MUS-001',
      'subject': 'Noite em Snout\'s Case',
      'description': 'Piano melancólico com sintetizadores atmosféricos e texturas ambientes. Evoca isolamento, mistério e a atmosfera opressiva da cidade.',
      'location': 'Trilha Sonora Principal',
    },
    {
      'caseNumber': 'SC-MUS-002',
      'subject': 'Ecos do Passado',
      'description': 'Jazz noir com saxofone melancólico, contrabaixo profundo e piano suave. Atmosfera de detetive clássico adaptada ao contexto paranormal.',
      'location': 'Tema de Investigação',
    },
    {
      'caseNumber': 'SC-MUS-003',
      'subject': 'Presença Invisível',
      'description': 'Cordas dissonantes, drones graves e percussão minimalista. Cria sensação de vigilância constante e presença ameaçadora não vista.',
      'location': 'Tema de Tensão',
    },
    {
      'caseNumber': 'SC-MUS-004',
      'subject': 'Fragmentos de Memória',
      'description': 'Piano solo melancólico com cordas suaves e reverb extenso. Tom reflexivo e ambíguo, deixando questões em aberto sobre os mistérios não resolvidos.',
      'location': 'Tema de Encerramento',
    },
  ];

  // Estado do player
  Map<String, dynamic>? _currentTrack;
  bool _isPlaying = false;
  int _currentTime = 0;
  final int _totalTime = 204; // 3:24 em segundos
  Timer? _timer;
  
  // Estado da busca
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Define a primeira música como track atual
    _currentTrack = _allTracks[0];
  }

  @override
  void dispose() {
    _timer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  // Filtra as músicas com base na busca
  List<Map<String, dynamic>> get _filteredTracks {
    if (_searchQuery.isEmpty) {
      return _allTracks;
    }
    
    final query = _searchQuery.toLowerCase();
    return _allTracks.where((track) {
      return track['subject'].toString().toLowerCase().contains(query) ||
             track['description'].toString().toLowerCase().contains(query) ||
             track['caseNumber'].toString().toLowerCase().contains(query) ||
             track['location'].toString().toLowerCase().contains(query);
    }).toList();
  }

  void _selectTrack(Map<String, dynamic> track) {
    setState(() {
      _currentTrack = track;
      _currentTime = 0;
      _isPlaying = false;
    });
    _timer?.cancel();
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });

    if (_isPlaying) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_currentTime >= _totalTime) {
            _isPlaying = false;
            _currentTime = _totalTime;
            timer.cancel();
          } else {
            _currentTime++;
          }
        });
      });
    } else {
      _timer?.cancel();
    }
  }

  void _restart() {
    setState(() {
      _currentTime = 0;
      _isPlaying = false;
    });
    _timer?.cancel();
  }

  void _rewind() {
    setState(() {
      _currentTime = (_currentTime - 10).clamp(0, _totalTime);
    });
  }

  void _forward() {
    setState(() {
      _currentTime = (_currentTime + 10).clamp(0, _totalTime);
    });
  }

  String _formatTime(int seconds) {
    final mins = seconds ~/ 60;
    final secs = seconds % 60;
    return '$mins:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_currentTime / _totalTime) * 100;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1614),
      body: Stack(
        children: [
          // Shadow overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.9),
                    blurRadius: 100,
                    spreadRadius: -12,
                  ),
                ],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // BOTÃO VOLTAR
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF8B7355).withValues(alpha: 0.6),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.transparent,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.arrow_back,
                                size: 14,
                                color: Color(0xFFF4E4C1),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'VOLTAR',
                                style: AppFonts.courier(
                                  fontSize: 11,
                                  color: const Color(0xFFF4E4C1),
                                  letterSpacing: 0.3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // BARRA DE CATEGORIA "MÚSICAS"
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7c5a45).withValues(alpha: 0.8),
                    border: Border.all(color: const Color(0xFF7c5a45), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.6),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Text(
                    'MÚSICAS',
                    style: AppFonts.specialElite(
                      fontSize: 18,
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 24),

                // CONTEÚDO SCROLLÁVEL
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TÍTULO: Toca-Fitas
                        Text(
                          'Toca-Fitas - Arquivo de Áudio',
                          style: AppFonts.ibmPlexSans(
                            fontSize: 16,
                            color: const Color(0xFFF4E4C1),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Sistema de reprodução analógica',
                          style: AppFonts.ibmPlexMono(
                            fontSize: 12,
                            color: const Color(0xFF8B7355),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // CASSETTE PLAYER
                        _buildCassettePlayer(progress),

                        const SizedBox(height: 32),

                        // TÍTULO: Catálogo de Fitas
                        Text(
                          'Catálogo de Fitas',
                          style: AppFonts.ibmPlexSans(
                            fontSize: 16,
                            color: const Color(0xFFF4E4C1),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // BARRA DE BUSCA
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1f1f23),
                            border: Border.all(color: const Color(0xFF8B7355), width: 1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) {
                              setState(() {
                                _searchQuery = value;
                              });
                            },
                            style: AppFonts.ibmPlexMono(
                              fontSize: 14,
                              color: const Color(0xFFF4E4C1),
                            ),
                            decoration: InputDecoration(
                              hintText: 'Buscar músicas...',
                              hintStyle: AppFonts.ibmPlexMono(
                                fontSize: 14,
                                color: const Color(0xFF8B7355),
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Color(0xFF8B7355),
                                size: 20,
                              ),
                              suffixIcon: _searchQuery.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Color(0xFF8B7355),
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _searchController.clear();
                                          _searchQuery = '';
                                        });
                                      },
                                    )
                                  : null,
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // GRID DE FITAS
                        _buildCassetteGrid(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // CASSETTE PLAYER (Toca-Fitas)
  Widget _buildCassettePlayer(double progress) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1e2939),
            Color(0xFF1f1f23),
            Color(0xFF101828),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF364153), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.8),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Brand name
          Text(
            "SNOUT'S CASE ARCHIVE",
            style: AppFonts.specialElite(
              fontSize: 12,
              color: const Color(0xFF99a1af),
              letterSpacing: 2.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Tape window
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0a0a0a),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFF1e2939)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Tape reels
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildReel(isLeft: true),
                    Container(width: 1, height: 48, color: const Color(0xFF4a5565)),
                    _buildReel(isLeft: false),
                  ],
                ),
                const SizedBox(height: 12),

                // Track display
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0x330D542B),
                    border: Border.all(color: const Color(0x80008236)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _currentTrack?['subject'] ?? 'Noite em Snout\'s Case',
                    style: AppFonts.courier(
                      fontSize: 14,
                      color: const Color(0xFF05df72),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Progress bar
          Column(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xFF0a0a0a),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF1e2939)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: progress / 100,
                    backgroundColor: Colors.transparent,
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF8b2e2e)),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatTime(_currentTime),
                    style: AppFonts.courier(
                      fontSize: 10,
                      color: const Color(0xFF6a7282),
                    ),
                  ),
                  Text(
                    _formatTime(_totalTime),
                    style: AppFonts.courier(
                      fontSize: 10,
                      color: const Color(0xFF6a7282),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Control buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildControlButton(
                icon: Icons.restart_alt,
                onPressed: _restart,
                color: const Color(0xFF364153),
              ),
              const SizedBox(width: 8),
              _buildControlButton(
                icon: Icons.fast_rewind,
                onPressed: _rewind,
                color: const Color(0xFF364153),
              ),
              const SizedBox(width: 8),
              _buildControlButton(
                icon: _isPlaying ? Icons.pause : Icons.play_arrow,
                onPressed: _currentTime >= _totalTime ? null : _togglePlayPause,
                color: const Color(0xFF8b2e2e),
                isLarge: true,
              ),
              const SizedBox(width: 8),
              _buildControlButton(
                icon: Icons.fast_forward,
                onPressed: _currentTime >= _totalTime ? null : _forward,
                color: const Color(0xFF364153),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Status indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _isPlaying ? const Color(0xFFdc2626) : const Color(0xFF4a5565),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _isPlaying ? 'REPRODUZINDO' : _currentTime >= _totalTime ? 'FINALIZADO' : 'PAUSADO',
                style: AppFonts.courier(
                  fontSize: 10,
                  color: const Color(0xFF6a7282),
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReel({required bool isLeft}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: _isPlaying ? 360 : 0),
      duration: const Duration(seconds: 2),
      builder: (context, angle, child) {
        return Transform.rotate(
          angle: angle * 3.14159 / 180 * (isLeft ? 1 : -1),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF364153), width: 3),
              color: const Color(0xFF1e2939),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Spokes
                ...List.generate(6, (i) {
                  return Transform.rotate(
                    angle: (i * 60) * 3.14159 / 180,
                    child: Container(
                      width: 2,
                      height: 24,
                      color: const Color(0xFF4a5565),
                    ),
                  );
                }),
                // Center circle
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF0a0a0a),
                    border: Border.all(color: const Color(0xFF4a5565)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback? onPressed,
    required Color color,
    bool isLarge = false,
  }) {
    return Material(
      color: onPressed == null ? const Color(0xFF364153) : color,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: EdgeInsets.all(isLarge ? 16 : 10),
          child: Icon(
            icon,
            color: Colors.white,
            size: isLarge ? 28 : 20,
          ),
        ),
      ),
    );
  }

  // GRID DE CASSETTES
  Widget _buildCassetteGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 0.68,
      ),
      itemCount: _filteredTracks.length,
      itemBuilder: (context, index) {
        final track = _filteredTracks[index];
        final isCurrentTrack = _currentTrack?['caseNumber'] == track['caseNumber'];

        return _buildCassetteCard(track, isCurrentTrack);
      },
    );
  }

  Widget _buildCassetteCard(Map<String, dynamic> track, bool isCurrentTrack) {
    return ValueListenableBuilder<Set<String>>(
      valueListenable: FavoritesService().favoriteIds,
      builder: (context, favorites, _) {
        final isFavorite = favorites.contains(track['caseNumber']);
        
        return GestureDetector(
          onTap: () => _selectTrack(track),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Main cassette body
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1f1f23),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: isCurrentTrack ? const Color(0xFFc41e3a) : const Color(0xFF374151),
                    width: isCurrentTrack ? 2 : 1,
                  ),
                  boxShadow: isCurrentTrack
                      ? [
                          BoxShadow(
                            color: const Color(0xFFc41e3a).withValues(alpha: 0.3),
                            blurRadius: 12,
                            spreadRadius: 2,
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.5),
                            blurRadius: 8,
                          ),
                        ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top reels
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            _buildSmallReel(isCurrentTrack),
                            const SizedBox(width: 8), // Reduzido de 12 para 8
                            _buildSmallReel(isCurrentTrack),
                          ],
                        ),
                        Icon(
                          Icons.music_note,
                          color: isCurrentTrack ? const Color(0xFFc41e3a) : const Color(0xFF4b5563),
                          size: 14, // Reduzido de 16 para 14
                        ),
                      ],
                    ),
                    const SizedBox(height: 6), // Reduzido de 8 para 6

                    // Label area (post-it style)
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4E4C1),
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8), // Reduzido de 12 para 8
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Case number
                          Text(
                            track['caseNumber'],
                            style: AppFonts.courier(
                              fontSize: 9, // Reduzido de 10 para 9
                              color: const Color(0xFF8B7355),
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2), // Reduzido de 3 para 2

                          // Title
                          Text(
                            track['subject'],
                            style: AppFonts.specialElite(
                              fontSize: 13, // Reduzido de 14 para 13
                              color: const Color(0xFF1f1f23),
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4), // Reduzido de 6 para 4

                          // Description
                          Text(
                            track['description'],
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 10, // Reduzido de 11 para 10
                              color: const Color(0xFF8B7355),
                              height: 1.3, // Reduzido de 1.4 para 1.3
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4), // Reduzido de 6 para 4

                          // Location note
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Color(0x4D9CA3AF)),
                              ),
                            ),
                            padding: const EdgeInsets.only(top: 3), // Reduzido de 4 para 3
                            child: Text(
                              '↳ ${track['location']}',
                              style: AppFonts.courier(
                                fontSize: 9, // Reduzido de 10 para 9
                                color: const Color(0xFF8B7355),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6), // Substituiu Spacer() por altura fixa

                    // Bottom detail
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TAPE',
                          style: AppFonts.courier(
                            fontSize: 10,
                            color: isCurrentTrack ? const Color(0xFFc41e3a) : const Color(0xFF4b5563),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (isCurrentTrack)
                          Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFc41e3a),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'TOCANDO',
                                style: AppFonts.courier(
                                  fontSize: 10,
                                  color: const Color(0xFFc41e3a),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        else
                          Text(
                            'ARCHIVE',
                            style: AppFonts.courier(
                              fontSize: 10,
                              color: const Color(0xFF4b5563),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              // Current track indicator (top right badge)
              if (isCurrentTrack)
                Positioned(
                  top: -8,
                  right: -8,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFc41e3a),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              
              // Favorite button (top left badge)
              Positioned(
                top: -8,
                left: -8,
                child: GestureDetector(
                  onTap: () {
                    FavoritesService().toggleFavorite(track['caseNumber']);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isFavorite ? const Color(0xFFfbbf24) : const Color(0xFF4b5563),
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Icon(
                      isFavorite ? Icons.star : Icons.star_border,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSmallReel(bool isCurrentTrack) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isCurrentTrack ? const Color(0xFFc41e3a) : const Color(0xFF4b5563),
          width: 2,
        ),
        color: const Color(0xFF374151),
      ),
      child: Center(
        child: Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF1f2937),
          ),
        ),
      ),
    );
  }
}