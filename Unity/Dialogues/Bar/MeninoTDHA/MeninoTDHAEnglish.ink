EXTERNAL ShowEvidenceMenu()
EXTERNAL SetNpcPortrait(npc)
EXTERNAL SetJessicaEmotion(emotion)

~ SetJessicaEmotion("Happy")
Good afternoon, sir, how are you?

~ SetNpcPortrait("GenericMale")
Uh- g-good afternoon, ma'am, do you need help?

~ SetJessicaEmotion("Talking")
Oh yes, I'm doing an investigation into the sudden disappearance of several animals. Do you mind answering a few questions?

~ SetNpcPortrait("GenericMale")
No-No problem, you can ask whatever you need, I'll answer what I know.

~ SetJessicaEmotion("Normal")
Could you tell me if you reported any suspicious activity this week?

~ SetNpcPortrait("GenericMale")
I'm not sure if I saw anything suspicious, maybe when I went to the bank and the security guard stared at me too much.

I thought the situation was a bit strange.

~ SetJessicaEmotion("Normal")
Please don't change the subject

That doesn't have much to do with the case

~ SetNpcPortrait("GenericMale")
OH, I apologize, ma'am, I didn't mean to make you angry, sometimes I lose my train of thought.

~ SetJessicaEmotion("Normal")
No problem, but please answer me with something accurate or something you know about what was asked.

~ SetNpcPortrait("GenericMale")
My memory is a bit vague, do you have something more specific for me to answer?

~ ShowEvidenceMenu()
-> END