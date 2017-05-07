BEGIN RLSildah

IF ~Global("RLSildah","GLOBAL",0)~ THEN BEGIN RLSildah

SAY ~(Thumping the ground with the end of her staff, the gnarled old woman pins you with an angry glare.) So ye would seek to bring yer murderin' ways to me own door? Ye may 'ave the run 'o things outside me home, but mind yer step 'round here. These creatures be mine, an' I'll not 'ave ya harm a one o' 'em.~
 
= ~Back off, the lot of ya!~

++ ~These are your... pets?~ + sild.2

++ ~We mean you no harm, dear woman. I couldn't help but notice that you are surrounded by the same creatures that have given us so much trouble in this area. I simply wondered if you needed any assistance.~ + sild.7

++ ~We mean neither you nor your pets any harm.~ + sild.2

++ ~(shrug) As long as they leave me alone I don't see any need to harm your pets.~ + sild.2

++ ~I suggest you do the backing off, old woman.~ + sild.8

END

IF ~~ THEN BEGIN sild.7

SAY ~It is ye who'll be needin' assistance if ya harm one o’ me own.~

++ ~I assure you that I have no intention of harming your pets.~ + sild.2

END

IF ~~ THEN BEGIN sild.8

SAY ~So that's the way ye'll have it, <PRO_GIRLBOY>.~

IF ~~ THEN DO ~SetGlobal("RLSildah","GLOBAL",3)  
 ActionOverride("RLHenry",Enemy()) ActionOverride("RLGertru",Enemy()) ActionOverride("RLDearie",Enemy())
 ActionOverride("RLSamuel",Enemy()) ActionOverride("RLDaisy",Enemy()) ActionOverride("RLCaleb",Enemy()) Enemy()~
 
EXIT

END

IF ~~ THEN BEGIN sild.2

SAY ~(Her glare darkening, she raises her staff in the direction of your party.) Pets? Be these your pets then?~

++ ~Uhh... No, they are my friends.~ + sild.3

++ ~Of course not, they are my companions.~ + sild.3

++ ~No, they are my colleagues.~ + sild.3

++ ~Pets? Of course not.~ + sild.3

END

IF ~~ THEN BEGIN sild.3

SAY ~(With a satisfied thud of her staff she nods.) These creatures be no less t' me.~

++ ~I meant no offence. It's just that all the spiders that we have encountered here, up until now, have been hostile to us. We only killed them in self defense.~ + sild.4

++ ~I understand that these creatures are important to you. But you must admit that not all of the spiders in this forest are as docile as yours appear to be.~ + sild.4

++ ~Surely you're not comparing my companions to the spiders of this forest. The bloodthirsty things attack us on sight.~ + sild.5

END

IF ~~ THEN BEGIN sild.4

SAY ~Is that so...~ IF ~~ + sild.5 

END

IF ~~ THEN BEGIN sild.5

SAY ~An' how would you be actin' if strange beasts came trompin' about in yer home?~
 
= ~Make no mistake, this forest be their home, not yours.~

++ ~I see what you mean, but surely you can understand our need to defend ourselves.~ + sild.9

++ ~We have only defended ourselves.~ + sild.9

++ ~I'm sorry that it was necessary to kill the beasts, but we must defend ourselves.~ + sild.9

++ ~I don't need to explain myself to you, woman. Get out of my way.~ + sild.8

END

IF ~~ THEN BEGIN sild.9

SAY ~(sigh) Aye, an' you'll be havin' a grand reason as t' why ya simply must tromp about here.~ 

= ~(With a weary shake of her head, she waves a dismissive hand.) Well, best be back t' yer savin' or conquerin', or whatever ye be up to. Jus' be keepin' clear o' me an' mine.~

++ ~I can assure you that we will not harm any more spiders then we have to.~ + sild.11

++ ~As you wish. We mean you and yours no harm.~ + sild.11

++ ~I fully intend to. Just keep those nasty things of yours away from me.~ 

DO ~SetGlobal("RLSildah", "GLOBAL", 2)~ EXIT

END

IF ~~ THEN BEGIN sild.11

SAY ~Hmph... So ya say.~
 
= ~If ye be wantin' t' be of use while yer up to yer murderin', there is somthin' ye can do.~
 
= ~If ye can manage not t' destroy the poor things in yer killin' of 'em, bring me back their bodies.~

++ ~You want their dead bodies?~ + sild.14

END

IF ~~ THEN BEGIN sild.14

SAY ~Phft... Death need not always be the end o' things. But the creatures must be intact. Don't be botherin' t’ bring me a mangled mess.~ 

= ~If ye can do that, in exchange I'll give ya a potion that'll clear any bother their bites might be causin' ya.~
 
= ~I have use o' their venom as well. If ye happen t' gather any, I'll give ya yer choice o' one o' the trinkets I make t' be dealin' with those who'd harm me own.~

IF ~~ THEN DO ~SetGlobal("RLSildah", "GLOBAL", 1)~ 

EXIT

END

IF ~Global("RLSildah", "GLOBAL", 2)~ THEN BEGIN RLSildaTicked

SAY ~Jus' be keepin' clear o' me an' mine.~

IF ~~ EXIT

END

IF ~Global("RLSildah", "GLOBAL", 1) PartyHasItem("RLSpVeB")~ THEN BEGIN RLSildahBody

SAY ~Aww... The poor wee thing!~ 

= ~Ye 'ave me gratitude. Take this, it'll take the sting out o' any bites ye suffer.~

IF ~~ DO ~CreateItem("POTN20",1,1,0) GiveItem("POTN20",LastTalkedToBy(Myself)) TakePartyItemNum("RLSpVeB",1)
SetGlobal("RLSildahLikes", "GLOBAL", 1) SetGlobal("RLSpVeB", "GLOBAL", 1)~

EXIT

END

IF ~Global("RLSildah", "GLOBAL", 1)PartyHasItem("RLSpVen")~ THEN BEGIN RLSildahVenom

SAY ~(Cradling the small vial with gnarled fingers, she lifts it to catch the light.) This will do. What suits ya best, dart, arrow or bolt?~

++ ~Dart~ DO ~CreateItem("DART04",1,1,0) GiveItem("DART04",LastTalkedToBy(Myself)) TakePartyItemNum("RLSpVen",1)~ EXIT 

++ ~Arrow~ DO ~CreateItem("AROW05",1,1,0) GiveItem("AROW05",LastTalkedToBy(Myself)) TakePartyItemNum("RLSpVen",1)~ EXIT 

++ ~Bolt~ DO ~CreateItem("BOLT04",1,1,0) GiveItem("Bolt04",LastTalkedToBy(Myself)) TakePartyItemNum("RLSpVen",1)~ EXIT 


END


IF ~Global("RLSildah", "GLOBAL", 1)~ THEN BEGIN RLSildahNone

SAY ~I see nothin' I can use. Come back when ye hav' somthin' for me.~

IF ~~ EXIT

END




