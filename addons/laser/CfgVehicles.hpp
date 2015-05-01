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
    
    // Vehicle lockable configurations
    
    class AllVehicles;
    class Air: AllVehicles {
        class Turrets;
    };

    class Helicopter: Air {
        class Turrets {
            class MainTurret;
        };
    };

    class Helicopter_Base_F: Helicopter {};

    class Heli_Attack_01_base_F: Helicopter_Base_F {};

    class B_Heli_Attack_01_F: Heli_Attack_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                GVAR(CanLockLaser) = 1;      // Enable laser locking selection
            };
        };
    };
};