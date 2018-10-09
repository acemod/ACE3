// by commy2

class RscStructuredText;
class RscMapControl;
class ctrlStructuredText;

class GVAR(debug_structuredText): ctrlStructuredText {
    sizeEx = "16 * pixelH";
    size = "16 * pixelH";
};

class RscTitles {
    class GVAR(watchVariableUI) {
        idd = -1;
        onLoad = QUOTE(with uiNameSpace do {GVAR(watchVariableUI) = _this select 0};);
        movingEnable = 0;
        duration = 999999;
        fadeIn = "false";
        fadeOut = "false";
        class controls {};
    };

    class ACE_RscHint {
        idd = -1;
        onLoad = "uiNamespace setVariable ['ACE_ctrlHint', (_this select 0) displayCtrl 1];";
        movingEnable = false;
        duration = 4;
        fadeIn = 0.2;
        fadeOut = 0.2;
        name = "ACE_RscHint";

        class controls {
            class HintBox: RscStructuredText {
                idc = 1;
                text = "";
                //size = "1 / 40 / (getResolution select 5)";
                SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0.5};
                x = safeZoneW + safeZoneX - 0 * safezoneW;  //safeZoneW + safeZoneX - 0.2 * safezoneW;
                y = safeZoneY + 0.2 * safezoneH;
                w = 0.2 * safeZoneW;
                h = 0.1 * SafeZoneH;
                font = "RobotoCondensed";
            };
        };
    };
    class ACE_RscErrorHint {
        idd = -1;
        onLoad = "uiNamespace setVariable ['ACE_ctrlErrorHint', (_this select 0) displayCtrl 1];";
        movingEnable = false;
        duration = 999999;
        fadeIn = 0.2;
        fadeOut = 0.2;
        name = "ACE_RscErrorHint";
        class controls {
            class HintBox: RscStructuredText {
                idc = 1;
                text = "";
                //size = "1 / 40 / (getResolution select 5)";
                SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0.8, 0, 0, 0.5};
                x = 0.3 * safeZoneW + safeZoneX;
                y = 0.4 * safezoneH + safeZoneY;
                w = 0.4 * safeZoneW;
                h = 0.2 * SafeZoneH;
            };
        };
    };

    class ACE_EventHandlerHelper2: ACE_Rsc_Display_Base {
        class controls {
            class MapMarkerCreated: RscMapControl {
                onDraw = "if (count allMapMarkers != uiNamespace getVariable 'ACE_EventHandler_MapMarker') then {if (count allMapMarkers > uiNamespace getVariable 'ACE_EventHandler_MapMarker') then {{[allMapMarkers select count allMapMarkers - 1] call _x; nil} count ((missionNamespace getVariable 'ACE_EventHandler_MapMarker') select 2);}; uiNamespace setVariable ['ACE_EventHandler_MapMarker', count allMapMarkers];};";
                idc = -1;
                w = 0;
                h = 0;
            };
        };
    };
};
