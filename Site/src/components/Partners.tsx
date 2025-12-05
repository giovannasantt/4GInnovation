import { motion } from "motion/react";
import { Card, CardContent } from "./ui/card";
import { ImageWithFallback } from "./figma/ImageWithFallback";

export function Partners() {
  const partners = [
    {
      name: "Codimbus",
      logo: "src/assets/logos/Codimbus.png", // Logo placeholder
      category: "Parceiro Estratégico"
    },
    {
      name: "Cogitare Path",
      logo: "src/assets/logos/cogitareLogo.png", // Logo placeholder
      category: "Parceiro Estratégico"
    },
    {
      name: "Enótida",
      logo: "src/assets/logos/logoEnotita.png", // Logo placeholder
      category: "Parceiro Estratégico"
    },
    {
      name: "GVines",
      logo: null, // Logo placeholder
      category: "Parceiro Estratégico"
    },
    {
      name: "Rapportia",
      logo: null, // Logo placeholder
      category: "Parceiro Estratégico"
    }
  ];

  return (
    <section className="py-20 relative overflow-hidden bg-gradient-to-b from-gray-900 to-black">
      {/* Animated Hexagonal Pattern */}
      <div className="absolute inset-0 opacity-5">
        <motion.div
          className="h-full w-full"
          style={{
            backgroundImage: `url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M30 0l25.98 15v30L30 60 4.02 45V15z' fill='none' stroke='%23bb0000' stroke-width='1'/%3E%3C/svg%3E")`,
          }}
          animate={{
            backgroundPosition: ["0px 0px", "60px 60px"],
          }}
          transition={{
            duration: 30,
            repeat: Infinity,
            ease: "linear",
          }}
        />
      </div>

      {/* Glowing orbs */}
      <motion.div
        className="absolute top-0 right-1/4 w-64 h-64 bg-[#bb0000]/10 rounded-full blur-3xl"
        animate={{
          x: [0, 50, 0],
          y: [0, 30, 0],
          scale: [1, 1.2, 1],
          opacity: [0.3, 0.5, 0.3],
        }}
        transition={{
          duration: 10,
          repeat: Infinity,
          ease: "easeInOut",
        }}
      />
      <motion.div
        className="absolute bottom-0 left-1/4 w-64 h-64 bg-[#bb0000]/10 rounded-full blur-3xl"
        animate={{
          x: [0, -50, 0],
          y: [0, -30, 0],
          scale: [1.2, 1, 1.2],
          opacity: [0.5, 0.3, 0.5],
        }}
        transition={{
          duration: 10,
          repeat: Infinity,
          ease: "easeInOut",
          delay: 5,
        }}
      />

      {/* Animated Spades */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        {[...Array(8)].map((_, i) => (
          <motion.div
            key={i}
            className="absolute text-[#bb0000] opacity-10"
            style={{
              left: `${Math.random() * 100}%`,
              top: `${Math.random() * 100}%`,
              fontSize: `${Math.random() * 1.5 + 1}rem`,
            }}
            animate={{
              y: [0, -70, 0],
              rotate: [0, 360],
              opacity: [0.1, 0.3, 0.1],
            }}
            transition={{
              duration: 14 + Math.random() * 4,
              repeat: Infinity,
              delay: Math.random() * 3,
              ease: "easeInOut",
            }}
          >
            ♠
          </motion.div>
        ))}
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
            NOSSOS <span className="text-[#bb0000]">PARCEIROS</span>
          </h2>
          <p className="text-xl text-gray-300 max-w-2xl mx-auto">
            Colaboramos com as principais empresas da indústria gaming mundial
          </p>
        </motion.div>

        <div className="flex flex-wrap justify-center gap-6 max-w-5xl mx-auto mb-12">
          {partners.map((partner, index) => (
            <motion.div
              key={index}
              initial={{ opacity: 0, scale: 0.8 }}
              whileInView={{ opacity: 1, scale: 1 }}
              viewport={{ once: true }}
              transition={{ duration: 0.5, delay: index * 0.1 }}
              whileHover={{ scale: 1.05 }}
              className="group w-[calc(33%-1rem)] min-w-[200px] max-w-[260px]"
            >
              <Card className="bg-gradient-to-br from-gray-900 to-black border-[#bb0000]/30 hover:border-[#bb0000]/60 transition-all duration-300 hover:shadow-xl hover:shadow-[#bb0000]/20 h-full">
                <CardContent className="p-6 flex flex-col items-center justify-center text-center h-full min-h-[200px]">
                  {/* Logo Placeholder -> trocado por imagem quando disponível */}
                  {partner.logo ? (
                    <ImageWithFallback
                      src={partner.logo}
                      alt={`${partner.name} logo`}
                      className="w-20 h-20 mb-4 rounded-lg object-contain border border-[#bb0000]/30 group-hover:border-[#bb0000]/60 transition-all duration-300"
                    />
                  ) : (
                    <div className="relative w-20 h-20 mb-4 bg-gradient-to-br from-gray-800 to-gray-700 border border-[#bb0000]/30 rounded-lg flex items-center justify-center group-hover:border-[#bb0000]/60 transition-all duration-300">
                      <div className="text-gray-500 text-xs font-semibold">LOGO</div>
                    </div>
                  )}

                  <h3 className="text-white font-black text-lg mb-2 group-hover:text-[#bb0000] transition-colors duration-300">
                    {partner.name}
                  </h3>

                  <p className="text-gray-400 text-sm">{partner.category}</p>
                </CardContent>
              </Card>
            </motion.div>
          ))}
        </div>



        {/* Partnership Benefits */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8, delay: 0.3 }}
          className="text-center"
        >
          <h3 className="text-3xl font-black text-white mb-8">
            Por que escolhem a <span className="text-[#bb0000]">4GINNOVATION</span>?
          </h3>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-4xl mx-auto">
            <div className="text-center">
              <div className="w-16 h-16 bg-gradient-to-br from-[#bb0000] to-[#ff3333] rounded-full flex items-center justify-center mx-auto mb-4">
                <span className="text-2xl font-black text-white">Q</span>
              </div>
              <h4 className="text-xl font-black text-white mb-2">Qualidade Premium</h4>
              <p className="text-gray-300">Entregamos produtos com os mais altos padrões de qualidade da indústria.</p>
            </div>

            <div className="text-center">
              <div className="w-16 h-16 bg-gradient-to-br from-[#bb0000] to-[#ff3333] rounded-full flex items-center justify-center mx-auto mb-4">
                <span className="text-2xl font-black text-white">I</span>
              </div>
              <h4 className="text-xl font-black text-white mb-2">Inovação Constante</h4>
              <p className="text-gray-300">Sempre na vanguarda das tecnologias e tendências gaming.</p>
            </div>

            <div className="text-center">
              <div className="w-16 h-16 bg-gradient-to-br from-[#bb0000] to-[#ff3333] rounded-full flex items-center justify-center mx-auto mb-4">
                <span className="text-2xl font-black text-white">P</span>
              </div>
              <h4 className="text-xl font-black text-white mb-2">Parceria Estratégica</h4>
              <p className="text-gray-300">Construímos relacionamentos duradouros e mutuamente benéficos.</p>
            </div>
          </div>
        </motion.div>
      </div>
    </section>
  );
}