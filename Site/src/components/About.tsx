import { motion } from "motion/react";
import { Card, CardContent } from "./ui/card";
import { Trophy, Users, Gamepad2, Zap } from "lucide-react";

export function About() {
  const stats = [
    { icon: Gamepad2, label: "Jogos Lançados", value: "2", color: "text-yellow-400" },
    { icon: Users, label: "Anos de Experiência", value: "2", color: "text-green-400" },
    { icon: Trophy, label: "Foco Principal", value: "Narrativas", color: "text-blue-400" },
    { icon: Zap, label: "Fundação", value: "2024", color: "text-purple-400" }
  ];

  return (
    <section className="py-20 relative overflow-hidden bg-gradient-to-b from-black to-gray-900">
      {/* Animated Background Effects */}
      <motion.div
        className="absolute inset-0 bg-gradient-to-br from-[#bb0000]/5 via-transparent to-transparent"
        animate={{
          opacity: [0.3, 0.6, 0.3],
        }}
        transition={{
          duration: 8,
          repeat: Infinity,
          ease: "easeInOut",
        }}
      />

      {/* Floating Spades */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        {[...Array(12)].map((_, i) => (
          <motion.div
            key={i}
            className="absolute text-[#bb0000] opacity-10"
            style={{
              left: `${Math.random() * 100}%`,
              top: `${Math.random() * 100}%`,
              fontSize: `${Math.random() * 1.5 + 1}rem`,
            }}
            animate={{
              y: [0, -80, 0],
              x: [0, Math.random() * 40 - 20, 0],
              rotate: [0, 360],
              opacity: [0.1, 0.4, 0.1],
            }}
            transition={{
              duration: 15 + Math.random() * 5,
              repeat: Infinity,
              delay: Math.random() * 4,
              ease: "easeInOut",
            }}
          >
            ♠
          </motion.div>
        ))}
      </div>

      {/* Wave pattern */}
      <div className="absolute bottom-0 left-0 right-0 h-32 opacity-10">
        <motion.div
          animate={{
            backgroundPosition: ["0% 0%", "100% 0%"],
          }}
          transition={{
            duration: 15,
            repeat: Infinity,
            ease: "linear",
          }}
          style={{
            backgroundImage: `repeating-linear-gradient(90deg, #bb0000 0px, transparent 50px, #bb0000 100px)`,
            backgroundSize: "200% 100%",
          }}
          className="h-full w-full"
        />
      </div>

      <div className="container mx-auto px-4 relative z-10">
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8 }}
          className="text-center mb-16"
        >
          <h2 className="text-5xl md:text-6xl font-black text-white mb-4">
            SOBRE <span className="text-[#bb0000]">NÓS</span>
          </h2>
          <p className="text-xl text-gray-300 max-w-2xl mx-auto">
            Conheça a história por trás da revolução gaming brasileira
          </p>
        </motion.div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center max-w-7xl mx-auto">
          {/* Content */}
          <motion.div
            initial={{ opacity: 0, x: -30 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.8 }}
            className="space-y-6"
          >
            <div className="space-y-4">
              <h3 className="text-3xl font-black text-white">Nossa História</h3>
              <p className="text-gray-300 leading-relaxed text-lg">
                A 4GInnovation foi fundada em fevereiro de 2024 com o objetivo de trazer inovação ao mercado por meio de jogos e narrativas envolventes. Nosso foco é criar histórias bem escritas que prendem o jogador, aliadas a mecânicas que enriquecem a experiência e agradam o público.
              </p>
            </div>

            <div className="space-y-4">
              <h3 className="text-3xl font-black text-white">Nosso Diferencial</h3>
              <div className="space-y-3">
                <div className="flex items-start gap-3">
                  <div className="w-2 h-2 bg-[#bb0000] rounded-full mt-2 flex-shrink-0"></div>
                  <p className="text-gray-300">
                    <span className="text-white font-semibold">Narrativas Envolventes:</span> Criamos histórias cativantes que prendem o jogador do início ao fim
                  </p>
                </div>
                <div className="flex items-start gap-3">
                  <div className="w-2 h-2 bg-[#bb0000] rounded-full mt-2 flex-shrink-0"></div>
                  <p className="text-gray-300">
                    <span className="text-white font-semibold">Mecânicas Inovadoras:</span> Desenvolvemos sistemas que enriquecem a experiência do jogador
                  </p>
                </div>
                <div className="flex items-start gap-3">
                  <div className="w-2 h-2 bg-[#bb0000] rounded-full mt-2 flex-shrink-0"></div>
                  <p className="text-gray-300">
                    <span className="text-white font-semibold">Foco na Qualidade:</span> Priorizamos a satisfação do jogador em cada detalhe
                  </p>
                </div>
                <div className="flex items-start gap-3">
                  <div className="w-2 h-2 bg-[#bb0000] rounded-full mt-2 flex-shrink-0"></div>
                  <p className="text-gray-300">
                    <span className="text-white font-semibold">Inovação no Mercado:</span> Buscamos constantemente novas formas de surpreender
                  </p>
                </div>
              </div>
            </div>
          </motion.div>

          {/* Stats Grid */}
          <motion.div
            initial={{ opacity: 0, x: 30 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.8, delay: 0.2 }}
            className="grid grid-cols-2 gap-6"
          >
            {stats.map((stat, index) => (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ duration: 0.6, delay: 0.1 * index }}
                whileHover={{ scale: 1.05 }}
              >
                <Card className="bg-gradient-to-br from-gray-900 to-black border-[#bb0000]/30 hover:border-[#bb0000]/60 transition-all duration-300 hover:shadow-xl hover:shadow-[#bb0000]/20">
                  <CardContent className="p-6 text-center">
                    <div className="mb-4">
                      <div className={`w-16 h-16 rounded-full bg-gradient-to-br from-gray-800 to-gray-900 border border-[#bb0000]/30 flex items-center justify-center mx-auto mb-3`}>
                        <stat.icon className={`w-8 h-8 ${stat.color}`} />
                      </div>
                    </div>
                    <motion.div
                      initial={{ opacity: 0 }}
                      whileInView={{ opacity: 1 }}
                      viewport={{ once: true }}
                      transition={{ duration: 1, delay: 0.5 + index * 0.1 }}
                    >
                      <div className="text-3xl font-black text-white mb-2">{stat.value}</div>
                      <div className="text-gray-300 text-sm">{stat.label}</div>
                    </motion.div>
                  </CardContent>
                </Card>
              </motion.div>
            ))}
          </motion.div>
        </div>
      </div>
    </section>
  );
}