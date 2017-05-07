BEGIN RLTobias

IF ~Global("RLTobias", "GLOBAL", 0)~ THEN BEGIN RLTobias

SAY ~(Your attention is drawn to a movement in the shadows just outside the soft illumination of your campfire. A tall young man of perhaps fifteen or sixteen summers, steps from the shadows.)~

++ ~(You stand to face the young man.)~ + toby.1

++ ~(You reach for your weapon and stand to face the young man.)~ + toby.1

++ ~Walking unannounced into a stranger's camp in the middle of the night could get you killed, friend. Who are you?~ + toby.1

++ ~Where did you come from?~ + toby.1

END

IF ~~ THEN BEGIN toby.1

SAY ~(Raising placating hands, he takes half a step back into the shadows.) Pardon me, <PRO_SIRMAAM>. I should hav' made myself known afore now. My name be Tobias Tanner, an' I mean no harm.~ 

= ~Don't mean to be disturbin' you none. It's jus' the smell o' that there stew yer fixin' been pullin' on my stomach fer a good bit now. Been missin' my ma's cookin' somthin' fierce this trip. Thought you might not mind sharin' yer meal an' yer fire fer a bit. I won't eat much, nor talk too much, if'n you don't want.~ 

= ~Fact is, it gets a bit lonely out here. My Pa likes it that way. Man o' few words, an' just as soon not waste those on strangers. But I can't say I mind the company o' others, from time t' time.~

++ ~Nice to meet you, Tobias, I'm <CHARNAME>. Pull up a piece of ground. I'll get you a bowl.~ + toby.4

++ ~I'm <CHARNAME>, not that it's any of your business. Get lost. I have no patience for beggars.~ + toby.5 

++ ~I'm <CHARNAME>. I'm sorry, but experience has taught me to be wary of strangers, Tobias. Especially those that appear out of nowhere.~ + toby.6

++ ~I'm <CHARNAME>. If you're hungry, we can share a bowl. Though, you'll understand if I ask you to lay your weapons down over there first.~ + toby.4

END

IF ~~ THEN BEGIN toby.4

SAY ~Much appreciate this, <PRO_SIRMAAM>! Been some time since I had a proper meal, an' longer since I had more than the critters 'round here t' talk to.~

++ ~You're out here on your own then?~ + toby.7

END

IF ~~ THEN BEGIN toby.5

SAY ~I ain't no beggar! Sorry fer disturbin' you. I'll be on my way then.~  

IF ~~ THEN DO ~SetGlobal("RLTobiasAccept", "GLOBAL", 2)SetGlobal("RLTobias", "GLOBAL", 1)EscapeAreaDestroy(1)RestParty()~

EXIT

END

IF ~~ THEN BEGIN toby.6

SAY ~I understand, <PRO_SIRMAAM>. I won't be disturbin' ya further.~

++ ~Wait. I guess we can spare a bowl. Just... lay your weapons over there first.~ + toby.4

++ ~(You watch uneasily as he disappears back into the shadows.)~  

DO ~SetGlobal("RLTobiasAccept", "GLOBAL", 3)SetGlobal("RLTobias", "GLOBAL", 1)EscapeAreaDestroy(1)RestParty()~EXIT

END

IF ~~ THEN BEGIN toby.7

SAY ~Yes, <PRO_SIRMAAM>. Pa's been extra busy, what with all that ole Thalantyr ordered this time. So he sent me out on my own t' check the traps.~ 

= ~Ain't no one can bring out what a piece of leather has t' offer better than my pa. 'Course he don't normally take special orders from folks, but him an' ole Thalantyr got an arrangement. Thalantyr sells what my pa makes to help pay for some of his magical doin's, and pa don't hav' to deal with folks face on.~ 

= ~You'd think the two of 'em don't even like each other, the way they go on. Pa says all his finger wigglin' an' playin' with forces he ought not t' be playin' with will bring nothin' but trouble, an' ole Thalantyr threatens to turn him into the proverbial toad if'n he don't watch his tongue.~ 

= ~Heh... Neither of 'em can stand anyone interuptin' their work, nor spare an idle word for a stranger. I think they're more alike than either would admit to.~ 

= ~(Lowering his voice, he gives you a conspiratorial grin.) Truth is, I think both of 'em are softer on the inside than they'd like to think. Ole Thalantyr would never admit it, but he's been more than a little worried 'bout his apprentice, Melicamp. Been cursin' the man for a shiftless lout ever since he up and disappeared. But I seen the worry in his eyes.~ 

= ~Same as my pa would be if'n anythin' was to happen t' one of his own. Some folks are like that, ya know?~ 

