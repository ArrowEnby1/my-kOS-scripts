if(status = "PRELAUNCH"){
    core:part:getmodule("kOSProcessor"):doevent("Open Terminal").
    switch to 0.
    cd("0:/NewStart").
    print "SETTINGS:".
    print "  Apo: 110km".
    print "  Peri: 0km".
    print "  Turn off autostage.".
    print " ".
    print "ENGAGE MECHJEB".
    print "Run downrange when ready.".
}