BEGIN RLMTaner

IF ~Global("RLMTanner", "GLOBAL", 0)~ THEN BEGIN RLMTanner

SAY ~(Strong, lean hands deftly work the leather on the man's lap as you approach. He spares you a quick once over before returning his attention to his work.) Move along, no time to be tradin' the breeze with ya. Work t' do.~

+ ~Global("RLTobiasAccept","GLOBAL",1)~ + ~I'm sorry to be disturbing your work, but I'm looking for someone who I was told lives in this area. Would you be Mr. Tanner?~ + MTan.1   

+ ~Global("RLTobiasAccept","GLOBAL",1)~ + ~I'm looking for a leather craftsman named Tanner. I was told he lives out this way and might be interested in some quality hides.~ + MTan.1  

+ ~OR(2)Global("RLTobiasAccept","GLOBAL",3)Global("RLTobiasAccept","GLOBAL",2)~ + ~I'm sorry to disturb you. My name is <CHARNAME> and I'm just looking for work, friend.~ + MTan.1   

+ ~OR(2)Global("RLTobiasAccept","GLOBAL",2)Global("RLTobiasAccept","GLOBAL",3)~ + ~I was just admiring your work there. My name is <CHARNAME> and I was wondering if you might be needing more hides. I come across some nice ones, from time to time.~ + MTan.1   
++ ~Fine.~  

EXIT 

END

IF ~~ THEN BEGIN MTan.1

SAY ~(With a weighted sigh, the man sets his work aside.) I'm Byren Tanner. Don't mean t' be rude. Just ain't got time t' be exchangin' pleasantries. My son should hav' been back from checkin' our traps long afore now. Don't know if'n you have young'uns, but one goin' missin' will make a man a bit shorter than he needs t' be.~ IF ~~ + MTan.2

END

IF ~~ THEN BEGIN MTan.2

SAY ~Got t' be finishin' this piece afore I set out after him. Promised it done afore mornin'. Gave my word on it.~

+ ~Global("RLTobiasAccept","GLOBAL",1)~ + ~It's nice to meet you, Mr. Tanner. I'm <CHARNAME>. Would your son's name be Tobias? We met him on the trail one night. He said we should look him up if we made it out this way.~ + MTan.8   

+ ~Global("RLTobiasAccept","GLOBAL",1)~ + ~It's good to meet you, I'm <CHARNAME>. Tobias never made it back home? I'm sorry to hear that. I knew he should have stayed in camp with us, but he insisted on finding his own way.~ + MTan.8  

+ ~Global("RLTobiasAccept","GLOBAL",2)~ + ~Your son a tall kid, maybe fifteen? I had one wander into my camp one night, said his name was Tobias. He was begging a meal, so I sent him on his way.~ + MTan.3  

+ ~OR(2)Global("RLTobiasAccept","GLOBAL",3)Global("RLTobiasAccept","GLOBAL",2)~ + ~Mr. Tanner, I believe I may have met your son, but only briefly.~ + MTan.8  

END

IF ~~ THEN BEGIN MTan.3

SAY ~(Eyes narrowing, his posture stiffens.) My son ain't never begged for anythin' in his life.~

++ ~I meant no offense, friend. You know how it is when you're out on the trail. Best to be a little suspicious of someone just showing up in your camp at night.~ + MTan.5

++ ~(shrug) That's how I saw it.~ + MTan.4

END

IF ~~ THEN BEGIN MTan.4

SAY ~I'll be askin' ya t' be on yer way now. Whoever you saw, it wasn't my son.~

IF ~~ THEN DO ~SetGlobal("RLCritterArmor","GLOBAL",3)EscapeAreaDestroy(5)SetGlobal("RLMTanner", "GLOBAL", 1)~

EXIT

END

IF ~~ THEN BEGIN MTan.5

SAY ~(He gives you a slight, silent nod.)~

++ ~Hey, if I could find your son and bring him back here, would you make me a piece of armor like the one you're working on there?~ + MTan.6

++ ~If I happen to come across him again and brought him back here, would you be willing to make me a piece of armor like the one you're working on there?~ + MTan.6

END

IF ~~ THEN BEGIN MTan.6

SAY ~If you were t' bring 'im back safe and sound... I'd be obligin' to ya. Make what ya need.~ IF ~~ + MTan.7

END

IF ~~ THEN BEGIN MTan.7

SAY ~That only holds as long as he’s in one piece...~

IF ~~ THEN DO ~SetGlobal("RLCritterArmor","GLOBAL",1)SetGlobal("RLMTanner", "GLOBAL", 1)~

EXIT

END

IF ~~ THEN BEGIN MTan.8

SAY ~You've seen my son? Where was this? Was he well 'n able the last you saw him?~

++ ~Yes, very well. It was not far off the road, just north of Nashkel.~ + MTan.9

++ ~Yes, he seemed well enough. It was not far off the road, just north of Nashkel.~ + MTan.9

END

IF ~~ THEN BEGIN MTan.9

SAY ~I do appreciate the information, m' <PRO_LADYLORD>.~ 

= ~(Glancing back at his unfinished work, he sighs.) Wish I could be settin' out after 'im sooner. But a man's word be his bond.~ 

= ~Don't mind sayin' I'm gettin' a bit worried over 'im. Not like 'im t' be gone this long. If you happen on 'im again, I'd be abligin' t' ya if'n you could see 'im home safe.~ 

= ~It's said I make a fine set o' leathers. Be pleased to be makin' a piece for you. If you were t' see 'im home safe.~

++ ~I'd be happy to bring him home if I see him, Mr. Tanner.~

DO ~SetGlobal("RLCritterArmor","GLOBAL",1)SetGlobal("RLMTanner", "GLOBAL", 1)~ EXIT

++ ~I'll keep that in mind.~ 

DO ~SetGlobal("RLCritterArmor","GLOBAL",1)SetGlobal("RLMTanner", "GLOBAL", 1)~ EXIT

END

IF ~OR(2)Global("RLCritterArmor","GLOBAL",1)Global("RLCritterArmor", "GLOBAL", 4)~ THEN BEGIN RLWaiting

SAY ~Have you seen my son?~

IF ~~ THEN 

EXIT
 
END

IF ~Global("RLCritterArmor","GLOBAL",2)Global("RLTannerNotice", "GLOBAL", 0)PartyHasItem("RLToBody")~

THEN BEGIN RLNotice

SAY ~Tobias... Is that you boy?~

IF ~~ THEN DO ~SetGlobal("RLTannerNotice", "GLOBAL", 1)~

EXIT 

END

CHAIN

IF ~Global("RLCritterArmor","GLOBAL",2)PartyHasItem("RLToBody")Global("RLTannerNotice", "GLOBAL", 1)~

THEN RLMTaner RLReturnTanner

~Tobias! Where you been, boy? Ya had yer ma worried sick.~ 

== RLTobias 

~Sorry, pa. Went an' got myself busted up a bit. If it weren't for the kindness of <CHARNAME> here, ole Lathander an' I might be gettin' to know one another personal like, right about now.~ 

== RLMTaner

~(nods) We owe <PRO_HIMHER> a debt of thanks. You go on in an' let yer ma know yer back while I thank <PRO_HIMHER> proper.~ 

DO ~SetGlobal("RLTobiasLeave","GLOBAL",1)~

= ~I'm beholdin' t' ya fer yer kindness t' my boy. I ain't got much in the way of worldly goods, but I got my hands an' my craft. It's been said I fashion serviceable armor an' robes from the skins o' the critters hereabouts. I could make a piece fer ya.~ 

= ~You have my word that it'll have the best I have t' give it.~

END

++ ~That's very kind of you, but no payment is necessary.~ EXTERN RLMTaner Rtan.5

++ ~That's very kind of you. What sort of armor do you make?~ EXTERN RLMTaner Rtan.7

++ ~Sounds good to me. What sort of armor do you make?~ EXTERN RLMTaner Rtan.7

CHAIN RLMTaner Rtan.5

~It is, <PRO_SIRMAAM>. I'll not be sleepin' quiet at night 'til I do right by ya.~ EXTERN RLMTaner Rtan.7

CHAIN

RLMTaner Rtan.7 ~I can fashion a fine leather robe. Light enough t' not be interferin' with the finger wigglin' that those prone t' messin' with forces they shouldn't aut t' be messin' with are like t' do. More, it'll offer welcome protection from teeth an' claw, and t' elements as well. All I lack are the five wolf hides an' some bear meat t' use in the treatin' o' the leather. Would normally have 'em on hand, but Tobias's bad luck leaves me short the hides he would have brung back from our traps.~ 

= ~I can fashion a fine bone hide leather vest. Tough as chain mail it be, yet light enough fer even one o' those fancies who make their livin' singin' fer their supper. All I lack be the five bear hides and some sturdy animal bone it'll take t' make it.~

= ~I can fashion a fine leather coat. The kind favored by those who prefer the company o' critters and trees, t' that of their own kind. All I lack be the five wolf hides an' some bear meat t' use in the treatin' o' the leather.~ 

= ~Just tell me what ya need.~

END 

++ ~I could use a new robe.~ DO ~SetGlobal("RLCritterArmor 2bR","GLOBAL",1)~ EXTERN RLMTaner Rtan.11  

++ ~That bone hide vest sounds just right.~ DO ~SetGlobal("RLCritterArmor 2bB","GLOBAL",1)~ EXTERN RLMTaner Rtan.11
  
++ ~I could use a leather coat.~ DO ~SetGlobal("RLCritterArmor 2bL","GLOBAL",1)~ EXTERN RLMTaner Rtan.11  

CHAIN RLMTaner Rtan.11

~(nods) Fair enough. You just bring me what I need an' I'll do it up proper fer ya.~

DO ~TakePartyItem("RLToBody")SetGlobal("SpawnRLTobias","GLOBAL",4)~

EXIT

APPEND RLMTaner

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLWolfH")!PartyHasItem("RLBearM")Global("RLTannerTakePRMeat","GLOBAL",0)Global("RLTannerTakePRHide","GLOBAL",0)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerWaitR1

SAY ~All I be needin' is five wolf hides and one bear meat.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLWolfH")Global("RLTannerTakePRMeat","GLOBAL",1)Global("RLTannerTakePRHide","GLOBAL",0)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerWaitR2

SAY ~All I be needin' is five wolf hides.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLWolfH")Global("RLTannerTakePRMeat","GLOBAL",1)Global("RLTannerTakePRHide","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerWaitR3

SAY ~All I be needin' is four more wolf hides.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLWolfH")Global("RLTannerTakePRMeat","GLOBAL",1)Global("RLTannerTakePRHide","GLOBAL",2)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerWaitR4

SAY ~All I be needin' is three more wolf hides.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLWolfH")Global("RLTannerTakePRMeat","GLOBAL",1)Global("RLTannerTakePRHide","GLOBAL",3)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerWaitR5

SAY ~All I be needin' is two more wolf hides.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLWolfH")Global("RLTannerTakePRMeat","GLOBAL",1)Global("RLTannerTakePRHide","GLOBAL",4)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerWaitR6

SAY ~All I be needin' is one more wolf hide.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLWolfH")!PartyHasItem("RLBearM")Global("RLTannerTakePRMeat","GLOBAL",0)Global("RLTannerTakePRHide","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerWaitR7

SAY ~All I be needin' is four more wolf hides and one bear meat.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLWolfH")!PartyHasItem("RLBearM")Global("RLTannerTakePRMeat","GLOBAL",0)Global("RLTannerTakePRHide","GLOBAL",2)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerWaitR8

SAY ~All I be needin' is three more wolf hides and one bear meat.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLWolfH")!PartyHasItem("RLBearM")Global("RLTannerTakePRMeat","GLOBAL",0)Global("RLTannerTakePRHide","GLOBAL",3)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerWaitR9

SAY ~All I be needin' is two more wolf hides and one bear meat.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLWolfH")!PartyHasItem("RLBearM")Global("RLTannerTakePRMeat","GLOBAL",0)Global("RLTannerTakePRHide","GLOBAL",4)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerWaitR10

SAY ~All I be needin' is one more wolf hide and one bear meat.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLBearM")Global("RLTannerTakePRMeat","GLOBAL",0)Global("RLTannerTakePRHide","GLOBAL",5)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerWaitR11

SAY ~All I be needin' is one bear meat.~

++ ~I'll be back.~

EXIT

END

IF ~Global("RLTannerTakePRMeat","GLOBAL",0)PartyHasItem("RLBearM")Global("RLTannerTakePRHide","GLOBAL",0)!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR1

SAY ~This will do nicely. All I be needin' now is five wolf hides.~

IF ~~ DO ~TakePartyItemNum("RLBearM",1)SetGlobal("RLTannerTakePRMeat","GLOBAL",1)~

EXIT

END

IF ~Global("RLTannerTakePRMeat","GLOBAL",0)PartyHasItem("RLBearM")Global("RLTannerTakePRHide","GLOBAL",1)!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR2

SAY ~This will do nicely. All I be needin' now is four more wolf hides.~

IF ~~ DO ~TakePartyItemNum("RLBearM",1)SetGlobal("RLTannerTakePRMeat","GLOBAL",1)~

EXIT

END

IF ~Global("RLTannerTakePRMeat","GLOBAL",0)PartyHasItem("RLBearM")Global("RLTannerTakePRHide","GLOBAL",2)!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR3

SAY ~This will do nicely. All I be needin' now is three more wolf hides.~

IF ~~ DO ~TakePartyItemNum("RLBearM",1)SetGlobal("RLTannerTakePRMeat","GLOBAL",1)~

EXIT

END

IF ~Global("RLTannerTakePRMeat","GLOBAL",0)PartyHasItem("RLBearM")Global("RLTannerTakePRHide","GLOBAL",3)!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR4

SAY ~This will do nicely. All I be needin' now is two more wolf hides.~

IF ~~ DO ~TakePartyItemNum("RLBearM",1)SetGlobal("RLTannerTakePRMeat","GLOBAL",1)~

EXIT

END

IF ~Global("RLTannerTakePRMeat","GLOBAL",0)PartyHasItem("RLBearM")Global("RLTannerTakePRHide","GLOBAL",4)!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR5

SAY ~This will do nicely. All I be needin' now is one wolf hide.~

IF ~~ DO ~TakePartyItemNum("RLBearM",1)SetGlobal("RLTannerTakePRMeat","GLOBAL",1)~

EXIT

END

IF ~Global("RLTannerTakePRHide","GLOBAL",0)Global("RLTannerTakePRMeat","GLOBAL",0)PartyHasItem("RLWolfH")!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR6

SAY ~This will do nicely. All I be needin' now is four more wolf hides and one bear meat.~

IF ~~ DO ~TakePartyItemNum("RLWolfH",1)SetGlobal("RLTannerTakePRHide","GLOBAL",1)~

EXIT

END

IF ~Global("RLTannerTakePRHide","GLOBAL",1)Global("RLTannerTakePRMeat","GLOBAL",0)PartyHasItem("RLWolfH")!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR7

SAY ~This will do nicely. All I be needin' now is three more wolf hides and one bear meat.~

IF ~~ DO ~TakePartyItemNum("RLWolfH",1)SetGlobal("RLTannerTakePRHide","GLOBAL",2)~

EXIT

END

IF ~Global("RLTannerTakePRHide","GLOBAL",2)Global("RLTannerTakePRMeat","GLOBAL",0)PartyHasItem("RLWolfH")!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR8

SAY ~This will do nicely. All I be needin' now is two more wolf hides and one bear meat.~

IF ~~ DO ~TakePartyItemNum("RLWolfH",1)SetGlobal("RLTannerTakePRHide","GLOBAL",3)~

EXIT

END

IF ~Global("RLTannerTakePRHide","GLOBAL",3)Global("RLTannerTakePRMeat","GLOBAL",0)PartyHasItem("RLWolfH")!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR9

SAY ~This will do nicely. All I be needin' now is one wolf hide and one bear meat.~

IF ~~ DO ~TakePartyItemNum("RLWolfH",1)SetGlobal("RLTannerTakePRHide","GLOBAL",4)~

EXIT

END

IF ~Global("RLTannerTakePRHide","GLOBAL",4)Global("RLTannerTakePRMeat","GLOBAL",0)PartyHasItem("RLWolfH")!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR10

SAY ~This will do nicely. All I be needin' now is one bear meat.~

IF ~~ DO ~TakePartyItemNum("RLWolfH",1)SetGlobal("RLTannerTakePRHide","GLOBAL",5)~

EXIT

END

IF ~Global("RLTannerTakePRHide","GLOBAL",0)Global("RLTannerTakePRMeat","GLOBAL",1)PartyHasItem("RLWolfH")!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR11

SAY ~This will do nicely. All I be needin' now is four more wolf hides.~

IF ~~ DO ~TakePartyItemNum("RLWolfH",1)SetGlobal("RLTannerTakePRHide","GLOBAL",1)~

EXIT

END

IF ~Global("RLTannerTakePRHide","GLOBAL",1)Global("RLTannerTakePRMeat","GLOBAL",1)PartyHasItem("RLWolfH")!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR12

SAY ~This will do nicely. All I be needin' now is three more wolf hides.~

IF ~~ DO ~TakePartyItemNum("RLWolfH",1)SetGlobal("RLTannerTakePRHide","GLOBAL",2)~

EXIT

END

IF ~Global("RLTannerTakePRHide","GLOBAL",2)Global("RLTannerTakePRMeat","GLOBAL",1)PartyHasItem("RLWolfH")!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR13

SAY ~This will do nicely. All I be needin' now is two more wolf hides.~

IF ~~ DO ~TakePartyItemNum("RLWolfH",1)SetGlobal("RLTannerTakePRHide","GLOBAL",3)~

EXIT

END

IF ~Global("RLTannerTakePRHide","GLOBAL",3)Global("RLTannerTakePRMeat","GLOBAL",1)PartyHasItem("RLWolfH")!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR14

SAY ~This will do nicely. All I be needin' now is one more wolf hide.~

IF ~~ DO ~TakePartyItemNum("RLWolfH",1)SetGlobal("RLTannerTakePRHide","GLOBAL",4)~

EXIT

END

IF ~Global("RLTannerTakePRHide","GLOBAL",4)Global("RLTannerTakePRMeat","GLOBAL",1)PartyHasItem("RLWolfH")!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR15

SAY ~These are just what I need. Got a fresh batch of my tannin liquor made up special fer yer piece. ~

IF ~~ DO ~TakePartyItemNum("RLWolfH",1)SetGlobal("RLTannerTakePRHide","GLOBAL",5)~

EXIT

END

IF ~Global("RLTannerTakePRHide","GLOBAL",5)Global("RLTannerTakePRMeat","GLOBAL",0)PartyHasItem("RLBearM")!Global("RLTannerReady","GLOBAL",1)OR(2)Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLCritterArmor 2bR","GLOBAL",1)~ THEN BEGIN RLTannerTakePR16

SAY ~These are just what I need. Got a fresh batch of my tannin liquor made up special fer yer piece. ~

IF ~~ DO ~TakePartyItemNum("RLBearM",1)SetGlobal("RLTannerTakePRMeat","GLOBAL",1)~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLBearH")!PartyHasItem("RLAniBo")Global("RLTannerTakeBRBone","GLOBAL",0)Global("RLTannerTakeBRHide","GLOBAL",0)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerWaitB1

SAY ~All I be needin' is five bear hides and one animal bone.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLBearH")Global("RLTannerTakeBRBone","GLOBAL",1)Global("RLTannerTakeBRHide","GLOBAL",0)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerWaitB2

SAY ~All I be needin' is five bear hides.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLBearH")Global("RLTannerTakeBRBone","GLOBAL",1)Global("RLTannerTakeBRHide","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerWaitB3

SAY ~All I be needin' is four more bear hides.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLBearH")Global("RLTannerTakeBRBone","GLOBAL",1)Global("RLTannerTakeBRHide","GLOBAL",2)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerWaitB4

SAY ~All I be needin' is three more bear hides.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLBearH")Global("RLTannerTakeBRBone","GLOBAL",1)Global("RLTannerTakeBRHide","GLOBAL",3)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerWaitB5

SAY ~All I be needin' is two more bear hides.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLBearH")Global("RLTannerTakeBRBone","GLOBAL",1)Global("RLTannerTakeBRHide","GLOBAL",4)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerWaitB6

SAY ~All I be needin' is one more bear hide.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLBearH")!PartyHasItem("RLAniBo")Global("RLTannerTakeBRBone","GLOBAL",0)Global("RLTannerTakeBRHide","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerWaitB7

SAY ~All I be needin' is four more bear hides and one animal bone.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLBearH")!PartyHasItem("RLAniBo")Global("RLTannerTakeBRBone","GLOBAL",0)Global("RLTannerTakeBRHide","GLOBAL",2)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerWaitB8

SAY ~All I be needin' is three more bear hides and one animal bone.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLBearH")!PartyHasItem("RLAniBo")Global("RLTannerTakeBRBone","GLOBAL",0)Global("RLTannerTakeBRHide","GLOBAL",3)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerWaitB9

SAY ~All I be needin' is two more bear hides and one animal bone.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLBearH")!PartyHasItem("RLAniBo")Global("RLTannerTakeBRBone","GLOBAL",0)Global("RLTannerTakeBRHide","GLOBAL",4)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerWaitB10

SAY ~All I be needin' is one more bear hide and one animal bone.~

++ ~I'll be back.~

EXIT

END

IF ~!Global("RLTannerReady","GLOBAL",1)!PartyHasItem("RLAniBo")Global("RLTannerTakeBRBone","GLOBAL",0)Global("RLTannerTakeBRHide","GLOBAL",5)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerWaitB11

SAY ~All I be needin' is one animal bone.~

++ ~I'll be back.~

EXIT

END

IF ~Global("RLTannerTakeBRBone","GLOBAL",0)PartyHasItem("RLAniBo")Global("RLTannerTakeBRHide","GLOBAL",0)!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR1

SAY ~This will do nicely. All I be needin' now is five bear hides.~

IF ~~ DO ~TakePartyItemNum("RLAniBo",1)SetGlobal("RLTannerTakeBRBone","GLOBAL",1)~

EXIT

END

IF ~Global("RLTannerTakeBRBone","GLOBAL",0)PartyHasItem("RLAniBo")Global("RLTannerTakeBRHide","GLOBAL",1)!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR2

SAY ~This will do nicely. All I be needin' now is four more bear hides.~

IF ~~ DO ~TakePartyItemNum("RLAniBo",1)SetGlobal("RLTannerTakeBRBone","GLOBAL",1)~

EXIT

END

IF ~Global("RLTannerTakeBRBone","GLOBAL",0)PartyHasItem("RLAniBo")Global("RLTannerTakeBRHide","GLOBAL",2)!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR3

SAY ~This will do nicely. All I be needin' now is three more bear hides.~

IF ~~ DO ~TakePartyItemNum("RLAniBo",1)SetGlobal("RLTannerTakeBRBone","GLOBAL",1)~

EXIT

END

IF ~Global("RLTannerTakeBRBone","GLOBAL",0)PartyHasItem("RLAniBo")Global("RLTannerTakeBRHide","GLOBAL",3)!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR4

SAY ~This will do nicely. All I be needin' now is two more bear hides.~

IF ~~ DO ~TakePartyItemNum("RLAniBo",1)SetGlobal("RLTannerTakeBRBone","GLOBAL",1)~

EXIT

END

IF ~Global("RLTannerTakeBRBone","GLOBAL",0)PartyHasItem("RLAniBo")Global("RLTannerTakeBRHide","GLOBAL",4)!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR5

SAY ~This will do nicely. All I be needin' now is one bear hide.~

IF ~~ DO ~TakePartyItemNum("RLAniBo",1)SetGlobal("RLTannerTakeBRBone","GLOBAL",1)~

EXIT

END


IF ~Global("RLTannerTakeBRHide","GLOBAL",0)Global("RLTannerTakeBRBone","GLOBAL",0)PartyHasItem("RLBearH")!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR6

SAY ~This will do nicely. All I be needin' now is four more bear hides and one animal bone.~

IF ~~ DO ~TakePartyItemNum("RLBearH",1)SetGlobal("RLTannerTakeBRHide","GLOBAL",1)~

EXIT

END

IF ~Global("RLTannerTakeBRHide","GLOBAL",1)Global("RLTannerTakeBRBone","GLOBAL",0)PartyHasItem("RLBearH")!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR7

SAY ~This will do nicely. All I be needin' now is three more bear hides and one animal bone.~

IF ~~ DO ~TakePartyItemNum("RLBearH",1)SetGlobal("RLTannerTakeBRHide","GLOBAL",2)~

EXIT

END

IF ~Global("RLTannerTakeBRHide","GLOBAL",2)Global("RLTannerTakeBRBone","GLOBAL",0)PartyHasItem("RLBearH")!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR8

SAY ~This will do nicely. All I be needin' now is two more bear hides and one animal bone.~

IF ~~ DO ~TakePartyItemNum("RLBearH",1)SetGlobal("RLTannerTakeBRHide","GLOBAL",3)~

EXIT

END

IF ~Global("RLTannerTakeBRHide","GLOBAL",3)Global("RLTannerTakeBRBone","GLOBAL",0)PartyHasItem("RLBearH")!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR9

SAY ~This will do nicely. All I be needin' now is one bear hide and one animal bone.~

IF ~~ DO ~TakePartyItemNum("RLBearH",1)SetGlobal("RLTannerTakeBRHide","GLOBAL",4)~

EXIT

END

IF ~Global("RLTannerTakeBRHide","GLOBAL",4)Global("RLTannerTakeBRBone","GLOBAL",0)PartyHasItem("RLBearH")!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR10

SAY ~This will do nicely. All I be needin' now is one animal bone.~

IF ~~ DO ~TakePartyItemNum("RLBearH",1)SetGlobal("RLTannerTakeBRHide","GLOBAL",5)~

EXIT

END

IF ~Global("RLTannerTakeBRHide","GLOBAL",0)Global("RLTannerTakeBRBone","GLOBAL",1)PartyHasItem("RLBearH")!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR11

SAY ~This will do nicely. All I be needin' now is four more bear hides.~

IF ~~ DO ~TakePartyItemNum("RLBearH",1)SetGlobal("RLTannerTakeBRHide","GLOBAL",1)~

EXIT

END

IF ~Global("RLTannerTakeBRHide","GLOBAL",1)Global("RLTannerTakeBRBone","GLOBAL",1)PartyHasItem("RLBearH")!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR12

SAY ~This will do nicely. All I be needin' now is three more bear hides.~

IF ~~ DO ~TakePartyItemNum("RLBearH",1)SetGlobal("RLTannerTakeBRHide","GLOBAL",2)~

EXIT

END

IF ~Global("RLTannerTakeBRHide","GLOBAL",2)Global("RLTannerTakeBRBone","GLOBAL",1)PartyHasItem("RLBearH")!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR13

SAY ~This will do nicely. All I be needin' now is two more bear hides.~

IF ~~ DO ~TakePartyItemNum("RLBearH",1)SetGlobal("RLTannerTakeBRHide","GLOBAL",3)~

EXIT

END

IF ~Global("RLTannerTakeBRHide","GLOBAL",3)Global("RLTannerTakeBRBone","GLOBAL",1)PartyHasItem("RLBearH")!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR14

SAY ~This will do nicely. All I be needin' now is one more bear hide.~

IF ~~ DO ~TakePartyItemNum("RLBearH",1)SetGlobal("RLTannerTakeBRHide","GLOBAL",4)~

EXIT

END

IF ~Global("RLTannerTakeBRHide","GLOBAL",4)Global("RLTannerTakeBRBone","GLOBAL",1)PartyHasItem("RLBearH")!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR15

SAY ~These are just what I need. Got a fresh batch of my tannin liquor made up special fer yer piece. ~

IF ~~ DO ~TakePartyItemNum("RLBearH",1)SetGlobal("RLTannerTakeBRHide","GLOBAL",5)~

EXIT

END

IF ~Global("RLTannerTakeBRHide","GLOBAL",5)Global("RLTannerTakeBRBone","GLOBAL",0)PartyHasItem("RLAniBo")!Global("RLTannerReady","GLOBAL",1)Global("RLCritterArmor 2bB","GLOBAL",1)~ THEN BEGIN RLTannerTakeBR16

SAY ~These are just what I need. Got a fresh batch of my tannin liquor made up special fer yer piece. ~

IF ~~ DO ~TakePartyItemNum("RLAniBo",1)SetGlobal("RLTannerTakeBRBone","GLOBAL",1)~

EXIT

END


IF ~Global("RLTannerReady","GLOBAL",1)~ THEN BEGIN RLTannerMake

SAY ~Won't take me more 'en a day t' have it ready.~

IF ~~ DO ~SetGlobal("RLTannerWorks","GLOBAL",1)SetGlobal("RLTannerReady","GLOBAL",2)RealSetGlobalTimer("RLTanWorkingTimer","GLOBAL",900)~

EXIT

END

IF ~Global("RLTannerWorks","GLOBAL",1)!RealGlobalTimerExpired("RLTanWorkingTimer","GLOBAL")	~ THEN BEGIN RLTannerBusy

SAY ~Leave me t' my work.~

IF ~~ EXIT

END

IF ~Global("RLCritterArmor 2bR","GLOBAL",1)Global("RLTannerWorks","GLOBAL",1)RealGlobalTimerExpired("RLTanWorkingTimer","GLOBAL")	~ THEN BEGIN RLTannerGives

SAY ~Right pleased with how it come out. May it serve you well.~

IF ~~ DO ~CreateItem("RLMageL",1,1,0)GiveItem("RLMageL",LastTalkedToBy(Myself))AddexperienceParty(1000)SetGlobal("RLCritterArmor 2bR","GLOBAL","3")EscapeAreaDestroy(1)~

EXIT

END 

IF ~Global("RLCritterArmor 2bL","GLOBAL",1)Global("RLTannerWorks","GLOBAL",1)RealGlobalTimerExpired("RLTanWorkingTimer","GLOBAL")	~ THEN BEGIN RLTannerGives

SAY ~Right pleased with how it come out. May it serve you well.~

IF ~~ DO ~CreateItem("RLDruidL",1,1,0)GiveItem("RLDruidL",LastTalkedToBy(Myself))AddexperienceParty(1000)SetGlobal("RLCritterArmor 2bL","GLOBAL","3")EscapeAreaDestroy(1)~

EXIT

END 

IF ~Global("RLCritterArmor 2bB","GLOBAL",1)Global("RLTannerWorks","GLOBAL",1)RealGlobalTimerExpired("RLTanWorkingTimer","GLOBAL")	~ THEN BEGIN RLTannerGives

SAY ~Right pleased with how it come out. May it serve you well.~

IF ~~ DO ~CreateItem("RLBoneL",1,1,0)GiveItem("RLBoneL",LastTalkedToBy(Myself))AddexperienceParty(1000)SetGlobal("RLCritterArmor 2bB","GLOBAL","3")EscapeAreaDestroy(1)~

EXIT

END 

END

