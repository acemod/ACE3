class CfgVehicles {
    class All;
    class LaserTarget: All {
        // @TODO: Changing the model and simulation hides it, but THEN IT DOESNT SPAWN WTF!?
        // model = "\A3\Weapons_F\empty.p3d";

        class EventHandlers {
            class ADDON {
                init = QUOTE(_this call FUNC(handleLaserTargetCreation));
            };
        };
    };

    class LandVehicle;
    class Car: LandVehicle {
        class NewTurret;
    };
    class Car_F: Car {
        class Turrets {
            class MainTurret: NewTurret {};
        };
    };
    class MRAP_03_base_F: Car_F {
        class Turrets: Turrets {
            class CommanderTurret: MainTurret {
                primaryGunner = 1;
            };
        };
    };


    // Vehicle lockable configurations


    /* Disabled for now on comanche
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
    */
};
