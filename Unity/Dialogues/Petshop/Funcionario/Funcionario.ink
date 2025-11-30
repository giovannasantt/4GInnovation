EXTERNAL SetItalic(italic)
EXTERNAL GetItem(item)
EXTERNAL SetJessicaEmotion(emotion)
EXTERNAL SetNpcPortrait(npc)
EXTERNAL CheckPetshopEvidences()

~ SetJessicaEmotion("Talking")
Olá, bom dia. Eu posso te fazer algumas perguntas para um depoimento?

~ SetNpcPortrait("GenericMale")
Claro! Sobre o que quer saber?

* [Como é trabalhar aqui?]
    -> Opcao1
*[Em que setor você trabalha?]
    -> Opcao2

=== Opcao1 ===
~ SetNpcPortrait("GenericMale")
Eu gosto pra caramba. Adoro animais e me divirto com os meus colegas, além de receber bem.

~ SetJessicaEmotion("Normal")
Você trabalha aqui desde quando?

~ SetNpcPortrait("GenericMale")
Desde que o pet shop abriu, que foi recentemente. Tem menos de 2 anos e ele já cresceu bastante.

Entrando mais sobre esse assunto, isso é algo que eu acho estranho. Um estabelecimento cresceu tanto em tão pouco tempo, isso é meio estranho não acha? Precisa de muito dinheiro de investimento.

Isso não tem nada haver com o que você perguntou né? Foi mal, às vezes acabo falando demais.

~ SetJessicaEmotion("Normal")
Sem problema, eu também acho isso algo estranho. De qualquer modo, muito obrigada pelo depoimento.

~ SetNpcPortrait("GenericMale")
Não há de que!
~ GetItem("DepoimentoFuncionario")
~ CheckPetshopEvidences()
-> END

=== Opcao2 ===
~ SetNpcPortrait("GenericMale")
Eu trabalho no cuidado dos animais e realizando os exames deles.

Depois avalio o seu estado. Se está ideal ou se precisa de mais cuidados.

Depois disso um colega meu conduz o resto do atendimento.

~ SetJessicaEmotion("Talking")
Você sabe o que ocorre depois?

~ SetNpcPortrait("GenericMale")
Não tenho a mínima ideia. Sempre que pergunto ele evade sobre o assunto ou cria uma desculpa, acho ele estranho.

Mas algo que eu sei é que ele só trabalha no expediente da tarde para noite. E é ele quem fecha o pet shop, além de ser o gerente daqui.

~ SetJessicaEmotion("Normal")
Entendi… se caso eu encontrar ele eu faço mais perguntas.

De qualquer forma, muito obrigada.

~ SetNpcPortrait("GenericMale")
Não há de que!
~ GetItem("DepoimentoFuncionario2")
~ CheckPetshopEvidences()
-> END