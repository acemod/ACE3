class CfgVehicles {
    class Air;
    class Helicopter: Air {
        class Turrets;
    };
    class Helicopter_Base_F: Helicopter {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class Heli_Attack_01_base_F: Helicopter_Base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };

    class B_Heli_Attack_01_F: Heli_Attack_01_base_F {};

    class ACE_Comanche_Test : B_Heli_Attack_01_F {
        scope = 1;
        scopeCurator = 0;
        displayName = "ACE_Comanche_Test";
        author = "ACE Team";
        class Library {
            libTextDesc = "ACE_Comanche_Test";
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"gatling_20mm", QGVAR(dagr), "Laserdesignator_mounted"};
                magazines[] = {"ACE_500Rnd_20mm_shells_Comanche", "6Rnd_ACE_Hydra70_DAGR", "Laserbatteries"};
            };
        };
    };
};
