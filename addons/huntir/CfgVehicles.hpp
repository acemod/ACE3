
class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(open) {
                    displayName = CSTRING(activateMonitor);
                    condition = QUOTE([ARR_2(ACE_player,'ACE_HuntIR_monitor')] call EFUNC(common,hasItem));
                    statement = QUOTE([FUNC(huntir)] call CBA_fnc_execNextFrame;);
                    showDisabled = 0;
                    icon = QPATHTOF(UI\w_huntir_monitor_ca.paa);
                    exceptions[] = {};
                };
            };
        };
    };

    class Parachute_02_base_F;
    class ACE_HuntIR: Parachute_02_base_F {
        author = ECSTRING(common,ACETeam);
        castDriverShadow = 0;
        destrType = "DestructDefault";
        displayName = "HuntIR";
        model = QPATHTOF(data\huntir.p3d);
        scope = 1;
        soundCrash[] = {"", db-30, 1 };
        soundEnviron[] = {"z\ace\addons\apl\sounds\padak_let", 0.316228, 1, 80};
        soundLandCrash[] = {"", db-30, 1 };
        soundWaterCrash[] = {"", db10, 1 };
        class HitPoints {
            class HitEngine {
                armor = 0;
                material = -1;
                name = "";
                visual = "";
                radius = 0;
                passThrough = 0;
                explosionShielding = 0;
            };
            class HitParachute {
                armor = 0.0001;
                material = -1;
                name = "parachute";
                visual = "";
                radius = 0.2;
                passThrough = 1;
                explosionShielding = 0;
            };
            class HitCamera {
                armor = 0.001;
                material = -1;
                name = "camera";
                visual = "";
                radius = 0.025;
                passThrough = 1;
                explosionShielding = 1;
            };
        };
    };

    class Item_Base_F;
    class ACE_Item_HuntIR_monitor: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(monitor_displayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_HuntIR_monitor,1);
        };
    };

    class ReammoBox_F;
    class ACE_HuntIR_Box: ReammoBox_F {
        model = QPATHTOF(data\ace_huntirbox.p3d);
        displayName = $STR_DN_ACE_HUNTIRBOX;
        class TransportItems {
            MACRO_ADDITEM(ACE_HuntIR_monitor,5);
        };
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_HuntIR_M203,20);
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_HuntIR_monitor,5);
        };
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_HuntIR_M203,20);
        };
    };
};
