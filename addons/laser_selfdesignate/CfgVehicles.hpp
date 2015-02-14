class CfgVehicles {
    class AllVehicles;
    class Air: AllVehicles {
        class Turrets;
    };

    class Helicopter: Air {
        class Turrets {
            class MainTurret;
        };

    // TODO: move these to a different HUD addon
    //  commanderCanSee = 2+32;
    //  gunnerCanSee = 2+32;
    //  driverCanSee = 2+32;

    };

    class Helicopter_Base_F: Helicopter {};

    class Heli_Attack_01_base_F: Helicopter_Base_F {};

    class B_Heli_Attack_01_F: Heli_Attack_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                stabilizedInAxes = 4;       // This stablizes the turret a bit more for laser designation
            };
        };
    };
};
