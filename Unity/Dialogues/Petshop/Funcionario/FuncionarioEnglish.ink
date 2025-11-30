EXTERNAL SetItalic(italic)
EXTERNAL GetItem(item)
EXTERNAL SetJessicaEmotion(emotion)
EXTERNAL SetNpcPortrait(npc)
EXTERNAL CheckPetshopEvidences()

~ SetJessicaEmotion("Talking")
Hello, good morning. Can I ask you a few questions for a statement?

~ SetNpcPortrait("GenericMale")
Of course! What do you want to know about?

* [What's it like working here?]
    -> Opcao1
*[What sector do you work in?]
    -> Opcao2

=== Opcao1 ===
~ SetNpcPortrait("GenericMale")
I really like it. I love animals and I have fun with my colleagues, besides getting paid well.

~ SetJessicaEmotion("Normal")
How long have you been working here?

~ SetNpcPortrait("GenericMale")
Since the pet shop opened, which was recently. It's been less than 2 years and it has already grown quite a lot.

Getting more into this subject, this is something I find strange. An establishment growing so much in such a short time, that's kind of weird, don't you think? It needs a lot of investment money.

This has nothing to do with what you asked, right? My bad, sometimes I end up talking too much.

~ SetJessicaEmotion("Normal")
No problem, I also think that's strange. Anyway, thank you very much for the statement.

~ SetNpcPortrait("GenericMale")
You're welcome!
~ GetItem("DepoimentoFuncionario")
~ CheckPetshopEvidences()
-> END

=== Opcao2 ===
~ SetNpcPortrait("GenericMale")
I work taking care of the animals and performing their exams.

Then I assess their condition. If it's ideal or if they need more care.

After that, a colleague of mine handles the rest of the service.

~ SetJessicaEmotion("Talking")
Do you know what happens next?

~ SetNpcPortrait("GenericMale")
I have no idea. Whenever I ask, he evades the subject or makes up an excuse, I think he's strange.

But something I do know is that he only works the afternoon to evening shift. And he's the one who closes the pet shop, besides being the manager here.

~ SetJessicaEmotion("Normal")
I see... if I happen to run into him, I'll ask more questions.

Anyway, thank you very much.

~ SetNpcPortrait("GenericMale")
You're welcome!
~ GetItem("DepoimentoFuncionario2")
~ CheckPetshopEvidences()
-> END