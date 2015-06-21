class CfgVehicles {

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
    class B_Heli_Attack_01_F : Heli_Attack_01_base_F {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    
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
                magazines[] = {"ACE_500Rnd_20mm_shells_Comanche", "24Rnd_ACE_Hellfire_AGM114K"};
            };
        };
    };
    
};
