VAR tempTime = 0
VAR trueTime = 0
VAR timeWasted = 0

VAR sleepPrimed = false

VAR TIRED = true

VAR loopCount = 0

-> intro

=== function minus(ref x) ===
	~x = x - 1
	
=== function plus(ref x) ===
	~x = x + 1
	
=== function print_num(x) ===
{ 
    - x >= 1000:
        {print_num(x / 1000)} thousand, { x mod 1000 > 0:{print_num(x mod 1000)}}
    - x >= 100:
        {print_num(x / 100)} hundred { x mod 100 > 0:and {print_num(x mod 100)}}
    - x == 0:
        zero
    - else:
        { x >= 20:
            { x / 10:
                - 2: twenty
                - 3: thirty
                - 4: forty
                - 5: fifty
                - 6: sixty
                - 7: seventy
                - 8: eighty
                - 9: ninety
            }
            { x mod 10 > 0:<>-<>}
        }
        { x < 10 || x > 20:
            { x mod 10:
                - 1: one
                - 2: two
                - 3: three
                - 4: four        
                - 5: five
                - 6: six
                - 7: seven
                - 8: eight
                - 9: nine
            }
        - else:     
            { x:
                - 10: ten
                - 11: eleven       
                - 12: twelve
                - 13: thirteen
                - 14: fourteen
                - 15: fifteen
                - 16: sixteen      
                - 17: seventeen
                - 18: eighteen
                - 19: nineteen
            }
        }
}

=== function timeLossLoop(ref x) ===
{x > -1:
    ~minus(x)
    ~plus(loopCount)
    ~timeLossLoop(x)
    - else:
    ~print_num(loopCount)
    ~loopCount = 0
    }

=== intro ===

=warning
Warning: this game addresses topics that some readers may find graphic or disturbing. 

If you do not wish to read disturbing content, please do not play this game.

+View credits. 
->credits
+Begin. 
-> begin

=credits
This game was written by Lucas Remington.

+Begin. 
-> begin

===begin===
~tempTime = 5
~trueTime = 5736

You are in the waiting room. And you are waiting.
You know, though you do not know why you know this, that you have {print_num(tempTime)} TIME remaining before your wait is over. You also know that you should attempt to make the most of it, though with this thought comes a sort of gloomy certainty that your efforts will most likely prove futile.

There is {print_num(trueTime)} TIME remaining until your death. 

You know this, because I know this.

-> call

=call
~minus(tempTime)
~minus(trueTime)

{ tempTime <= -1:
	->end_wr
- else:
*	{ examine_wr } 	[Speak to the old man.] -> speak_oldm_wr
*	{ examine_wr } 	[Speak to the receptionist.] -> speak_recep_wr
*	{ examine_you_wr } 	[Examine your phone.] ->examine_phn
*	{ examine_you_wr } 	[Examine the important paper.] ->examine_ppr_wr
*[Examine yourself.]->examine_you_wr
*[Examine the waiting room.]->examine_wr
+[Waste time.]->waste_time_wr
}

=examine_wr
~sleepPrimed = false
You sit quietly in your chair, leaning your head back against a pink wall that was once chalk white, and regard the waiting room from underneath half-closed eyelids. It is, by and large, empty of life. 

Across from you, there is a poster of a kitten. It is clinging to a tree branch, with a look of desperation on its adorable face. The text on the poster, white comic sans outlined with black, cheerfully declares "Hang Yourself!"

There is an old man sitting across from you, grotesquely asleep, a receptionist behind a glass barrier, typing on an old mechanical keyboard, and me, reading a magazine in the seat to your left. The front page said "Five Scandalous Marriage Proposals Gone Wrong," but it's mostly about how it's readers are too fat and poor to find happiness. I look up and tell you this, but you stare ahead, ignoring me. 

    After a moment, I return to my reading. Your opinion of me is of no concern. I am very patient.

The old man has a bundle of roses, in the seat to his left, carefully propped upright. For who, you are not certain. He has {print_num(tempTime-2)} TIME remaining until his death. You have {print_num(trueTime)} TIME remaining until your death. 

And you know this because I know this.

You have {print_num(tempTime)} TIME remaining until your wait is over.

-> call

=examine_you_wr
~sleepPrimed = false
You are a weak and worthless person, who hasn't slept in twenty-seven hours. Because of this, you are TIRED, a status condition that increases the difficulty of everything you try to do. You are also wearing DISTINCTLY UNFASHIONABLE PAJAMAS, which increase the difficulty of social interactions. They're best avoided, in any case.

