VAR hasMindset = false
EXTERNAL SetJessicaEmotion(emotion)
EXTERNAL SetNpcPortrait(npc)
EXTERNAL GetMindset(mindset)
EXTERNAL CheckMindsetUnlocked(mindset)
EXTERNAL SetItalic(italic)
EXTERNAL LoadLevel(level)

~ SetJessicaEmotion("Happy")
Boa tarde moça, tudo bem?

~ SetNpcPortrait("GenericFemale")
Oieeee! Tudo sim minha linda, como posso ajudar?

~ SetJessicaEmotion("Normal")
Eu estou fazendo uma investigação sobre o desaparecimento de diversos  animais de rua recentemente.

Eu posso te fazer algumas perguntas?

~ SetNpcPortrait("GenericFemale")
Clarinho que sim!!

~ CheckMindsetUnlocked("MeninoTDHATestemunho")
-> MindsetCheck

=== MindsetCheck ===
{hasMindset == true:
    -> HasMindset
    -else :
    -> HasMindsetFalse
}

=== HasMindset ===
~ SetJessicaEmotion("Talking")
O garoto que está ali me disse que existe um pet shop na região que suas principais cores são azul e amarelo, você se lembra do nome do pet shop?

~ SetNpcPortrait("GenericFemale")
EU ME LEMBRO!!

Era.. Era..?

Paw Petshop?

Tail Petshop?

SNOUT’S PETSHOP!!!!

É isso!

~ SetItalic(true)
~ SetJessicaEmotion("Normal")
Snout’s Petshop, hmmm, já ouvi falar sobre ele, mas bem vagamente.
~ SetItalic(false)

~ SetJessicaEmotion("Happy")
Você lembra onde ele fica?

É na primeira rua antes daqui meu amor.

Precisa de ajuda com algo a mais?

~ SetJessicaEmotion("Happy")
Não, muito obrigada, você me ajudou demais!

~ GetMindset("SnoutsPetshop")

~ SetNpcPortrait("GenericFemale")
Não há de que!

~ SetJessicaEmotion("Normal")
~ SetItalic(true)
Está ficando tarde, vou voltar para o meu escritório e reunir as pistas.
~ SetItalic(false)
~ LoadLevel("Escritorio2")
-> END

=== HasMindsetFalse ===
~ SetJessicaEmotion("Normal")
Um momento moça, te pergunto depois.

~ SetItalic(true)
Parece que eu não tenho provas suficientes para continuar aqui.
~ SetItalic(false)
-> END