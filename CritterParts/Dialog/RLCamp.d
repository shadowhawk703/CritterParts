BEGIN RLCamp

IF ~Global("RLCampTalk","GLOBAL",0)~ THEN BEGIN RLCamp 

SAY ~(The rock wall here will provide welcome protection from the wind and a defensible position at your back as well. You decide to set up camp for the night.)~
 
IF ~~ THEN DO ~SetGlobal("RLCampTalk","GLOBAL",1)~

EXIT

END



