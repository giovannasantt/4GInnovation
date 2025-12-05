import { motion } from "motion/react";
import { Card, CardContent } from "./ui/card";
import { Badge } from "./ui/badge";
import { Button } from "./ui/button";
import { Play, Download, Star } from "lucide-react";
import { ImageWithFallback } from "./figma/ImageWithFallback";

export function Games() {
  const games = [
    {
      id: 1,
      title: "Snout's Case",
      description: "Em São Domingues, uma cidade pacata apenas na aparência, estranhos desaparecimentos de animais domésticos despertam a atenção da investigadora Jéssica Campos. Atendendo a uma ligação anônima, você assume o papel da detetive e mergulha em uma investigação sombria de três dias repletos de tensão, mistério e segredos escondidos. Explore bares, comércios, galpões suspeitos e o luxuoso Snout's Petshop, interrogue moradores, colete pistas, fotografe evidências e use disfarces para se infiltrar onde ninguém mais conseguiria.",
      image: "https://images.unsplash.com/photo-1594163214595-61b021c34faf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxkZXRlY3RpdmUlMjBteXN0ZXJ5JTIwaW52ZXN0aWdhdGlvbiUyMGRhcmt8ZW58MXx8fHwxNzU4ODk1NzIyfDA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      category: "Mystery",
      status: "Lançado",
      rating: 4.7,
      downloads: "15K+"
    },
    {
      id: 2,
      title: "Three Nights in Uridnarac",
      description: "Vitor, um jovem youtuber em busca de fama, invade uma prisão abandonada para gravar um vídeo sobre supostas atividades sobrenaturais. No entanto, o que era para ser apenas conteúdo assustador se transforma em um pesadelo real quando ele encontra uma criatura bizarra e, acidentalmente, ativa um antigo sistema de segurança que liberta horrores escondidos. Ao explorar o local, Vitor descobre que a prisão era, na verdade, um laboratório de experimentos secretos com humanos, animais e possíveis formas de vida alienígena.",
      image: "https://images.unsplash.com/photo-1576755275964-922444912a73?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxob3Jyb3IlMjBwcmlzb24lMjBhYmFuZG9uZWQlMjBkYXJrfGVufDF8fHx8MTc1ODg5NTcyNXww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      category: "Horror",
      status: "Lançado",
      rating: 4.5,
      downloads: "8K+"
    }
  ];

  return (
    <section className="py-12 md:py-20 relative overflow-hidden bg-gradient-to-b from-gray-900 to-black">
      {/* Animated Background Gradients */}
      <motion.div
        className="absolute top-0 right-0 w-1/2 h-1/2 bg-gradient-radial from-[#bb0000]/10 to-transparent rounded-full blur-3xl"
        animate={{
          scale: [1, 1.2, 1],
          opacity: [0.3, 0.5, 0.3],
        }}
        transition={{
          duration: 6,
          repeat: Infinity,
          ease: "easeInOut",
        }}
      />
      <motion.div
        className="absolute bottom-0 left-0 w-1/2 h-1/2 bg-gradient-radial from-[#bb0000]/10 to-transparent rounded-full blur-3xl"
        animate={{
          scale: [1.2, 1, 1.2],
          opacity: [0.5, 0.3, 0.5],
        }}
        transition={{
          duration: 6,
          repeat: Infinity,
          ease: "easeInOut",
          delay: 3,
        }}
      />

      {/* Animated Spade particles */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        {[...Array(15)].map((_, i) => (
          <motion.div
            key={i}
            className="absolute text-[#bb0000] opacity-10"
            style={{
              left: `${Math.random() * 100}%`,
              top: `${Math.random() * 100}%`,
              fontSize: `${Math.random() * 2 + 1}rem`,
            }}
            animate={{
              y: [0, -100, 0],
              rotate: [0, 180, 360],
              opacity: [0.1, 0.3, 0.1],
            }}
            transition={{
              duration: 10 + Math.random() * 5,
              repeat: Infinity,
              delay: Math.random() * 3,
              ease: "easeInOut",
            }}
          >
            ♠
          </motion.div>
        ))}
      </div>

      {/* Diagonal lines pattern */}
      <div className="absolute inset-0 opacity-5">
        <motion.div
          className="h-full w-full"
          style={{
            backgroundImage: `repeating-linear-gradient(45deg, #bb0000 0px, #bb0000 2px, transparent 2px, transparent 10px)`,
          }}
          animate={{
            backgroundPosition: ["0px 0px", "100px 100px"],
          }}
          transition={{
            duration: 20,
            repeat: Infinity,
            ease: "linear",
          }}
        />
      </div>
      
      <div className="container mx-auto px-4 relative z-10">
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8 }}
          className="text-center mb-12 md:mb-16"
        >
          <h2 className="text-3xl md:text-5xl lg:text-6xl font-black text-white mb-4">
            NOSSOS <span className="text-[#bb0000]">JOGOS</span>
          </h2>
          <div className="flex justify-center mb-4">
            <div className="h-1 w-20 md:w-32 bg-gradient-to-r from-[#bb0000] to-white"></div>
          </div>
          <p className="text-lg md:text-xl text-gray-300 max-w-2xl mx-auto px-4">
            Experiências gaming inovadoras que redefinem os limites do entretenimento digital
          </p>
        </motion.div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 md:gap-8 max-w-7xl mx-auto">
          {games.map((game, index) => (
            <motion.div
              key={game.id}
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.6, delay: index * 0.1 }}
            >
              <Card className="bg-gradient-to-br from-gray-900 to-black border-[#bb0000]/30 overflow-hidden group hover:border-[#bb0000]/60 transition-all duration-300 hover:shadow-xl hover:shadow-[#bb0000]/20">
                <div className="relative overflow-hidden">
                  <ImageWithFallback
                    src={game.image}
                    alt={game.title}
                    className="w-full h-48 md:h-64 object-cover transition-transform duration-500 group-hover:scale-110"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent"></div>
                  <div className="absolute top-4 left-4">
                    <Badge 
                      variant={game.status === "Lançado" ? "default" : game.status === "Beta" ? "secondary" : "outline"}
                      className={`${
                        game.status === "Lançado" 
                          ? "bg-green-600 text-white" 
                          : game.status === "Beta"
                          ? "bg-yellow-600 text-white"
                          : "bg-[#bb0000] text-white border-[#bb0000]"
                      }`}
                    >
                      {game.status}
                    </Badge>
                  </div>
                  <div className="absolute top-4 right-4">
                    <Badge variant="outline" className="bg-black/50 text-white border-gray-600">
                      {game.category}
                    </Badge>
                  </div>
                  {game.rating && (
                    <div className="absolute bottom-4 right-4 flex items-center gap-1 bg-black/70 px-2 py-1 rounded">
                      <Star className="w-4 h-4 text-yellow-400 fill-current" />
                      <span className="text-white text-sm font-semibold">{game.rating}</span>
                    </div>
                  )}
                </div>

                <CardContent className="p-4 md:p-6 relative">
                  {/* Spade decoration */}
                  <div className="absolute top-2 right-2 text-[#bb0000] opacity-30 text-lg">♠</div>
                  <h3 className="text-xl md:text-2xl font-black text-white mb-3">{game.title}</h3>
                  <p className="text-gray-300 mb-4 leading-relaxed text-sm md:text-base line-clamp-4 md:line-clamp-none">{game.description}</p>
                  
                  {game.downloads && (
                    <div className="flex items-center gap-4 mb-4 text-sm text-gray-400">
                      <div className="flex items-center gap-1">
                        <Download className="w-4 h-4" />
                        <span>{game.downloads} downloads</span>
                      </div>
                    </div>
                  )}

                  <div className="flex flex-col sm:flex-row gap-3">
                    {game.status === "Lançado" ? (
                      <>
                        <Button className="bg-[#bb0000] hover:bg-[#990000] text-white flex-1 font-bold">
                          <Play className="w-4 h-4 mr-2" />
                          Jogar Agora
                        </Button>
                        <Button variant="outline" className="border-[#bb0000] text-[#bb0000] hover:bg-[#bb0000] hover:text-white sm:w-auto">
                          <Download className="w-4 h-4" />
                        </Button>
                      </>
                    ) : game.status === "Beta" ? (
                      <Button className="bg-yellow-600 hover:bg-yellow-700 text-white flex-1">
                        Participar da Beta
                      </Button>
                    ) : (
                      <Button variant="outline" className="border-[#bb0000] text-[#bb0000] hover:bg-[#bb0000] hover:text-white flex-1">
                        Em Breve
                      </Button>
                    )}
                  </div>
                </CardContent>
              </Card>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
