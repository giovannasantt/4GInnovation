EXTERNAL SetItalic(italic)
EXTERNAL GetItem(item)
EXTERNAL SetJessicaEmotion(emotion)
EXTERNAL SetNpcPortrait(npc)
EXTERNAL CheckPetshopEvidences()
EXTERNAL PlaySound(sound)

~ SetNpcPortrait("GenericMale")
O caminhão vai chegar em poucas horas. Vamos organizar as jaulas para eles embarcarem.

~ SetNpcPortrait("GenericFemale")
Vamos, a gente ainda está no meio da semana e a remessa que estamos enviando foi muito boa. Iremos lucrar bem esse mês se continuar assim.

~ SetNpcPortrait("GenericMale")
Sim. Sem contar que eles estão indo em ótimo estado, eles provavelmente irão pagar até mais que o normal.

Enfim, vamos parar de enrolar e começar a arrumar as coisas. Não podemos perder os embarques de hoje.

~ SetNpcPortrait("GenericFemale")
O caminhão normalmente sai que horas?

~ SetNpcPortrait("GenericMale")
Geralmente ele vem após o pet shop fechar, e sai durante a madrugada. Mas, especificamente hoje, pedi para eles virem mais cedo. Temos muita coisa para embarcar, e vai demorar mais do que o normal.

~ SetNpcPortrait("GenericFemale")
Entendi, vamos começar então.

~ SetJessicaEmotion("Normal")
Tem algo de muito errado nessa conversa. Caminhão? Embarque? Eles? Apenas à noite? Preciso investigar melhor isso hoje a noite.
~ PlaySound("Photo")
~ GetItem("FotoEmbarque")
~ CheckPetshopEvidences()
-> END