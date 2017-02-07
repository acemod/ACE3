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

    // laserTarget fails if the turret does not have "primaryGunner" config
    // This only effects the indfor strider who's commander is not the primaryGunner
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
};
