VAR sigma = ""
EXTERNAL GetItem(item)
EXTERNAL ShowTalkMenu()
EXTERNAL GetMindset(mindset)
EXTERNAL StartLockPickPuzzle()
EXTERNAL StartPasswordPuzzle()
EXTERNAL SetJessicaEmotion(emotion)

-> Bolsonaro

=== Bolsonaro ===
Skibisi dom odmom odm yes
    ~ SetJessicaEmotion("Talking")
    * [yes yes]
        ~ SetJessicaEmotion("Neutral")
        ~ sigma = "sigma" 
        Você é {sigma}? #speaker: Hudson
        ** [Sim]
            ~ SetJessicaEmotion("Sigma")
            //~ GetItem("InventoryItem")
            //~ ShowTalkMenu()
            //~ GetMindset("MindsetUnlockTest")
            //~ StartLockPickPuzzle()
            //~ StartPasswordPuzzle()
        ** [Não]
            aur
        -- Y 
        -> END
    * [no no]
        -> Sigma("sigma")
-> END

=== Sigma(siga) ===
{siga == "sigma":
    Ooomaga
    -else :
    IIIIniad
}
-> END