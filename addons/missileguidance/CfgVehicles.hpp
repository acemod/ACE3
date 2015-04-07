class CfgVehicles {
    class Heli_Attack_01_base_F;

    class B_Heli_Attack_01_F : Heli_Attack_01_base_F {
        class Turrets {
            class MainTurret;
        };
    }

    class ACE_Comanche_Test : B_Heli_Attack_01_F {
		displayName = "ACE_Comanche_Test";
        author = "ACE Team";
		class Library
		{
			libTextDesc = "ACE_Comanche_Test";
		};
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {"ACE_500Rnd_20mm_shells_Comanche", "24Rnd_ACE_Hellfire_AGM114K"};
            };
        };
    };
};

