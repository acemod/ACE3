class CfgVehicles {
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class Turrets;
    };

    class StaticMGWeapon: StaticWeapon {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class AT_01_base_F: StaticMGWeapon {};

    class B_static_AT_F: AT_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = { QGVAR(Titan_Static) };
                magazines[] = {"1Rnd_GAT_missiles","1Rnd_GAT_missiles","1Rnd_GAT_missiles","1Rnd_GAT_missiles"};

                turretInfoType = "ACE_RscOptics_javelin";
                gunnerOpticsModel = QPATHTOF(data\reticle_titan.p3d);
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
    class O_static_AT_F: AT_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = { QGVAR(Titan_Static) };
                magazines[] = {"1Rnd_GAT_missiles","1Rnd_GAT_missiles","1Rnd_GAT_missiles","1Rnd_GAT_missiles"};

                turretInfoType = "ACE_RscOptics_javelin";
                gunnerOpticsModel = QPATHTOF(data\reticle_titan.p3d);
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
    class I_static_AT_F: AT_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = { QGVAR(Titan_Static) };
                magazines[] = {"1Rnd_GAT_missiles","1Rnd_GAT_missiles","1Rnd_GAT_missiles","1Rnd_GAT_missiles"};

                turretInfoType = "ACE_RscOptics_javelin";
                gunnerOpticsModel = QPATHTOF(data\reticle_titan.p3d);
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
    class Car;
    class Car_F: Car {
        class Turrets {
            class MainTurret;
        };
    };
    class LSV_01_base_F: Car_F {
        class Turrets: Turrets {};
    };
    class LSV_01_AT_base_F: LSV_01_base_F { // Prowler / Polaris DAGOR
        class Turrets: Turrets {
            class TopTurret: MainTurret {
                weapons[] = { QGVAR(Titan_Static) };
                turretInfoType = "ACE_RscOptics_javelin";
                gunnerOpticsModel = QPATHTOF(data\reticle_titan.p3d);
            };
        };
    };
};
