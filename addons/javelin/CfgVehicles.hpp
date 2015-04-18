class CfgVehicles {
    class LandVehicle;
    class StaticWeapon : LandVehicle {
        class Turrets;
    };
    
    class StaticMGWeapon : StaticWeapon {
        class Turrets : Turrets {
            class MainTurret;
        };
    };
    

    class AT_01_base_F: StaticMGWeapon {
        class Turrets : Turrets {
            class MainTurret : MainTurret {
                weapons[] = { "missiles_titan_static_at" };
                magazines[] = {"1Rnd_GAT_missiles","1Rnd_GAT_missiles","1Rnd_GAT_missiles","1Rnd_GAT_missiles"};
				
                turretInfoType = "ACE_RscOptics_javelin";
                gunnerOpticsModel = PATHTOF(data\reticle_titan.p3d);
                opticsZoomMin = 0.08333;
                opticsZoomMax = 0.04167;
                opticsZoomInit = 0.08333;
                opticsPPEffects[] = {"OpticsCHAbera1","OpticsBlur1"};
                opticsFlare = 0;
                discretefov[] = {0.08333,0.04167};
                discreteInitIndex = 0;
            };
        };
    };
};