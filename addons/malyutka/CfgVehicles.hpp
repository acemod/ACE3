class CfgVehicles {
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class Turrets;
        class MainTurret;
        class ACE_Actions {
            class ACE_MainActions {};
        };
    };
    class StaticATWeapon: StaticWeapon {};

    class GVAR(9m14): StaticATWeapon {
        scope = 2;
        side = 1;
        faction = "BLU_F";
        crew = "B_UAV_AI";
        author = "Brandon (TCVM)";
        //displayName = CSTRING(9m14);
        model = QPATHTOF(data\9m14_mount.p3d);
        picture = "\A3\Static_F_Gamma\data\UI\gear_StaticTurret_AT_CA.paa";
        UiPicture = "\A3\Static_F_Gamma\data\UI\gear_StaticTurret_AT_CA.paa";
        icon = "\A3\Static_F_Gamma\data\UI\map_StaticTurret_AT_CA.paa";
        threat[] = {0.7,1.0,0.1};
        cost = 150000;
        class Damage {
            tex[] = {};
            mat[] = {
                "a3\static_f_gamma\data\staticturret_01.rvmat",
                "a3\static_f_gamma\data\staticturret_01_damage.rvmat",
                "a3\static_f_gamma\data\staticturret_01_destruct.rvmat",
                "a3\static_f_gamma\data\staticturret_02.rvmat",
                "a3\static_f_gamma\data\staticturret_02_damage.rvmat",
                "a3\static_f_gamma\data\staticturret_02_destruct.rvmat",
                "a3\weapons_f_beta\launchers\titan\data\titan_launcher.rvmat",
                "a3\weapons_f_beta\launchers\titan\data\titan_launcher_damage.rvmat",
                "a3\weapons_f_beta\launchers\titan\data\titan_launcher_destruct.rvmat",
                "a3\weapons_f_beta\launchers\titan\data\titan_mtube.rvmat",
                "a3\weapons_f_beta\launchers\titan\data\titan_mtube_damage.rvmat",
                "a3\weapons_f_beta\launchers\titan\data\titan_mtube_destruct.rvmat"
            };
        };

        // no human will be in a turret
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                optics = 1;
                turretInfoType = "RscWeaponEmpty";
                gunnerOpticsModel = "";
                minElev = 0;
                maxElev = 0;
                weapons[] = { QGVAR(9m14) };
                magazines[] = { QGVAR(9m14) };

                gunnerAction = "";
                gunnergetInAction = "";
                gunnergetOutAction = "";

                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;

                //displayName = CSTRING(9m14);

                class ViewOptics {
                    initAngleX = 0;
                    minAngleX = -30;
                    maxAngleX = 30;
                    initAngleY = 5;
                    minAngleY = -100;
                    maxAngleY = 100;
                    initFov = 0.055;
                    minFov = 0.055; // 6 degree FOV
                    maxFov = 0.055;
                    visionMode[] = {"Normal"};
                    thermalMode[] = {0};
                };
                gunnerRightHandAnimName = "OtocHlaven_shake";
                gunnerLeftHandAnimName = "OtocHlaven_shake";
                gunBeg = "spice rakety";
                gunEnd = "konec rakety";
                memoryPointGunnerOptics = "look";
            };
        };

        soundGetOut[] = {"A3\sounds_f\dummysound",0.001,1,5};
        soundGetIn[] = {"A3\sounds_f\dummysound",0.00031622776,1,5};
        armorStructural = 10.0;

        class ACE_CSW {
            disassembleTo = QGVAR(super);
        };

        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                //displayName = CSTRING(9m14);
            };
        };

    };
};