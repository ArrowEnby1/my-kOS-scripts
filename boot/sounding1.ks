// Boot file for the first sounding rocket

if(status = "PRELAUNCH"){
    core:part:getmodule("kOSProcessor"):doevent("Open Terminal").
    switch to 0.
    cd("0:/NewStart").
    print("Volume switched to archive.").
    print" ".
    print "Run BasicSounding".
}