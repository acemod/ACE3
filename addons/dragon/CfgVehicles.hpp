class CfgVehicles {
    class LandVehicle;
    class StaticWeapon: LandVehicle    {
        class Turrets;
        class MainTurret;
        class ACE_Actions {
            class ACE_MainActions {};
        };
    };

    class StaticATWeapon: StaticWeapon {};

    class GVAR(staticBase): StaticATWeapon {
        scope = 1;
        author = ECSTRING(common,ACETeam);
        displayname = CSTRING(dragonName);
        side = 1;
        faction = "BLU_F";
        crew = "B_soldier_f";
        model = QPATHTOF(models\ace_m47_static.p3d);
        editorPreview = QPATHTOF(data\ace_dragon_staticAssembled.jpg);
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
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                optics = 1;
                turretInfoType = "RscWeaponEmpty";
                gunnerOpticsModel = QPATHTOF(models\optics_m47.p3d);
                minElev = -30;
                maxElev = 20;
                weapons[] = { QGVAR(dummyStatic) };
                magazines[] = { QGVAR(super) };

                gunnerAction = "gunner_static_low01";
                gunnergetInAction = "";
                gunnergetOutAction = "";

                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;

                displayName = CSTRING(dragonName);

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
        class AnimationSources {
            class rest_rotate {
                source="user";
                animPeriod=0.00001;
                initPhase=-0.35;
                maxValue="3.60";
                minValue="-3.60";
            };
            class optic_hide {
                source="user";
                animPeriod=0.0001;
                initPhase=1;
                maxValue="1";
                minValue="0";
            };
            class missile_hide {
                source="user";
                animPeriod=0.0001;
                initPhase=0;
                maxValue="1";
                minValue="0";
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
                displayName = CSTRING(dragonName);
                class GVAR(pickUp) {
                    displayName = ECSTRING(csw,Pickup_displayName);
                    condition = QUOTE(call FUNC(canPickupTripod));
                    statement = QUOTE(call EFUNC(csw,assemble_pickupTripod));
                };
                class GVAR(attachSight) {
                    displayName = CSTRING(attachSight);
                    condition = QUOTE(call FUNC(sightCanAttach));
                    statement = QUOTE(call FUNC(sightAttach));
                    icon = QPATHTOF(data\m47_daysight_interaction_attach.paa);
                };
                class GVAR(detachSight) {
                    displayName = CSTRING(detachSight);
                    condition = QUOTE(call FUNC(sightCanDetach));
                    statement = QUOTE(call FUNC(sightDetach));
                    icon = QPATHTOF(data\m47_daysight_interaction_detach.paa);
                };
            };
        };

    };

    class GVAR(staticAssembled): GVAR(staticBase) {
        scope = 2;
        class AnimationSources: AnimationSources {
            class optic_hide: optic_hide {
                initPhase = 0;
            };
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = { QGVAR(superStatic) };
            };
        };
    };
};
