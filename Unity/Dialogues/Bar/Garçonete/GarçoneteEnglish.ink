VAR hasMindset = false
EXTERNAL SetJessicaEmotion(emotion)
EXTERNAL SetNpcPortrait(npc)
EXTERNAL GetMindset(mindset)
EXTERNAL CheckMindsetUnlocked(mindset)
EXTERNAL SetItalic(italic)
EXTERNAL LoadLevel(level)

~ SetJessicaEmotion("Happy")
Good afternoon ma'am, are you doing well?

~ SetNpcPortrait("GenericFemale")
Hiii! sure is sweetie, how may I help you?

~ SetJessicaEmotion("Normal")
I'm conducting an investigation about the disappearance of street animals around this area.

May I ask you some questions?

~ SetNpcPortrait("GenericFemale")
Of course!!

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
The kid over there told me that there was a pet shop in this region that uses blue and yellow as its main colors, do you remember the name for it?

~ SetNpcPortrait("GenericFemale")
I DO!!

It was.. it was..?

Paw Petshop?

Tail Petshop?

SNOUT’S PETSHOP!!!!

That's it!

~ SetItalic(true)
~ SetJessicaEmotion("Normal")
Snout’s Petshop, hmmm, I've heard about it before, although very briefly.
~ SetItalic(false)

~ SetJessicaEmotion("Happy")
Do you remember where it's located?

The street right before this one my love.

Need anything else?

~ SetJessicaEmotion("Happy")
No thank you, you helped me so much!

~ GetMindset("SnoutsPetshop")

~ SetNpcPortrait("GenericFemale")
No problem!

~ SetJessicaEmotion("Normal")
~ SetItalic(true)
It's getting late, I should go back to my office and carefully look at the evidence again.
~ SetItalic(false)
~ LoadLevel("Escritorio2")
-> END

=== HasMindsetFalse ===
~ SetJessicaEmotion("Normal")
A moment ma'am, I'll ask you those questions later.

~ SetItalic(true)
Looks like I don't have enough evidence to continue here.
~ SetItalic(false)
-> END