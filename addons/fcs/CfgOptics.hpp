
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

class RscText;
class RscControlsGroup;
class RscMapControl;

class RscInGameUI {
    class RscUnitInfo;

    class RscOptics_Heli_Attack_02_gunner: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };
    class Rsc_ACE_Helo_UI_Turret: RscUnitInfo { // RscOptics_Heli_Attack_01_gunner
        onLoad = "[""onLoad"",_this,""RscUnitInfo"",'IGUI'] call    (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable ['ACE_dlgRangefinder', _this select 0]; ((_this select 0) displayCtrl 151) ctrlSetTextColor [0, 0, 0, 0];";
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                MACRO_RANGEFINDER
            };
        };
    };

    class RscOptics_APC_Tracked_01_gunner: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                class CA_Distance: RscText {};
            };
        };
    };
    class ACE_RscOptics_APC_Tracked_01_gunner: RscOptics_APC_Tracked_01_gunner {
        class CA_IGUI_elements_group: CA_IGUI_elements_group {
            class controls: controls {
                // MACRO_RANGEFINDER + modify IDC of CA_Distance
                class CA_Distance: CA_Distance {
                    idc = 151;
                };
                class ACE_CA_Distance: CA_Distance {
                    idc = 1713151;
                    text = "----";
                };
                class ACE_Rangehelper: RscMapControl {
                    onDraw = "((ctrlParent (_this select 0)) displayCtrl 1713151) ctrlShow (cameraView == 'GUNNER');";
                    w = 0;
                    h = 0;
                };
            };
        };
    };
};
