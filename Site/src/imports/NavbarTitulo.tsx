// @ts-ignore
import imgNavbarNaipe from "../assets/naipe.png";

export default function NavbarTitulo() {
  return (
    <div className="relative size-full" data-name="navbarTitulo">
      <p className="absolute font-['Perandory:Regular',_sans-serif] leading-[normal] left-0 not-italic text-[0px] text-[96px] text-black text-nowrap top-[25px] whitespace-pre">
        4GI<span className="text-white">nnovation</span>
      </p>
      <div className="absolute h-[138px] left-[525px] top-0 w-[119px]" data-name="navbarNaipe">
        <img alt="" className="absolute inset-0 max-w-none object-50%-50% object-cover pointer-events-none size-full" src={imgNavbarNaipe} />
      </div>
    </div>
  );
}