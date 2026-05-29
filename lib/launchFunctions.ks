// countdown beeps
set voice to getVoice(0).
set voiceTickNote to note(480, 0.1).
set voiceTakeOffNote to note(720, 0.5).

set proLocked to false.





    //countdown for unguided sounding rockets
GLOBAL FUNCTION simpleCountdown{
    print "5...".
    wait 1.
    print "4...".
    wait 1.
    print "3...".
    wait 0.5.
    lock throttle to 1.
    print "Throttle set to 100%".
    wait 0.5.
    print "2...".
    wait 1.
    print "1...".
    wait 1.
    print "Launch!".
    STAGE.
    wait 2.
}

GLOBAL FUNCTION countdown{
    parameter mechJeb IS TRUE.
    parameter spoolUp is 2.5.
    set scrubbed to FALSE.
    
    SAS off.
    print"5".
    voice.play(voiceTickNote).
    wait 1.
    print"4".
    voice.play(voiceTickNote).
    wait 1.
    print"3".
    voice.play(voiceTickNote).
    wait 0.5.
    lock steering to up + R(0, 0, 180).
    print"Locking attitude control".
    wait 0.5.
    print"2".
    voice.play(voiceTickNote).
    wait 0.5.
    if (NOT mechJeb) {
        lock throttle to 1.
        print "Throttle set to 100%".
    }
    wait 0.5.
    print"1".
    voice.play(voiceTakeOffNote).
    wait 1.
    print "IGNITION".
    stage.
    wait spoolUp.
    if shipTWR < 1 {
        print "Scrub Launch.".
        print " ".
        set scrubbed to TRUE.
        
    }
    if not scrubbed{
        print "LAUNCH!".
        voice.play(voiceTakeOffNote).
        stage.
        wait 2.
        if (mechJeb) {
            unlock steering.
            print " ".
            print "Passing attitude control to MechJeb.".
        }
    }
}






GLOBAL FUNCTION waitToApo{

    wait until (verticalSpeed < 0).
    print" ".
    print "Apoapsis reached at " + round(apoapsis) + " meters.".
    print" ".
    wait 0.
}

GLOBAL FUNCTION rangeAbort{
    wait until (altitude < 30000) and (verticalSpeed < 0).
    print " ".
    print "Aborting Rocket In...".
    print " ".
    wait 1.
    print "3...".
    wait 1.
    print "2...".
    wait 1.
    print "1...".
    wait 1.
    ABORT.
    print "Range Aborted!".
    wait 0.
}







