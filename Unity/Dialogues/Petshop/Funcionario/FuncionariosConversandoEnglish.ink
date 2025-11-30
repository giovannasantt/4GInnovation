EXTERNAL SetItalic(italic)
EXTERNAL GetItem(item)
EXTERNAL SetJessicaEmotion(emotion)
EXTERNAL SetNpcPortrait(npc)
EXTERNAL CheckPetshopEvidences()
EXTERNAL PlaySound(sound)

~ SetNpcPortrait("GenericMale")
The truck will arrive in a few hours. Let's organize the cages for them to board.

~ SetNpcPortrait("GenericFemale")
Let's go, we're still mid-week and the shipment we're sending was very good. We'll make a good profit this month if it continues like this.

~ SetNpcPortrait("GenericMale")
Yes. Not to mention they are leaving in excellent condition, they will probably pay even more than normal.

Anyway, let's stop stalling and start getting things ready. We can't miss today's shipments.

~ SetNpcPortrait("GenericFemale")
What time does the truck usually leave?

~ SetNpcPortrait("GenericMale")
It usually comes after the pet shop closes and leaves during the early hours of the morning. But, specifically today, I asked them to come earlier. We have a lot to load, and it will take longer than usual.

~ SetNpcPortrait("GenericFemale")
I see, let's get started then.

~ SetJessicaEmotion("Normal")
There is something very wrong with this conversation. Truck? Shipment? Them? Only at night? I need to investigate this better tonight.
~ PlaySound("Photo")
~ GetItem("FotoEmbarque")
~ CheckPetshopEvidences()
-> END