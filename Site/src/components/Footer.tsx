import { motion } from "motion/react";
import { Button } from "./ui/button";
import { Input } from "./ui/input";
import { Separator } from "./ui/separator";
import { 
  Instagram, 
  Twitter, 
  Youtube, 
  Linkedin, 
  Github,
  Mail, 
  Phone, 
  MapPin,
  Gamepad2,
  ChevronUp
} from "lucide-react";

export function Footer() {
  const scrollToTop = () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  const footerLinks = {
    company: [
      { name: "Sobre Nós", href: "#about" },
      { name: "Nossa Equipe", href: "#team" },
      { name: "Carreiras", href: "#careers" },
      { name: "Imprensa", href: "#press" }
    ],
    games: [
      { name: "Snout's Case", href: "#games" },
      { name: "Three Nights in Uridnarac", href: "#games" }
    ],
    support: [
      { name: "Central de Ajuda", href: "#support" },
      { name: "Reportar Bug", href: "#support" },
      { name: "Contato", href: "#contact" },
      { name: "FAQ", href: "#faq" }
    ],
    legal: [
      { name: "Política de Privacidade", href: "#privacy" },
      { name: "Termos de Uso", href: "#terms" },
      { name: "LGPD", href: "#lgpd" },
      { name: "Cookies", href: "#cookies" }
    ]
  };

  const socialLinks = [
    { icon: Instagram, href: "#", color: "hover:text-pink-400" },
    { icon: Twitter, href: "#", color: "hover:text-sky-400" },
    { icon: Youtube, href: "#", color: "hover:text-red-400" },
    { icon: Linkedin, href: "#", color: "hover:text-blue-600" },
    { icon: Github, href: "#", color: "hover:text-gray-400" }
  ];

  return (
    <footer className="relative bg-gradient-to-t from-black via-gray-900 to-black border-t border-[#bb0000]/30">
      {/* Scroll to Top Button */}
      <motion.button
        onClick={scrollToTop}
        initial={{ opacity: 0, y: 20 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true }}
        whileHover={{ scale: 1.1 }}
        whileTap={{ scale: 0.95 }}
        className="absolute top-0 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-12 h-12 bg-[#bb0000] hover:bg-[#990000] rounded-full flex items-center justify-center transition-all duration-300 shadow-lg"
      >
        <ChevronUp className="w-6 h-6 text-white" />
      </motion.button>

      <div className="container mx-auto px-4 pt-16 pb-8">
        {/* Main Footer Content */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12 mb-12">
          {/* Company Info */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.6 }}
            className="lg:col-span-1"
          >
            <div className="flex items-center gap-3 mb-6">
              <div className="w-12 h-12 bg-gradient-to-br from-[#bb0000] to-[#ff3333] rounded-xl flex items-center justify-center">
                <span className="text-white text-xl font-black">4G</span>
              </div>
              <span className="text-2xl font-black text-white">INNOVATION</span>
            </div>
            <p className="text-gray-300 leading-relaxed mb-6">
              Desenvolvendo o futuro dos jogos com inovação, qualidade e paixão. Junte-se à revolução gaming brasileira.
            </p>
            
            {/* Contact Info */}
            <div className="space-y-3">
              <div className="flex items-center gap-3 text-gray-300">
                <MapPin className="w-4 h-4 text-[#bb0000]" />
                <span className="text-sm">Av. Paulista, 1578 - São Paulo, SP</span>
              </div>
              <div className="flex items-center gap-3 text-gray-300">
                <Phone className="w-4 h-4 text-[#bb0000]" />
                <span className="text-sm">(11) 9 8765-4321</span>
              </div>
              <div className="flex items-center gap-3 text-gray-300">
                <Mail className="w-4 h-4 text-[#bb0000]" />
                <span className="text-sm">contato@4ginnovation.com</span>
              </div>
            </div>
          </motion.div>

          {/* Quick Links */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.6, delay: 0.1 }}
          >
            <h3 className="text-xl font-black text-white mb-6">Empresa</h3>
            <ul className="space-y-3">
              {footerLinks.company.map((link, index) => (
                <li key={index}>
                  <a 
                    href={link.href}
                    className="text-gray-300 hover:text-[#bb0000] transition-colors duration-300 text-sm"
                  >
                    {link.name}
                  </a>
                </li>
              ))}
            </ul>
          </motion.div>

          {/* Games */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.6, delay: 0.2 }}
          >
            <h3 className="text-xl font-black text-white mb-6">Nossos Jogos</h3>
            <ul className="space-y-3">
              {footerLinks.games.map((link, index) => (
                <li key={index}>
                  <a 
                    href={link.href}
                    className="text-gray-300 hover:text-[#bb0000] transition-colors duration-300 text-sm"
                  >
                    {link.name}
                  </a>
                </li>
              ))}
            </ul>
          </motion.div>

          {/* Newsletter */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.6, delay: 0.3 }}
          >
            <h3 className="text-xl font-black text-white mb-6">Newsletter</h3>
            <p className="text-gray-300 text-sm mb-4">
              Receba as últimas novidades e atualizações dos nossos jogos diretamente no seu e-mail.
            </p>
            <div className="space-y-3">
              <Input
                type="email"
                placeholder="Seu e-mail"
                className="bg-gray-800 border-gray-700 text-white placeholder:text-gray-400 focus:border-[#bb0000]"
              />
              <Button className="w-full bg-[#bb0000] hover:bg-[#990000] text-white">
                Inscrever-se
              </Button>
            </div>
          </motion.div>
        </div>

        <Separator className="bg-gray-800 mb-8" />

        {/* Bottom Footer */}
        <div className="flex flex-col lg:flex-row justify-between items-center gap-6">
          {/* Social Links */}
          <motion.div
            initial={{ opacity: 0, x: -30 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.6 }}
            className="flex items-center gap-4"
          >
            <span className="text-white font-semibold mr-2">Siga-nos:</span>
            {socialLinks.map((social, index) => (
              <motion.a
                key={index}
                href={social.href}
                whileHover={{ scale: 1.2, y: -2 }}
                whileTap={{ scale: 0.9 }}
                className={`w-10 h-10 bg-gradient-to-br from-gray-800 to-gray-900 border border-[#bb0000]/30 rounded-full flex items-center justify-center text-gray-300 ${social.color} hover:border-[#bb0000]/60 transition-all duration-300`}
              >
                <social.icon className="w-5 h-5" />
              </motion.a>
            ))}
          </motion.div>

          {/* Legal Links */}
          <motion.div
            initial={{ opacity: 0, x: 30 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.6 }}
            className="flex flex-wrap items-center gap-6"
          >
            {footerLinks.legal.map((link, index) => (
              <a
                key={index}
                href={link.href}
                className="text-gray-400 hover:text-[#bb0000] transition-colors duration-300 text-sm"
              >
                {link.name}
              </a>
            ))}
          </motion.div>
        </div>

        <Separator className="bg-gray-800 my-8" />

        {/* Copyright */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.6 }}
          className="text-center"
        >
          <div className="flex items-center justify-center gap-2 mb-4">
            <Gamepad2 className="w-5 h-5 text-[#bb0000]" />
            <span className="text-gray-300 text-sm">
              Desenvolvido com paixão pela equipe 4GINNOVATION
            </span>
            <Gamepad2 className="w-5 h-5 text-[#bb0000]" />
          </div>
          <p className="text-gray-400 text-sm">
            © 2024 4GINNOVATION. Todos os direitos reservados. | CNPJ: 12.345.678/0001-90
          </p>
        </motion.div>
      </div>

      {/* Background Effects */}
      <div className="absolute inset-0 bg-[linear-gradient(rgba(187,0,0,0.05)_1px,transparent_1px),linear-gradient(90deg,rgba(187,0,0,0.05)_1px,transparent_1px)] bg-[size:50px_50px] opacity-30 pointer-events-none"></div>
    </footer>
  );
}