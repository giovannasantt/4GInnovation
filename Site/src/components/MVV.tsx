import { motion } from "motion/react";
import { useEffect, useState } from "react";

export function MVV() {
  const [isInView, setIsInView] = useState(false);
  const [hoveredCard, setHoveredCard] = useState<number | null>(null);

  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsInView(true);
        }
      },
      { threshold: 0.2 }
    );

    const section = document.getElementById("mvv");
    if (section) {
      observer.observe(section);
    }

    return () => observer.disconnect();
  }, []);

  const mvvData = [
    {
      title: "MISSÃO",
      icon: "♠",
      content:
        "Criar experiências de jogos inovadoras que conectem pessoas ao redor do mundo, utilizando tecnologia de ponta e storytelling envolvente.",
      delay: 0.2,
    },
    {
      title: "VISÃO",
      icon: "♠",
      content:
        "Ser reconhecida como uma das principais desenvolvedoras de jogos do Brasil, sendo referência em qualidade e inovação no mercado gaming.",
      delay: 0.4,
    },
    {
      title: "VALORES",
      icon: "♠",
      content:
        "Inovação constante, qualidade excepcional, trabalho em equipe, transparência com nossos players e paixão pelo que fazemos.",
      delay: 0.6,
    },
  ];

  return (
    <section className="relative min-h-screen flex items-center justify-center overflow-hidden bg-black py-16 md:py-20">
      {/* Animated Background Gradients */}
      <div className="absolute inset-0">
        <motion.div
          className="absolute top-0 left-0 w-full h-full bg-gradient-to-br from-[#bb0000]/10 via-transparent to-black"
          animate={{
            opacity: [0.3, 0.5, 0.3],
            scale: [1, 1.1, 1],
          }}
          transition={{
            duration: 8,
            repeat: Infinity,
            ease: "easeInOut",
          }}
        />
        <motion.div
          className="absolute bottom-0 right-0 w-full h-full bg-gradient-to-tl from-[#bb0000]/10 via-transparent to-black"
          animate={{
            opacity: [0.5, 0.3, 0.5],
            scale: [1.1, 1, 1.1],
          }}
          transition={{
            duration: 8,
            repeat: Infinity,
            ease: "easeInOut",
            delay: 4,
          }}
        />
      </div>

      {/* Animated Spade Particles */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        {[...Array(25)].map((_, i) => (
          <motion.div
            key={i}
            className="absolute text-[#bb0000] opacity-10"
            style={{
              left: `${Math.random() * 100}%`,
              top: `${Math.random() * 100}%`,
              fontSize: `${Math.random() * 2 + 0.5}rem`,
            }}
            animate={{
              y: [0, -120, 0],
              x: [0, Math.random() * 60 - 30, 0],
              rotate: [0, 360],
              opacity: [0.1, 0.4, 0.1],
            }}
            transition={{
              duration: 12 + Math.random() * 10,
              repeat: Infinity,
              delay: Math.random() * 5,
              ease: "easeInOut",
            }}
          >
            ♠
          </motion.div>
        ))}
      </div>

      {/* Animated Grid Pattern */}
      <div className="absolute inset-0 opacity-5">
        <motion.div
          className="h-full w-full"
          style={{
            backgroundImage: `linear-gradient(#bb0000 1px, transparent 1px), linear-gradient(90deg, #bb0000 1px, transparent 1px)`,
            backgroundSize: "50px 50px",
          }}
          animate={{
            backgroundPosition: ["0px 0px", "50px 50px"],
          }}
          transition={{
            duration: 20,
            repeat: Infinity,
            ease: "linear",
          }}
        />
      </div>

      {/* Main Content */}
      <div className="relative z-10 max-w-7xl mx-auto px-4 md:px-6 lg:px-8 w-full">
        {/* Section Title */}
        <motion.div
          initial={{ opacity: 0, y: -50 }}
          animate={{ opacity: isInView ? 1 : 0, y: isInView ? 0 : -50 }}
          transition={{ duration: 0.8 }}
          className="text-center mb-12 md:mb-16"
        >
          <div className="flex items-center justify-center gap-3 mb-4">
            <motion.div
              animate={{ rotate: [0, 180, 360] }}
              transition={{ duration: 4, repeat: Infinity, ease: "linear" }}
              className="text-[#bb0000] text-2xl md:text-3xl"
            >
              ♠
            </motion.div>
            <h2 className="text-3xl md:text-5xl lg:text-6xl font-black text-white">
              NOSSOS PILARES
            </h2>
            <motion.div
              animate={{ rotate: [360, 180, 0] }}
              transition={{ duration: 4, repeat: Infinity, ease: "linear" }}
              className="text-[#bb0000] text-2xl md:text-3xl"
            >
              ♠
            </motion.div>
          </div>
          <motion.div
            initial={{ scaleX: 0 }}
            animate={{ scaleX: isInView ? 1 : 0 }}
            transition={{ delay: 0.5, duration: 1 }}
            className="h-1 w-32 md:w-48 mx-auto bg-gradient-to-r from-transparent via-[#bb0000] to-transparent"
          />
        </motion.div>

        {/* MVV Cards Grid */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 md:gap-8 lg:gap-10">
          {mvvData.map((item, index) => (
            <motion.div
              key={item.title}
              initial={{ opacity: 0, y: 50, scale: 0.9 }}
              animate={{
                opacity: isInView ? 1 : 0,
                y: isInView ? 0 : 50,
                scale: isInView ? 1 : 0.9,
              }}
              transition={{
                delay: item.delay,
                duration: 0.8,
                type: "spring",
                stiffness: 100,
              }}
              className="group"
              onMouseEnter={() => setHoveredCard(index)}
              onMouseLeave={() => setHoveredCard(null)}
            >
              <motion.div
                whileHover={{ y: -10, scale: 1.02 }}
                transition={{ duration: 0.3 }}
                className="relative h-full"
              >
                {/* Card */}
                <div className="relative h-full bg-gradient-to-br from-gray-900 to-black border-2 border-[#bb0000]/30 rounded-2xl p-6 md:p-8 overflow-hidden transition-all duration-300 group-hover:border-[#bb0000] group-hover:shadow-2xl group-hover:shadow-[#bb0000]/20">
                  
                  {/* Orbiting Spades on Hover - Aplicado em todos os cards */}
                  {hoveredCard === index && (
                    <motion.div
                      initial={{ opacity: 0 }}
                      animate={{
                        rotate: [0, 360],
                        opacity: 1,
                      }}
                      exit={{ opacity: 0 }}
                      transition={{
                        rotate: {
                          duration: 8,
                          repeat: Infinity,
                          ease: "linear",
                        },
                        opacity: {
                          duration: 0.3,
                        },
                      }}
                      className="absolute inset-0 pointer-events-none z-10"
                    >
                      <div className="absolute top-3 left-1/2 -translate-x-1/2 text-white/60 text-xl">
                        ♠
                      </div>
                      <div className="absolute bottom-3 left-1/2 -translate-x-1/2 text-white/60 text-xl">
                        ♠
                      </div>
                      <div className="absolute left-3 top-1/2 -translate-y-1/2 text-white/60 text-xl">
                        ♠
                      </div>
                      <div className="absolute right-3 top-1/2 -translate-y-1/2 text-white/60 text-xl">
                        ♠
                      </div>
                    </motion.div>
                  )}

                  {/* Hover Glow Effect */}
                  <motion.div
                    className="absolute inset-0 bg-gradient-to-br from-[#bb0000]/0 to-[#bb0000]/0 group-hover:from-[#bb0000]/5 group-hover:to-[#bb0000]/10 transition-all duration-500 rounded-2xl"
                    initial={{ opacity: 0 }}
                    whileHover={{ opacity: 1 }}
                  />

                  {/* Icon Circle */}
                  <motion.div
                    className="relative mx-auto w-20 h-20 md:w-24 md:h-24 mb-6 rounded-full bg-gradient-to-br from-[#bb0000] to-[#990000] flex items-center justify-center border-4 border-white/10 shadow-lg"
                    whileHover={{ rotate: 360, scale: 1.1 }}
                    transition={{ duration: 0.6 }}
                  >
                    <span
                      className={`text-4xl md:text-5xl transition-colors duration-300 ${
                        hoveredCard === index ? "text-white" : "text-[#bb0000]"
                      }`}
                    >
                      {item.icon}
                    </span>
                    {/* Pulsing Ring */}
                    <motion.div
                      className="absolute inset-0 rounded-full border-2 border-[#bb0000]"
                      animate={{
                        scale: [1, 1.3, 1],
                        opacity: [0.8, 0, 0.8],
                      }}
                      transition={{
                        duration: 2,
                        repeat: Infinity,
                        ease: "easeInOut",
                      }}
                    />
                  </motion.div>

                  {/* Title */}
                  <h3 className="text-2xl md:text-3xl font-black text-[#bb0000] text-center mb-4 tracking-wider">
                    {item.title}
                  </h3>

                  {/* Divider */}
                  <motion.div
                    className="h-0.5 w-16 mx-auto mb-4 bg-gradient-to-r from-transparent via-[#bb0000] to-transparent"
                    initial={{ scaleX: 0 }}
                    animate={{ scaleX: isInView ? 1 : 0 }}
                    transition={{ delay: item.delay + 0.3, duration: 0.8 }}
                  />

                  {/* Content */}
                  <p className="text-gray-300 text-center leading-relaxed text-sm md:text-base">
                    {item.content}
                  </p>

                  {/* Bottom Accent Line */}
                  <motion.div
                    className="absolute bottom-0 left-0 right-0 h-1 bg-gradient-to-r from-transparent via-[#bb0000] to-transparent"
                    initial={{ scaleX: 0 }}
                    whileHover={{ scaleX: 1 }}
                    transition={{ duration: 0.3 }}
                  />
                </div>

                {/* Card Number Badge */}
                <div className="absolute -top-4 -right-4 w-12 h-12 bg-gradient-to-br from-[#bb0000] to-[#990000] rounded-full flex items-center justify-center border-4 border-black shadow-xl">
                  <span className="text-white font-black text-lg">
                    {index + 1}
                  </span>
                </div>
              </motion.div>
            </motion.div>
          ))}
        </div>

        {/* Bottom Decorative Line */}
        <motion.div
          initial={{ scaleX: 0 }}
          animate={{ scaleX: isInView ? 1 : 0 }}
          transition={{ delay: 1, duration: 1.5 }}
          className="mt-12 md:mt-16 h-px w-full max-w-4xl mx-auto bg-gradient-to-r from-transparent via-[#bb0000] to-transparent"
        />
      </div>

      {/* Edge Gradients for smooth transitions */}
      <div className="absolute top-0 left-0 right-0 h-32 bg-gradient-to-b from-black to-transparent pointer-events-none" />
      <div className="absolute bottom-0 left-0 right-0 h-32 bg-gradient-to-t from-black to-transparent pointer-events-none" />
    </section>
  );
}
