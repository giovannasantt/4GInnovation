EXTERNAL SetJessicaEmotion(emotion)
EXTERNAL SetNpcPortrait(portrait)
EXTERNAL SetItalic(italic)
EXTERNAL Quit()
EXTERNAL LoadLevel(level)

~ SetNpcPortrait("GenericMale")
Boa noite.

~ SetJessicaEmotion("Talking")
Boa noite? Quem é você?

~ SetNpcPortrait("GenericMale")
Você pode me chamar apenas de Senhor E.

Mas não se preocupe, estou aqui para te ajudar.

~ SetJessicaEmotion("Normal")
Você está sendo alguém muito suspeito para quem quer ajudar.

~ SetNpcPortrait("GenericMale")
não se preocupe, as informações que eu irei te dar serão de extrema utilidade.

Vou parar de enrolação e ir direto ao assunto, ultimamente pela região estão tendo diversos casos de desaparecimento de animais de rua de forma repentina.

Justamente pela área em volta, você não acha isso estranho?

~ SetJessicaEmotion("Talking")
E isso é um caso de denúncia para uma investigadora? Só deve ter sido uma coincidência de diversas pessoas adotando eles.

~ SetNpcPortrait("GenericMale")
Eu não vejo como algo tão simples assim, eu consigo enxergar que existe algo mais fundo nisso.

E se você ainda não estiver dedicada a investigar, eu posso dizer que irei pagar muito bem por essa investigação.

~ SetJessicaEmotion("Talking")
Espero que seja um valor que pague o meu tempo.

~ SetNpcPortrait("GenericMale")
Serão 4000 sulatinos, irei pagar metade antes da investigação e metade após o fim do caso, você aceita?

* [Sim]
    ~ SetJessicaEmotion("Happy")
    Tá bom, eu aceito a sua investigação, estou curiosa para ver onde isso irá chegar.

    ~ SetNpcPortrait("GenericMale")
    Que esplêndido, muito obrigado pelo seu empenho, nos vemos novamente no fim do caso, uma boa noite Jéssica.

    ~ SetItalic(true)
    Telefone desliga
    ~ SetItalic(false)

    ~ SetJessicaEmotion("Normal")
    Que cara mais estranho, mas pelo menos irei receber bem pelo caso, vou dormir agora, amanhã início a investigação.
    ~ LoadLevel("Escritorio1")
    -> END

* [Não]
    ~ Quit()
-> END