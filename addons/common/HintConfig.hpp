// by commy2

class RscStructuredText;
class RscMapControl;

class RscTitles {
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
                size = "1 / 40 / (getResolution select 5)";
                sizeEx = 1;
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0.5};
                x = safeZoneW + safeZoneX - 0 * safezoneW;  //safeZoneW + safeZoneX - 0.2 * safezoneW;
                y = safeZoneY + 0.2 * safezoneH;
                w = 0.2 * safeZoneW;
                h = 0.1 * SafeZoneH;
                font = "PuristaMedium";
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
                size = "1 / 40 / (getResolution select 5)";
                sizeEx = 1;
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0.8, 0, 0, 0.5};
                x = 0.3 * safeZoneW + safeZoneX;
                y = 0.4 * safezoneH + safeZoneY;
                w = 0.4 * safeZoneW;
                h = 0.2 * SafeZoneH;
            };
        };
    };
  class ACE_RscDisplayMessage {
    duration = 7;
    idd = 86411;
    movingenable = 0;
    onLoad = "uiNamespace setVariable ['ACE_RscDisplayMessage', _this select 0];";
    fadein = 0;
    class controlsBackground {
      class header: ACE_gui_staticBase {
        idc = 1;
        type = CT_STATIC;
        x = "safezoneX + (safezoneW / 10)";
        y = "safezoneY + (30 * (safeZoneH / 40))";
        w = "(safeZoneW / 10)";
        h = "(safeZoneH / 40)";
        style = ST_LEFT;
        font = FontCSE;
        SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        colorText[] = {0.85, 0.85, 0.85, 1.0};
        colorBackground[] = {0, 0, 0, 0.9};
        text = "";
      };
      class text: header {
        idc = 2;
        y = "safezoneY + (31 * (safeZoneH / 40))";
        w = "(safeZoneW / 10) * 1.3";
        colorText[] = {0.0, 0.0, 0.0, 1.0};
        colorBackground[] = {1, 1, 1, 0.9};
        text = "";
      };
    };
  };

  class ACE_RscDisplayInformation {
    duration = 15;
    idd = 86412;
    movingenable = 0;
    onLoad = "uiNamespace setVariable ['ACE_RscDisplayInformation', _this select 0];";
    fadein = 0;
    class controlsBackground {
      class header: ACE_gui_staticBase {
        idc = 1;
        type = CT_STATIC;
        x = "safezoneX + (safezoneW / 10)";
        y = "safezoneY + (6 * (safeZoneH / 40))";
        w = "(safeZoneW / 10)";
        h = "(safeZoneH / 40)";
        style = ST_LEFT;
        font = FontCSE;
        SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        colorText[] = {0.85, 0.85, 0.85, 1.0};
        colorBackground[] = {0, 0, 0, 0.9};
        text = "";
      };
      class text: header {
        idc = 2;
        y = "safezoneY + (7.1 * (safeZoneH / 40))";
        w = "(safeZoneW / 10) * 1.3";
        colorText[] = {0.0, 0.0, 0.0, 1.0};
        colorBackground[] = {1, 1, 1, 0.9};
        text = "";
      };
      class text2: text {
        idc = 3;
        y = "safezoneY + (8.2 * (safeZoneH / 40))";
      };
      class text3: text {
        idc = 4;
        y = "safezoneY + (9.3 * (safeZoneH / 40))";
      };
      class text4: text {
        idc = 5;
        y = "safezoneY + (10.4 * (safeZoneH / 40))";
      };
      class text5: text {
        idc = 6;
        y = "safezoneY + (11.5 * (safeZoneH / 40))";
      };


      class icon: ACE_gui_backgroundBase {
        type = CT_STATIC;
        idc = 10;
        style = ST_PICTURE;
        colorBackground[] = {0,0,0,1};
        colorText[] = {1, 1, 1, 1};
        font = FontCSE;
        text = "";
        sizeEx = 0.032;
        x = "safezoneX + (safezoneW / 10)";
        y = "safezoneY + (4 * (safeZoneH / 40))";
        w = "(safeZoneH / 40)*2";
        h = "(safeZoneH / 40)*2";
      };
    };
  };

    class ACE_EventHandlerHelper: ACE_Rsc_Display_Base {
        idd = -1;
        class controls {
            class CameraView: RscMapControl {
                onDraw = "if (cameraView != uiNamespace getVariable 'ACE_EventHandler_CameraMode') then {uiNamespace setVariable ['ACE_EventHandler_CameraMode', cameraView]; {[uiNamespace getVariable 'ACE_EventHandler_CameraMode'] call _x; nil} count ((missionNamespace getVariable 'ACE_EventHandler_CameraMode') select 2);};";
                idc = -1;
                w = 0;
                h = 0;
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
