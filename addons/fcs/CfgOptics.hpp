
#define MACRO_RANGEFINDER \
    class CA_Distance; \
    class ACE_CA_Distance: CA_Distance { \
        idc = 1713151; \
        text = "----"; \
    }; \
    class ACE_Rangehelper: RscMapControl { \
        onDraw = "((ctrlParent (_this select 0)) displayCtrl 1713151) ctrlShow (cameraView == 'GUNNER');"; \
        w = 0; \
        h = 0; \
    };

class RscControlsGroup;
class RscMapControl;

class RscInGameUI {
    class RscUnitInfo;
    class RscUnitInfo_AH64D_gunner {
        controls[] = {"CA_Distance","ACE_CA_Distance"};
        MACRO_RANGEFINDER
    };
    class RscWeaponRangeFinder {
        controls[] = {"CA_Distance","ACE_CA_Distance"};
        MACRO_RANGEFINDER
    };

    class RscWeaponRangeFinderPAS13 {
        MACRO_RANGEFINDER
    };
    class RscOptics_Rangefinder: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscWeaponRangeFinderMAAWS {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscWeaponRangeFinderAbramsCom {
        controls[] = {"CA_Distance","ACE_CA_Distance"};
        MACRO_RANGEFINDER
    };
    class RscWeaponRangeFinderAbramsGun {
        controls[] = {"CA_Distance","ACE_CA_Distance"};
        MACRO_RANGEFINDER
    };
    class RscWeaponRangeFinderStrykerMGSGun {
        controls[] = {"CA_Distance","ACE_CA_Distance"};
        MACRO_RANGEFINDER
    };
    class RscOptics_crows: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_strider_commander {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };

    class RscWeaponRangeZeroing: RscUnitInfo {
        controls[] = {"CA_Zeroing", "CA_DistanceText", "CA_Distance","ACE_CA_Distance", "ACE_Rangehelper"};
        MACRO_RANGEFINDER
    };
    class RscOptics_sos: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_nightstalker: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_tws: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_punisher {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_tws_sniper: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_SDV_periscope {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_Heli_Attack_02_gunner: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
     class Rsc_ACE_Helo_UI_Turret: RscUnitInfo {
        onLoad = "uiNamespace setVariable ['ACE_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0]; [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_Heli_Attack_01_gunner: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_UAV_gunner: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_UGV_gunner: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_APC_Tracked_01_gunner: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_APC_Tracked_03_gunner: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_APC_Wheeled_01_gunner: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_APC_Wheeled_03_commander: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_APC_Wheeled_03_gunner: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_MBT_01_commander: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_MBT_01_gunner: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_MBT_02_commander: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_MBT_02_gunner: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class RscOptics_MBT_03_gunner: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };

    // marksmen
    class RscOptics_LaserDesignator_02 {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
};
