import { motion } from "motion/react";
import { Card, CardContent } from "./ui/card";
import { Badge } from "./ui/badge";
import { Button } from "./ui/button";
import { Heart, MessageCircle, Share, Calendar, Users, Gamepad2 } from "lucide-react";
import { ImageWithFallback } from "./figma/ImageWithFallback";

export function Social() {
  const posts = [
    {
      id: 1,
      type: "event",
      title: "Three Nights in Uridnarac na Mostra Cultural",
      content: "Foi incrível apresentar nosso jogo Three Nights in Uridnarac na Mostra Cultural da ETEC Prof. Basilides de Godoy! Agradecemos a todos que vieram conhecer nosso projeto e pelo feedback positivo. A paixão pelos jogos nos move a criar experiências cada vez melhores!",
      image: "https://images.unsplash.com/photo-1614738499301-d2eed34f7b11?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxnYW1lJTIwcHJlc2VudGF0aW9uJTIwc2Nob29sJTIwZXZlbnQlMjBjdWx0dXJhbHxlbnwxfHx8fDE3NTg4OTU5MDh8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      date: "1 semana atrás",
      category: "Evento"
    },
    {
      id: 2,
      type: "update",
      title: "Novo Visual do Site",
      content: "Estamos orgulhosos de apresentar o novo design do nosso site! Com uma identidade visual renovada que reflete nossa paixão por jogos e inovação, agora vocês podem navegar por nossos projetos de forma ainda mais imersiva. O que acharam do novo layout?",
      image: "https://images.unsplash.com/photo-1637937459053-c788742455be?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHx3ZWJzaXRlJTIwZGVzaWduJTIwZGV2ZWxvcG1lbnQlMjBjb21wdXRlciUyMHNjcmVlbnxlbnwxfHx8fDE3NTg4OTU5MTJ8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      date: "3 dias atrás",
      category: "Atualização"
    }
  ];

  // Removido stats conforme solicitado

  return (
    <section className="py-20 relative overflow-hidden bg-gradient-to-b from-gray-900 to-black">
      {/* Animated Dots Pattern */}
      <div className="absolute inset-0 opacity-10">
        <motion.div
          className="h-full w-full"
          style={{
            backgroundImage: `radial-gradient(circle, #bb0000 1px, transparent 1px)`,
            backgroundSize: "30px 30px",
          }}
          animate={{
            backgroundPosition: ["0px 0px", "30px 30px"],
          }}
          transition={{
            duration: 20,
            repeat: Infinity,
            ease: "linear",
          }}
        />
      </div>

      {/* Radial waves */}
      <motion.div
        className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-96 h-96"
        animate={{
          scale: [1, 2, 1],
          opacity: [0.1, 0, 0.1],
        }}
        transition={{
          duration: 4,
          repeat: Infinity,
          ease: "easeOut",
        }}
      >
        <div className="w-full h-full rounded-full border-2 border-[#bb0000]" />
      </motion.div>

      {/* Floating Spades */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        {[...Array(12)].map((_, i) => (
          <motion.div
            key={i}
            className="absolute text-[#bb0000] opacity-10"
            style={{
              left: `${Math.random() * 100}%`,
              top: `${Math.random() * 100}%`,
              fontSize: `${Math.random() * 2 + 0.8}rem`,
            }}
            animate={{
              y: [0, -100, 0],
              rotate: [0, 360],
              opacity: [0.1, 0.4, 0.1],
            }}
            transition={{
              duration: 11 + Math.random() * 6,
              repeat: Infinity,
              delay: Math.random() * 3,
              ease: "easeInOut",
            }}
          >
            ♠
          </motion.div>
        ))}
      </div>

      {/* Gradient orbs */}
      <motion.div
        className="absolute top-0 right-0 w-80 h-80 bg-[#bb0000]/10 rounded-full blur-3xl"
        animate={{
          scale: [1, 1.3, 1],
          opacity: [0.3, 0.5, 0.3],
        }}
        transition={{
          duration: 8,
          repeat: Infinity,
          ease: "easeInOut",
        }}
      />

      <div className="container mx-auto px-4 relative z-10">
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8 }}
          className="text-center mb-16"
        >
          <h2 className="text-5xl md:text-6xl font-black text-white mb-4">
            ÁREA <span className="text-[#bb0000]">SOCIAL</span>
          </h2>
          <p className="text-xl text-gray-300 max-w-2xl mx-auto">
            Fique por dentro das últimas novidades, atualizações e bastidores dos nossos jogos
          </p>
        </motion.div>



        {/* Social Posts */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 max-w-6xl mx-auto">
          {posts.map((post, index) => (
            <motion.div
              key={post.id}
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.6, delay: index * 0.1 }}
            >
              <Card className="bg-gradient-to-br from-gray-900 to-black border-[#bb0000]/30 overflow-hidden group hover:border-[#bb0000]/60 transition-all duration-300 hover:shadow-xl hover:shadow-[#bb0000]/20 h-full">
                <div className="relative overflow-hidden">
                  <ImageWithFallback
                    src={post.image}
                    alt={post.title}
                    className="w-full h-48 object-cover transition-transform duration-500 group-hover:scale-110"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent"></div>
                  <div className="absolute top-4 left-4">
                    <Badge className="bg-[#bb0000] text-white">
                      {post.category}
                    </Badge>
                  </div>
                  <div className="absolute top-4 right-4 text-white text-sm bg-black/50 px-2 py-1 rounded">
                    {post.date}
                  </div>
                </div>

                <CardContent className="p-6">
                  <h3 className="text-xl font-black text-white mb-3">{post.title}</h3>
                  <p className="text-gray-300 leading-relaxed mb-6">{post.content}</p>
                  
                  <div className="flex justify-end pt-4 border-t border-gray-800">
                    <Button 
                      variant="outline" 
                      size="sm"
                      className="border-[#bb0000] text-[#bb0000] hover:bg-[#bb0000] hover:text-white"
                    >
                      Ver Mais
                    </Button>
                  </div>
                </CardContent>
              </Card>
            </motion.div>
          ))}
        </div>

        {/* Call to Action */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8, delay: 0.5 }}
          className="text-center mt-16"
        >
          <h3 className="text-3xl font-black text-white mb-4">
            Junte-se à Nossa <span className="text-[#bb0000]">Comunidade</span>
          </h3>
          <p className="text-gray-300 mb-8 max-w-2xl mx-auto">
            Siga nossas redes sociais para não perder nenhuma novidade, participate de eventos exclusivos e seja o primeiro a testar nossos novos jogos!
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Button className="bg-[#bb0000] hover:bg-[#990000] text-white px-8 py-3">
              Seguir no Instagram
            </Button>
            <Button variant="outline" className="border-[#bb0000] text-[#bb0000] hover:bg-[#bb0000] hover:text-white px-8 py-3">
              Entrar no Discord
            </Button>
            <Button variant="outline" className="border-[#bb0000] text-[#bb0000] hover:bg-[#bb0000] hover:text-white px-8 py-3">
              Seguir no Twitter
            </Button>
          </div>
        </motion.div>
      </div>
    </section>
  );
}