= ~(He pauses just long enough between words to devour huge bites of his stew.) This here stew is sure fine, <PRO_SIRMAAM>. I ain't had nothin' to eat fer hours. Ma says I eat so much 'cause I'm still growin'. Pa says if I don't stop growin' soon he'll have to be raisin' the door frame.~ 

= ~Your folks live around here?~

++ ~My stepfather was recently murdered. I never knew my mother.~ + toby.16

++ ~I recently lost the man I called father. I never knew my mother.~ + toby.16

++ ~I never knew either of my parents.~ + toby.17

++ ~I... would rather not talk about them.~ + toby.20

END

IF ~~ THEN BEGIN toby.16

SAY ~Oh I'm sorry t' hear that, <PRO_SIRMAAM>. I don't know what I'd do if'n somthin' happened t' my Pa.~ 

= ~Yer an orphan then? That must be tough.~

++ ~It's not so bad. I was raised by a man who took good care of me and loved me.~ + toby.18

++ ~I guess I am now, but Gorion made sure I was well cared for growing up.~ + toby.18

++ ~I would rather not talk about them.~ + toby.20

END

IF ~~ THEN BEGIN toby.17

SAY ~Yer an orphan then? That must be tough.~

++ ~It's not so bad. I was raised by a man who took good care of me and loved me.~ + toby.18

++ ~There was a man who took me in and raised me.~ + toby.18

++ ~I would rather not talk about them.~ + toby.20

END

IF ~~ THEN BEGIN toby.18

SAY ~Ahh. That's good then. Pa says it ain't the layin' with a woman that makes a father. He says a man ain't a father lessin' he's the one doin' the raisin'.~ 

= ~(He blushes.) Sorry, <PRO_SIRMAAM>. Don't mean to be indelicate. That's just how he puts it.~ IF ~~ + toby.21

END

IF ~~ THEN BEGIN toby.20

SAY ~Didn't mean to be pryin', <PRO_SIRMAAM>.~ IF ~~ + toby.21

END


IF ~~ THEN BEGIN toby.21

SAY ~(Sitting back with a satisfied sigh, he pats his belly.) That ought t' hold me fer a bit. I surely do thank ya fer yer kindness, <PRO_SIRMAAM>.~ IF ~~ + toby.22

END

IF ~~ THEN BEGIN toby.22

SAY ~Well, best be on my way 'fore I wear out my welcome. Pa says it ain't good manners t' take advantage of a kindness. 'Sides, I still need to be findin' myself a spot t' hole up fer the night.~

++ ~You're welcome to find yourself a spot by our fire for the night, if you like.~ + toby.23

++ ~Probably safer if you just stay here for the night.~ + toby.23

++ ~Do you really think it is a good idea to be wondering around looking for a place to set up camp at this time of night?~ + toby.23

END

IF ~~ THEN BEGIN toby.23

SAY ~I'll be fine, <PRO_SIRMAAM>. I know what I'm about when it comes t' takin' care of myself out here.~ 

= ~(He grins.) Just can't cook worth a darn is all.~ 

= ~Say, you huntin' out here? Fine pelts to be had from the critters 'round here. Pa's always lookin' fer more good pelts. If'n you get down 'round High Hedge way, look us up. Like I said, none's better at workin' leather then my Pa.~

++ ~Your pa makes armor?~ + toby.26

END

IF ~~ THEN BEGIN toby.26

SAY ~Armor tough as chain mail, usin' nothin' but hide an' bone. Robes too, tough and resistant t' the elements, yet soft as silk an' just as easy t' move in.~ 

= ~I've heard some folks claim that he must be usin' some kind o' magic in his tannin' process, but it ain't so. My pa don't trust magic. Not even the healin' kind. He says the land will provide all that a body needs, if only they know how to make use of it. He's got himself a special way o' treatin' the hides, an' a recipe for his tannin' liquor that his pa taught him.~ 

= ~He says when I'm old enough he'll be teachin' it t' me. But fer now, he don't even let me go with him when he goes out t' gather the bark an' whatever else it is he uses t' be makin' it. All I know is when he comes back from one o' his gatherin' trips, he comes smellin' somethin' fierce.~ 

= ~Beats the heck out o' me how the finished piece don't end up stinkin' somthin' awful. But it don't.~ 

= ~He could make you a fine piece, if'n you brought him some good hides t' trade.~ 

= ~'Course he don't normally make t' order fer folks, face on. But I'll put in a good word fer ya. You been kind to me, an' us Tanner's repay in kind.~ 

= ~We got a little place just a bit northwest of ole Thalantyr's place. Watch yer step 'round there though. Walkin' bones like to amble 'round that area sometimes. Nothin' a stout hammer er club won't fix though. If'n you can handle the bears out here, those bone piles won't give ya too much trouble.~  

