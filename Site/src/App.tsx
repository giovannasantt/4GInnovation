import { Navbar } from "./components/Navbar";
import { Hero } from "./components/Hero";
import { MVV } from "./components/MVV";
import { Games } from "./components/Games";
import { About } from "./components/About";
import { Team } from "./components/Team";
import { Partners } from "./components/Partners";
import { Contact } from "./components/Contact";
import { Social } from "./components/Social";
import { Footer } from "./components/Footer";
import { Toaster } from "./components/ui/sonner";

export default function App() {
  return (
    <div className="min-h-screen bg-black">
      <Navbar />
      <section id="hero">
        <Hero />
      </section>
      <section id="mvv">
        <MVV />
      </section>
      <section id="games">
        <Games />
      </section>
      <section id="about">
        <About />
      </section>
      <section id="team">
        <Team />
      </section>
      <section id="partners">
        <Partners />
      </section>
      <section id="contact">
        <Contact />
      </section>
      <section id="social">
        <Social />
      </section>
      <Footer />
      <Toaster />
    </div>
  );
}