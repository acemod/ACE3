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
        displayName = CSTRING(9m14);
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

                displayName = CSTRING(9m14);

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
                gunnerRightHandAnimName = "";
                gunnerLeftHandAnimName = "";
                gunBeg = "missile_begin";
                gunEnd = "missile_end";
                memoryPointGunnerOptics = "";
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
                displayName = CSTRING(9m14);
                class GVAR(takePlug) {
                    displayName = CSTRING(takePlug);
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canTakePlug));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(takePlug));
                };
            };
        };

        class AnimationSources {
            class missile_hide {
                source = "user";
                animPeriod = 0.0001;
                initPhase = 0;
                maxValue = "1";
                minValue = "0";
            };
        };
    };

    class GVAR(9m14_joystick): StaticATWeapon {
        scope = 2;
        side = 1;
        faction = "BLU_F";
        crew = "B_Soldier_F";
        author = "Brandon (TCVM)";
        ace_missileguidance_hasMCLOSControl = 1;
        displayName = CSTRING(9s415);
        model = QPATHTOF(data\9m14_joystick.p3d);
        picture = "\A3\Static_F_Gamma\data\UI\gear_StaticTurret_AT_CA.paa";
        UiPicture = "\A3\Static_F_Gamma\data\UI\gear_StaticTurret_AT_CA.paa";
        icon = "\A3\Static_F_Gamma\data\UI\map_StaticTurret_AT_CA.paa";
        threat[] = {0.7,1.0,0.1};
        cost = 100000;
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

        class Turrets: Turrets {
            class MainTurret: MainTurret {
                optics = 1;
                turretInfoType = "RscWeaponEmpty";
                gunnerOpticsModel = "\a3\weapons_f_gamma\reticle\GMG_01_Optics_Gunner_F";
                minElev = -30;
                maxElev = 20;
                weapons[] = { QGVAR(9s415_dummy_weapon) };
                magazines[] = { QGVAR(9s415_dummy) };

                gunnerAction = "gunner_static_low01";
                gunnergetInAction = "";
                gunnergetOutAction = "";

                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;

                displayName = CSTRING(9s415);

                class ViewOptics {
                    initAngleX = 0;
                    minAngleX = -90;
                    maxAngleX = 90;
                    initAngleY = 0;
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
                memoryPointGunnerOptics = "view_pos";
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
                displayName = CSTRING(9s415);
                selection = "center";
            };
        };
    };

    class ThingX;
    class GVAR(plug): ThingX {
        displayName = QGVAR(plug);
        scope = 1;
        scopeCurator = 1;
        model = "\a3\Structures_F_Orange\VR\Helpers\Sign_sphere10cm_Geometry_F.p3d";
        destrType = "DestructNo";

        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(plug);
                condition = "true";
                distance = 2;
                class GVAR(pickup) {
                    displayName = CSTRING(pickupPlug);
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canPickupPlug));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(pickupPlug));
                };
                class GVAR(unattach) {
                    displayName = CSTRING(unattachPlug);
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canUnattachPlug));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(unattachPlug));
                };
            };
        };
    };
};