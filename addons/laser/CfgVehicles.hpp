class CfgVehicles {
    class All;

    class LaserTarget: All {
        // @TODO: Changing the model and simulation hides it, but THEN IT DOESNT SPAWN WTF!?
        model = "\A3\Weapons_F\empty.p3d";
        destrType = "DestructNo";
		simulation = "house";
        
        class EventHandlers {
            init = QUOTE(_this call FUNC(laser_init));
        };
    };
    
    // Visual laserTarget override
    class ACE_LaserTarget_Visual : LaserTarget {
        simulation = "LaserTarget";
        model = "\A3\Weapons_f\laserTgt.p3d";
    };
};