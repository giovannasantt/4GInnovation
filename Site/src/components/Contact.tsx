import { motion } from "motion/react";
import { Card, CardContent } from "./ui/card";
import { Button } from "./ui/button";
import { Input } from "./ui/input";
import { Textarea } from "./ui/textarea";
import { Label } from "./ui/label";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "./ui/select";
import { Mail, Phone, MapPin, Clock } from "lucide-react";
import { useState } from "react";
import { toast } from "sonner";

export function Contact() {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    intention: "",
    message: ""
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // Simular envio do formulário
    toast.success("Mensagem enviada com sucesso! Entraremos em contato em breve.");
    setFormData({ name: "", email: "", intention: "", message: "" });
  };

  const handleInputChange = (field: string, value: string) => {
    setFormData(prev => ({ ...prev, [field]: value }));
  };

  const contactInfo = [
    {
      icon: Mail,
      title: "E-mail",
      details: ["contato@4ginnovation.com", "comercial@4ginnovation.com"],
      color: "text-blue-400"
    },
    {
      icon: Phone,
      title: "Telefone",
      details: ["(11) 9 8765-4321", "(11) 3456-7890"],
      color: "text-green-400"
    },
    {
      icon: MapPin,
      title: "Endereço",
      details: ["Av. Paulista, 1578", "São Paulo - SP, 01310-200"],
      color: "text-red-400"
    },
    {
      icon: Clock,
      title: "Horário",
      details: ["Segunda a Sexta: 9h às 18h", "Sábado: 9h às 13h"],
      color: "text-purple-400"
    }
  ];

  return (
    <section className="py-20 relative overflow-hidden bg-gradient-to-b from-black to-gray-900">
      {/* Animated Circuit Pattern */}
      <div className="absolute inset-0 opacity-5">
        <motion.div
          className="h-full w-full"
          style={{
            backgroundImage: `linear-gradient(#bb0000 1px, transparent 1px), linear-gradient(90deg, #bb0000 1px, transparent 1px)`,
            backgroundSize: "40px 40px",
          }}
          animate={{
            backgroundPosition: ["0px 0px", "40px 40px"],
          }}
          transition={{
            duration: 15,
            repeat: Infinity,
            ease: "linear",
          }}
        />
      </div>

      {/* Pulsing gradients */}
      <motion.div
        className="absolute top-1/3 right-0 w-1/3 h-1/3 bg-[#bb0000]/10 rounded-full blur-3xl"
        animate={{
          scale: [1, 1.4, 1],
          opacity: [0.2, 0.5, 0.2],
        }}
        transition={{
          duration: 6,
          repeat: Infinity,
          ease: "easeInOut",
        }}
      />
      <motion.div
        className="absolute bottom-1/3 left-0 w-1/3 h-1/3 bg-[#bb0000]/10 rounded-full blur-3xl"
        animate={{
          scale: [1.4, 1, 1.4],
          opacity: [0.5, 0.2, 0.5],
        }}
        transition={{
          duration: 6,
          repeat: Infinity,
          ease: "easeInOut",
          delay: 3,
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
              fontSize: `${Math.random() * 1.8 + 1}rem`,
            }}
            animate={{
              y: [0, -90, 0],
              x: [0, Math.random() * 30 - 15, 0],
              rotate: [0, 180, 360],
              opacity: [0.1, 0.3, 0.1],
            }}
            transition={{
              duration: 13 + Math.random() * 5,
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
            ENTRE EM <span className="text-[#bb0000]">CONTATO</span>
          </h2>
          <p className="text-xl text-gray-300 max-w-2xl mx-auto">
            Vamos transformar sua ideia em uma experiência gaming extraordinária
          </p>
        </motion.div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 max-w-6xl mx-auto">
          {/* Contact Form */}
          <motion.div
            initial={{ opacity: 0, x: -30 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.8 }}
          >
            <Card className="bg-gradient-to-br from-gray-900 to-black border-[#bb0000]/30">
              <CardContent className="p-8">
                <h3 className="text-2xl font-black text-white mb-6">Envie sua Mensagem</h3>
                <form onSubmit={handleSubmit} className="space-y-6">
                  <div className="space-y-2">
                    <Label htmlFor="name" className="text-white">Nome Completo</Label>
                    <Input
                      id="name"
                      value={formData.name}
                      onChange={(e) => handleInputChange("name", e.target.value)}
                      placeholder="Seu nome completo"
                      className="bg-gray-800 border-gray-700 text-white placeholder:text-gray-400 focus:border-[#bb0000]"
                      required
                    />
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="email" className="text-white">E-mail</Label>
                    <Input
                      id="email"
                      type="email"
                      value={formData.email}
                      onChange={(e) => handleInputChange("email", e.target.value)}
                      placeholder="seu.email@exemplo.com"
                      className="bg-gray-800 border-gray-700 text-white placeholder:text-gray-400 focus:border-[#bb0000]"
                      required
                    />
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="intention" className="text-white">Intenção de Contato</Label>
                    <Select value={formData.intention} onValueChange={(value: string) => handleInputChange("intention", value)}>
                      <SelectTrigger className="bg-gray-800 border-gray-700 text-white focus:border-[#bb0000]">
                        <SelectValue placeholder="Selecione o motivo do contato" />
                      </SelectTrigger>
                      <SelectContent className="bg-gray-800 border-gray-700">
                        <SelectItem value="partnership" className="text-white hover:bg-gray-700">Parceria Comercial</SelectItem>
                        <SelectItem value="development" className="text-white hover:bg-gray-700">Desenvolvimento de Jogo</SelectItem>
                        <SelectItem value="support" className="text-white hover:bg-gray-700">Suporte Técnico</SelectItem>
                        <SelectItem value="career" className="text-white hover:bg-gray-700">Oportunidades de Carreira</SelectItem>
                        <SelectItem value="press" className="text-white hover:bg-gray-700">Imprensa e Mídia</SelectItem>
                        <SelectItem value="other" className="text-white hover:bg-gray-700">Outros Assuntos</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="message" className="text-white">Mensagem</Label>
                    <Textarea
                      id="message"
                      value={formData.message}
                      onChange={(e) => handleInputChange("message", e.target.value)}
                      placeholder="Conte-nos mais sobre seu projeto ou dúvida..."
                      rows={5}
                      className="bg-gray-800 border-gray-700 text-white placeholder:text-gray-400 focus:border-[#bb0000] resize-none"
                      required
                    />
                  </div>

                  <Button 
                    type="submit" 
                    className="w-full bg-[#bb0000] hover:bg-[#990000] text-white py-6 text-lg font-semibold transition-all duration-300 transform hover:scale-105"
                  >
                    Enviar Mensagem
                  </Button>
                </form>
              </CardContent>
            </Card>
          </motion.div>

          {/* Contact Information */}
          <motion.div
            initial={{ opacity: 0, x: 30 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.8, delay: 0.2 }}
            className="space-y-6"
          >
            <div className="space-y-4">
              <h3 className="text-3xl font-black text-white">Informações de Contato</h3>
              <p className="text-gray-300 leading-relaxed">
                Nossa equipe está sempre pronta para atender você. Entre em contato através dos canais abaixo ou visite nosso escritório.
              </p>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              {contactInfo.map((info, index) => (
                <motion.div
                  key={index}
                  initial={{ opacity: 0, y: 20 }}
                  whileInView={{ opacity: 1, y: 0 }}
                  viewport={{ once: true }}
                  transition={{ duration: 0.6, delay: 0.1 * index }}
                  whileHover={{ scale: 1.05 }}
                >
                  <Card className="bg-gradient-to-br from-gray-900 to-black border-[#bb0000]/30 hover:border-[#bb0000]/60 transition-all duration-300 hover:shadow-xl hover:shadow-[#bb0000]/20 h-full">
                    <CardContent className="p-6">
                      <div className="flex items-start gap-4">
                        <div className={`w-12 h-12 rounded-full bg-gradient-to-br from-gray-800 to-gray-900 border border-[#bb0000]/30 flex items-center justify-center flex-shrink-0`}>
                          <info.icon className={`w-6 h-6 ${info.color}`} />
                        </div>
                        <div className="flex-1">
                          <h4 className="text-white font-semibold mb-2">{info.title}</h4>
                          {info.details.map((detail, i) => (
                            <p key={i} className="text-gray-300 text-sm">{detail}</p>
                          ))}
                        </div>
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
              className="bg-gradient-to-br from-[#bb0000]/20 to-[#bb0000]/5 border border-[#bb0000]/30 rounded-2xl p-6 text-center"
            >
              <h4 className="text-2xl font-black text-white mb-3">Pronto para Inovar?</h4>
              <p className="text-gray-300 mb-4">
                Transforme sua visão em realidade com a 4GINNOVATION. Vamos criar o próximo grande sucesso gaming juntos!
              </p>
              <div className="flex flex-col sm:flex-row gap-3 justify-center">
                <Button className="bg-[#bb0000] hover:bg-[#990000] text-white">
                  Solicitar Orçamento
                </Button>
                <Button variant="outline" className="border-[#bb0000] text-[#bb0000] hover:bg-[#bb0000] hover:text-white">
                  Agendar Reunião
                </Button>
              </div>
            </motion.div>
          </motion.div>
        </div>
      </div>
    </section>
  );
}
