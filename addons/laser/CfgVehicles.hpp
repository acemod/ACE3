class CfgVehicles {
    class All;

    class LaserTarget: All {
        // @TODO: Changing the model and simulation hides it, but THEN IT DOESNT SPAWN WTF!?
        model = "\A3\Weapons_F\empty.p3d";
        simulation = "nvmarker";
        nvTarget = 1;
        //simulation = "laserTarget";
        //threat[] = {0,0,0};
        class EventHandlers {
            init = QUOTE(_this call FUNC(laser_init));
        };
        
        diffuse[] = {0,0,0};
        ambient[] = {0,0,0};
        brightness = 0;
        name = "pozicni blik";
        drawLight = 0;
        drawLightSize = 0;
        drawLightCenterSize = 0;
        activeLight = 0;
        blinking = 0;
        dayLight = 0;
        onlyInNvg = 0;
        useFlare = 0;
    };
    
    // Visual laserTarget override
    class ACE_LaserTarget_Visual : LaserTarget {
        //model = "\A3\Weapons_f\laserTgt.p3d";
    };
};