In your left hand, you are holding an IMPORTANT PAPER, which is both pink and critical to your success. In your right hand, you are holding nothing. Your PHONE is at thirty-six percent battery, and is running ONE APP, the Messenger app. 

You are currently WORRYING. If you had to identify a specific reason, you would probably say something about 'surgery' and 'complications', but in actuality, you are worried about your dwindling reservoir of TIME: down to {print_num(trueTime)}, in case you forgot. Counting down.

You have {print_num(tempTime)} TIME remaining until your wait is over. 

-> call

=speak_recep_wr
~sleepPrimed = false
-> DONE
=speak_oldm_wr
~sleepPrimed = false
-> DONE
=examine_phn
~sleepPrimed = false
-> DONE
=examine_ppr_wr
~sleepPrimed = false
-> DONE

=waste_time_wr
{ sleepPrimed:
	<> You continue to waste time, letting your head nod gently forwards and rest upon your chest: in your stupor of apathy, you begin to fantasize about scenarios that will never happen. In one of these, while giving an interview, you are asked to explain the thought process behind your prizewinning novel, by an attractive woman with big eyes, short hair, and adjective glasses. You are attracted to her, of course, and you suspect that she is attracted to you, by the way she bats her eyes and says things like "Gosh, I sure find you attractive. Fuck me in the ass." 
	
    	This is a fantasy, after all. There's no other explanation for her behavior. Look at her. Why would she want you? Look at <i> you.</i> She could have anyone she wanted, man or woman. Why settle? This whole scenario is absolutely ridiculous. It would never happen, not even in {print_num(trueTime)} TIME.
    	
    	As you stand there, paralyzed by self-knowledge, a giant robotic crab climbs out of the sea and rips your arms off. Typical, really.
    	
    	You awake in a cold sweat, to someone calling your name, somehow even more TIRED than before you dozed off. You slept through {timeLossLoop(tempTime)} TIME, and the event you were waiting for is happening now. Congratulations. 
	    ~tempTime = 0
	->end_wr
- else:
	<> {Fearing that whatever you do will have some sort of horrifying consequence, you choose to sit quietly in your chair, staring at the ceiling. There's an interesting splatter of paint, which is perhaps mold, in the left corner of the room. You briefly consider trying to come up with some sort of limerick about the nature of ambiguity, but you are TOO TIRED.  |Once again, you choose to do nothing. It seems to be a winning strategy.|There's only one TIME remaining, and so much still to do, so much you don't know about youself, this world, this place. You sqeeze your eyes shut, paralyzed with guilt and indecision: the being walking across the floor gives you a disinterested look before returning its gaze to the body of the old man, deliciously oozing.}

{Maybe you'll be more creative after you consume some sort of stimulant. But don't worry. You have {print_num(trueTime)} TIME remaining until you die. I'm sure you'll accomplish <i>something</i> before it runs out. |In order to stave off the anxiety always generated by prolonged inactivity, you begin to hum a little bit, patting the armrests of your chair to a tuneless tune existing only in your head. For the first time all day, you feel a little better about this whole situation, until you realize how silly you must look to an outside observer and abruptly cease, putting your hands into your lap and shrinking, down, into yourself, not pulling up your knees because you don't want to look like a fool, fool.|It sees me, stops, apologizes. I wave a hand good-naturedly, decline the unspoken offer. I've made reservations, so to speak. I don't want to ruin my appetite, so to speak. I'm going to eat you when you die, in {print_num(trueTime)} TIME, and there's not a thing you'll be able to do about it. Dead and alone.}

{Just not ...now. |When you finally work up the courage to glance over at the receptionist, she's ignoring you. Nothing has changed. Nothing will change, not in the {print_num(trueTime)} TIME that remain. Not if you had ten times the TIME. Worthless. |But for now, self control. }

{Regardless, you have successfully wasted one TIME. Once you waste {print_num(tempTime)} more, your wait will be over. |Anyways, you have wasted one TIME. Just {print_num(tempTime)} more to go.|The other being gets to work, crunching and slurping with the greatest of enthusiasm: the receptionist, pale and dead-eyed, sits silently, wringing her hands. You've begun humming again, not caring how much of a fool you look like. It doesn't matter, either way. Nothing matters. Your wait is over.}
~plus(timeWasted)
~sleepPrimed = true
-> call
}

=end_wr
~sleepPrimed = false
This is the end.
-> DONE