import { motion } from "motion/react";
import { Card, CardContent } from "./ui/card";
import { Badge } from "./ui/badge";
import { Linkedin, Github, Twitter } from "lucide-react";
import { ImageWithFallback } from "./figma/ImageWithFallback";

export function Team() {
  const teamMembers = [
    {
      name: "Bruno S. Ichikawa",
      role: "Web/Mobile Developer",
      speciality: "Development",
      image: "src/assets/brunoFoto.png",
      description: "Especialista em desenvolvimento web e mobile, responsável pela arquitetura tecnológica dos projetos.",
      social: {
        linkedin: "#",
        github: "#",
        twitter: "#"
      }
    },
    {
      name: "Giovanna C. de Santana",
      role: "3D Modeler",
      speciality: "3D Modeling",
      image: "src/assets/GioFoto.png",
      description: "Artista 3D especializada na criação de modelos, texturas e assets visuais dos jogos.",
      social: {
        linkedin: "#",
        github: "#",
        twitter: "#"
      }
    },
    {
      name: "Igor Michelini Pereira",
      role: "Game Developer",
      speciality: "Game Development",
      image: "src/assets/IgorFoto.png",
      description: "Desenvolvedor de jogos focado na programação de mecânicas e sistemas de gameplay.",
      social: {
        linkedin: "#",
        github: "#",
        twitter: "#"
      }
    },
    {
      name: "Gabriel L. Villarinho",
      role: "Level Designer",
      speciality: "Level Design",
      image: "src/assets/gabrielFoto.jpg",
      description: "Designer responsável pela criação e estruturação dos níveis e ambientes dos jogos.",
      social: {
        linkedin: "#",
        github: "#",
        twitter: "#"
      }
    },
    {
      name: "Guilherme S. Pereira",
      role: "Sound Designer",
      speciality: "Audio Design",
      image: "src/assets/AbelhaFoto.png",
      description: "Especialista em design de áudio, criação de trilhas sonoras e efeitos sonoros.",
      social: {
        linkedin: "#",
        github: "#",
        twitter: "#"
      }
    },
    {
      name: "Kevin N. Bezerra",
      role: "Concept Artist",
      speciality: "Concept Art",
      image: "src/assets/KevinFoto.png",
      description: "Artista conceitual responsável pela criação da identidade visual e conceitos artísticos.",
      social: {
        linkedin: "#",
        github: "#",
        twitter: "#"
      }
    }
  ];

  return (
    <section className="py-20 relative overflow-hidden bg-black">
      {/* Animated Grid Background */}
      <div className="absolute inset-0 opacity-10">
        <motion.div
          className="h-full w-full"
          style={{
            backgroundImage: `
              linear-gradient(#bb0000 1px, transparent 1px),
              linear-gradient(90deg, #bb0000 1px, transparent 1px)
            `,
            backgroundSize: "60px 60px",
          }}
          animate={{
            backgroundPosition: ["0px 0px", "60px 60px"],
          }}
          transition={{
            duration: 25,
            repeat: Infinity,
            ease: "linear",
          }}
        />
      </div>

      {/* Radial Glow Effects */}
      <motion.div
        className="absolute top-1/4 left-1/4 w-96 h-96 bg-[#bb0000]/10 rounded-full blur-3xl"
        animate={{
          scale: [1, 1.3, 1],
          opacity: [0.2, 0.4, 0.2],
        }}
        transition={{
          duration: 7,
          repeat: Infinity,
          ease: "easeInOut",
        }}
      />
      <motion.div
        className="absolute bottom-1/4 right-1/4 w-96 h-96 bg-[#bb0000]/10 rounded-full blur-3xl"
        animate={{
          scale: [1.3, 1, 1.3],
          opacity: [0.4, 0.2, 0.4],
        }}
        transition={{
          duration: 7,
          repeat: Infinity,
          ease: "easeInOut",
          delay: 3.5,
        }}
      />

      {/* Floating Spades */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        {[...Array(10)].map((_, i) => (
          <motion.div
            key={i}
            className="absolute text-[#bb0000] opacity-10"
            style={{
              left: `${Math.random() * 100}%`,
              top: `${Math.random() * 100}%`,
              fontSize: `${Math.random() * 2 + 0.8}rem`,
            }}
            animate={{
              y: [0, -60, 0],
              rotate: [0, 180, 360],
              opacity: [0.1, 0.3, 0.1],
            }}
            transition={{
              duration: 12 + Math.random() * 6,
              repeat: Infinity,
              delay: Math.random() * 4,
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
            NOSSA <span className="text-[#bb0000]">EQUIPE</span>
          </h2>
          <p className="text-xl text-gray-300 max-w-2xl mx-auto">
            Conheça os talentos por trás das experiências gaming revolucionárias
          </p>
        </motion.div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-7xl mx-auto">
          {teamMembers.map((member, index) => (
            <motion.div
              key={index}
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.6, delay: index * 0.1 }}
            >
              <Card className="bg-gradient-to-br from-gray-900 to-black border-[#bb0000]/30 overflow-hidden group hover:border-[#bb0000]/60 transition-all duration-300 hover:shadow-xl hover:shadow-[#bb0000]/20">
                <div className="relative">
                  <ImageWithFallback
                    src={member.image}
                    alt={member.name}
                    className="w-full h-64 object-cover transition-transform duration-500 group-hover:scale-110"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent"></div>
                  <div className="absolute top-4 right-4">
                    <Badge className="bg-[#bb0000] text-white">
                      {member.speciality}
                    </Badge>
                  </div>
                </div>

                <CardContent className="p-6">
                  <div className="text-center mb-4">
                    <h3 className="text-xl font-black text-white mb-1">{member.name}</h3>
                    <p className="text-[#bb0000] font-semibold">{member.role}</p>
                  </div>
                  
                  <p className="text-gray-300 text-sm leading-relaxed mb-6">
                    {member.description}
                  </p>

                  <div className="flex justify-center gap-4">
                    <motion.a
                      href={member.social.linkedin}
                      whileHover={{ scale: 1.1 }}
                      whileTap={{ scale: 0.95 }}
                      className="w-10 h-10 bg-gradient-to-br from-gray-800 to-gray-900 border border-[#bb0000]/30 rounded-full flex items-center justify-center hover:border-[#bb0000]/60 transition-all duration-300"
                    >
                      <Linkedin className="w-4 h-4 text-gray-300 hover:text-[#bb0000] transition-colors" />
                    </motion.a>
                    <motion.a
                      href={member.social.github}
                      whileHover={{ scale: 1.1 }}
                      whileTap={{ scale: 0.95 }}
                      className="w-10 h-10 bg-gradient-to-br from-gray-800 to-gray-900 border border-[#bb0000]/30 rounded-full flex items-center justify-center hover:border-[#bb0000]/60 transition-all duration-300"
                    >
                      <Github className="w-4 h-4 text-gray-300 hover:text-[#bb0000] transition-colors" />
                    </motion.a>
                    <motion.a
                      href={member.social.twitter}
                      whileHover={{ scale: 1.1 }}
                      whileTap={{ scale: 0.95 }}
                      className="w-10 h-10 bg-gradient-to-br from-gray-800 to-gray-900 border border-[#bb0000]/30 rounded-full flex items-center justify-center hover:border-[#bb0000]/60 transition-all duration-300"
                    >
                      <Twitter className="w-4 h-4 text-gray-300 hover:text-[#bb0000] transition-colors" />
                    </motion.a>
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