IF ~~ THEN DO ~SetGlobal("RLTobiasAccept", "GLOBAL", 1)SetGlobal("RLTobias", "GLOBAL", 1)EscapeAreaDestroy(1)RestParty()~ 

EXIT

END

IF ~Global("RLCritterArmor","GLOBAL",1)Global("RLTobiasW","GLOBAL",0)~ THEN BEGIN RLTobiasW

SAY ~(A disheveled mop of twig bejeweled blond hair pops above the brush in front of you.) <CHARNAME>!~ IF ~~ + tobW.1

END

IF ~~ THEN BEGIN tobW.1

SAY ~(Struggling to his feet, he leans heavily on a makeshift crutch.) I ain't never been so glad to see a body in my life, <PRO_SIRMAAM>!~

++ ~Tobias! Are you alright? What happened?~ + tobW.2

++ ~There you are! I was beginning to fear the worst.~ + tobW.2

++ ~Your pa's very worried about you.~ + tobW.2

++ ~Well now, look what we have here. Your pa's bound to be very grateful for your safe return.~ + tobW.2

END

IF ~~ THEN BEGIN tobW.2

SAY ~I was after me some quail eggs from up yonder on that ledge there, where the brush tangles itself in the cracks. My ma favors quail eggs over most anythin'. Momma quail thought she'd be foolin' me by layin' up so high, 'stead o' down low like her kind does normal.~ 

= ~(grins) But like pa always says, not much gets past "eagle eyes". I spotted the cock come back t' spare her a spell. Thought t' myself, now momma quail you be clever, just not clever enough this time.~ 

= ~As it turned out though, guess momma quail gets the last laugh. Stepped on a loose stone on the way up an' next I know I'm face down in the dirt. Busted my leg up pretty good.~ 

= ~(He lifts his gaze to the brush covered ledge above.) Don't you think I ain't seen you peekin' over the edge at me either, ya gloatin' old hen.~ 

= ~Was 'bout wonderin' if ole Lathaner had a hankerin' to meet me face on, before you come along, <PRO_SIRMAAM>.~

++ ~Can you walk at all?~ + tobW.7

END

IF ~~ THEN BEGIN tobW.7

SAY ~Can't do no more 'en ten feet at a go, on my own. But I think if you were to let me lean on you a bit, I can do better.~

++ ~Perhaps some healing magic would help.~ + tobW.9

++ ~It's going to be slow going, at that rate. You need some healing magic or a potion.~ + tobW.9

++ ~ I can't be bothered with this.~ + tobW.8

END

IF ~~ THEN BEGIN tobW.8

SAY ~Your gonna just leave me out here like this?~

++ ~Sorry kid, you'll have to make it back on your own.~ 

DO ~SetGlobal("RLCritterArmor","GLOBAL",4)EscapeAreaDestroy(1)~

EXIT

END

IF ~~ THEN BEGIN tobW.9

SAY ~No, <PRO_SIRMAAM>! Pa don't hold with none of that finger wigglin'. He'd have my hide proper if'n I was t' sit still fer it.~ 

= ~Side's, no disrespect, <PRO_SIRMAAM>, but I can't say I'm all that comfortable with the idea m'self.~ 

= ~All I need be a little time t' heal. That and maybe a little food. If'in you have any t' spare, that is.~

++ ~I'm not leaving you alone out here. We'll rest here for the night, then head back in the morning.~

DO ~SetGlobal("RLCritterArmor","GLOBAL",2)SetGlobal("RLTobiasW","GLOBAL",1)CreateItem("RLToBody",1,1,0)GiveItem("RLToBody",LastTalkedToBy(Myself))EscapeAreaDestroy(1)RestParty()~

EXIT

++ ~(chuckle) I have a feeling that your pa would, "have my hide proper", if I left you alone out here in your condition. We'll rest here for the night, then head back in the morning.~

DO ~SetGlobal("RLCritterArmor","GLOBAL",2)SetGlobal("RLTobiasW","GLOBAL",1)CreateItem("RLToBody",1,1,0)GiveItem("RLToBody",LastTalkedToBy(Myself))EscapeAreaDestroy(1)RestParty()~

EXIT

++ ~Have it your way, but your going back with me even if I have to carry you.~

DO ~SetGlobal("RLCritterArmor","GLOBAL",2)SetGlobal("RLTobiasW","GLOBAL",1)CreateItem("RLToBody",1,1,0)GiveItem("RLToBody",LastTalkedToBy(Myself))EscapeAreaDestroy(1)RestParty()~

EXIT

END

