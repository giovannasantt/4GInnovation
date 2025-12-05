import naipe from "../assets/naipe.png";

interface LogoProps {
  size?: "sm" | "md" | "lg" | "xl";
  spadeColor?: string;
  className?: string;
}

export function Logo({ size = "md", spadeColor = "#bb0000", className = "" }: LogoProps) {
  const sizes = {
    sm: { text: "text-lg md:text-2xl", spade: "w-6 h-8 md:w-8 md:h-10" },
    md: { text: "text-2xl md:text-4xl", spade: "w-8 h-10 md:w-12 md:h-15" },
    lg: { text: "text-3xl md:text-6xl", spade: "w-10 h-12 md:w-16 md:h-20" },
    xl: { text: "text-4xl md:text-8xl", spade: "w-12 h-15 md:w-20 md:h-25" },
  };

  const currentSize = sizes[size];

  return (
    <div className={`flex items-center ${className}`}>
      <div className="flex items-center">
        <span
          className={`font-bold ${currentSize.text} text-[#bb0000]`}
          style={{ fontFamily: "Paradory, sans-serif" }}
        >
          4GI
        </span>
        <span
          className={`font-bold ${currentSize.text} text-white`}
          style={{ fontFamily: "Paradory, sans-serif" }}
        >
          NNOVATION
        </span>
      </div>

      <div
        className={`ml-2 md:ml-4 ${currentSize.spade} flex items-center justify-center`}
      >
        <img src={naipe} alt="naipe" className="w-full h-full object-contain" />
      </div>
    </div>
  );
}