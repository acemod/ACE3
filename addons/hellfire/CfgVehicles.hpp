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
    class B_Heli_Attack_01_hellfire_F: B_Heli_Attack_01_F {
        scope = 2;
        displayName = CSTRING(HF_B_Heli_Attack_01);
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"ACE_gatling_20mm_Comanche", "ace_hellfire_launcher", "Laserdesignator_mounted"};
                magazines[] = {"ACE_500Rnd_20mm_shells_Comanche", "6Rnd_ACE_Hellfire_AGM114K", "Laserbatteries"};
            };
        };
    };
};
