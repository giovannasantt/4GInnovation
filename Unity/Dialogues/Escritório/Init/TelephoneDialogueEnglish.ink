EXTERNAL SetJessicaEmotion(emotion)
EXTERNAL SetNpcPortrait(portrait)
EXTERNAL SetItalic(italic)
EXTERNAL Quit()
EXTERNAL LoadLevel(level)

~ SetNpcPortrait("GenericMale")
Good night.

~ SetJessicaEmotion("Talking")
Good night? Who are you?

~ SetNpcPortrait("GenericMale")
You may call me Mr. E.

Don't worry, I'm here to help.

~ SetJessicaEmotion("Normal")
You're acting quite weirdly for someone who just wants to help.

~ SetNpcPortrait("GenericMale")
My informations are of utmost utility.

I'll stop winding and get to the point, recently in this region there have been various cases of street animals suddenly disappearing.

Don't you find that weird?

~ SetJessicaEmotion("Talking")
It could have been a mere coincidence, maybe a lot of people are adopting them.

~ SetNpcPortrait("GenericMale")
I don't see it in this way, there's something deeper in this.

And if you're still not interested in investigating, I can assure you will be rewarded handsomely.

~ SetJessicaEmotion("Talking")
Is the value high enough to pay for my time?

~ SetNpcPortrait("GenericMale")
4000 sulatinos, I'll pay half before it and the other half after the investigation is complete, does that sound good to you?

* [Yes]
    ~ SetJessicaEmotion("Happy")
    All right, I'll accept it, I can't say I'm not curious as to where this will go.

    ~ SetNpcPortrait("GenericMale")
    Exquisite, thank you for the effort, good night Jessica.

    ~ SetItalic(true)
    Call over
    ~ SetItalic(false)

    ~ SetJessicaEmotion("Normal")
    What a weird guy, but at least I'll be paid well for this, I'll sleep and start the investigation tomorrow.
    ~ LoadLevel("Escritorio1")
    -> END

* [No]
    ~ Quit()
-> END