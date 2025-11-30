EXTERNAL ShowEvidenceMenu()
EXTERNAL SetNpcPortrait(npc)
EXTERNAL SetJessicaEmotion(emotion)

~ SetJessicaEmotion("Happy")
Boa tarde moço, tudo bom?

~ SetNpcPortrait("GenericMale")
Ah- bo-boa tarde moça, a senhora precisa de ajuda?

~ SetJessicaEmotion("Talking")
Ah sim, estou fazendo uma investigação sobre o desaparecimento repentino de diversos animais, se importa em responder algumas perguntas?

~ SetNpcPortrait("GenericMale")
Na-Não tem problema, pode perguntar o que for, eu respondo o que souber.

~ SetJessicaEmotion("Normal")
Você poderia me dizer se acabou relatando alguma atividade suspeita essa semana?

~ SetNpcPortrait("GenericMale")
Não tenho certeza se vi algo suspeito, talvez quando eu fui ao banco e o segurança me encarou demais.

Achei meio estranha a situação.

~ SetJessicaEmotion("Normal")
Por favor não mude de assunto 

Isso não tem muito haver com o caso

~ SetNpcPortrait("GenericMale")
AH, me desculpe moça, não queria a emburrecer, as vezes acabo me perdendo.

~ SetJessicaEmotion("Normal")
Sem problemas, mas por favor me responda algo preciso ou que saiba sobre o que foi perguntado.

~ SetNpcPortrait("GenericMale")
Minha memória está meio vaga, você tem algo mais preciso para eu poder responder?

~ ShowEvidenceMenu()
-> END
