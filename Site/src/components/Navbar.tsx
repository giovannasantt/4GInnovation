import { useState, useEffect } from "react";
import { motion } from "motion/react";
import { Menu, X } from "lucide-react";
import { Logo } from "./Logo";
import naipe from "../assets/naipe.png"; // <-- nova linha para importar a imagem

export function Navbar() {
  const [isOpen, setIsOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 50);
    };
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  const navItems = [
    { name: "Home", href: "hero" },
    { name: "MVV", href: "mvv" },
    { name: "Jogos", href: "games" },
    { name: "Sobre", href: "about" },
    { name: "Equipe", href: "team" },
    { name: "Parceiros", href: "partners" },
    { name: "Contato", href: "contact" },
    { name: "Social", href: "social" },
  ];

  const scrollToSection = (sectionId: string) => {
    const element = document.getElementById(sectionId);
    if (element) {
      const offset = 80;
      const elementPosition = element.offsetTop - offset;
      window.scrollTo({
        top: elementPosition,
        behavior: "smooth",
      });
    }
    setIsOpen(false);
  };

  return (
    <>
      <motion.nav
        initial={{ y: -100 }}
        animate={{ y: 0 }}
        transition={{ duration: 0.5 }}
        className={`fixed top-0 left-0 right-0 z-50 transition-all duration-300 ${
          scrolled 
            ? "bg-[#660000]/95 backdrop-blur-md border-b border-white/30" 
            : "bg-[#660000] border-b border-white/20"
        }`}
      >
        <div className="container mx-auto px-4">
          <div className="flex items-center justify-between h-16 md:h-20">
            {/* Desktop Navigation - Left */}
            <div className="hidden lg:flex items-center space-x-6 xl:space-x-8">
              {navItems.slice(0, 4).map((item) => (
                <motion.button
                  key={item.name}
                  onClick={() => scrollToSection(item.href)}
                  className="text-white hover:text-gray-200 transition-colors duration-300 font-semibold relative group text-sm xl:text-base"
                  whileHover={{ scale: 1.05 }}
                  whileTap={{ scale: 0.95 }}
                >
                  {item.name}
                  <span className="absolute -bottom-1 left-0 w-0 h-0.5 bg-white group-hover:w-full transition-all duration-300"></span>
                </motion.button>
              ))}
            </div>

            {/* Logo Central */}
            <motion.div
              initial={{ scale: 0, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              transition={{ delay: 0.2, duration: 0.5 }}
              className="cursor-pointer"
              onClick={() => scrollToSection("hero")}
            >
              <Logo size="sm" spadeColor="#bb0000" />
            </motion.div>

            {/* Desktop Navigation - Right */}
            <div className="hidden lg:flex items-center space-x-6 xl:space-x-8">
              {navItems.slice(4).map((item) => (
                <motion.button
                  key={item.name}
                  onClick={() => scrollToSection(item.href)}
                  className="text-white hover:text-gray-200 transition-colors duration-300 font-semibold relative group text-sm xl:text-base"
                  whileHover={{ scale: 1.05 }}
                  whileTap={{ scale: 0.95 }}
                >
                  {item.name}
                  <span className="absolute -bottom-1 left-0 w-0 h-0.5 bg-white group-hover:w-full transition-all duration-300"></span>
                </motion.button>
              ))}
            </div>

            {/* Mobile Menu Button */}
            <button
              onClick={() => setIsOpen(!isOpen)}
              className="lg:hidden text-white hover:text-gray-200 transition-colors duration-300 p-2"
            >
              {isOpen ? <X size={24} /> : <Menu size={24} />}
            </button>
          </div>

          {/* Mobile Menu */}
          <motion.div
            initial={false}
            animate={{ height: isOpen ? "auto" : 0, opacity: isOpen ? 1 : 0 }}
            transition={{ duration: 0.3 }}
            className="lg:hidden overflow-hidden"
          >
            <div className="bg-[#660000]/95 backdrop-blur-md border-t border-white/20 py-4">
              <div className="flex flex-col space-y-2 px-4">
                {navItems.map((item) => (
                  <motion.button
                    key={item.name}
                    onClick={() => scrollToSection(item.href)}
                    className="text-white hover:text-gray-200 transition-colors duration-300 font-semibold text-left py-3 border-b border-white/20 last:border-b-0 text-lg"
                    whileHover={{ x: 5 }}
                  >
                    {item.name}
                  </motion.button>
                ))}
              </div>
            </div>
          </motion.div>
        </div>

        {/* Spade decorations */}
        <img src={naipe} alt="naipe" className="absolute top-2 left-4 opacity-80 w-5 h-5" />
        <img src={naipe} alt="naipe" className="absolute top-2 right-4 opacity-80 w-5 h-5" />
      </motion.nav>
    </>
  );
}