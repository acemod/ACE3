// by commy2

class RscStructuredText;
class RscMapControl;

class RscTitles {
	class AGM_RscHint {
		idd = -1;
		onLoad = "uiNamespace setVariable ['AGM_ctrlHint', (_this select 0) displayCtrl 1];";
		movingEnable = false;
		duration = 4;
		fadeIn = 0.2;
		fadeOut = 0.2;
		name = "AGM_RscHint";

		class controls {
			class HintBox: RscStructuredText {
				idc = 1;
				text = "";
				size = "1 / 40 / (getResolution select 5)";
				sizeEx = 1;
				colorText[] = {1, 1, 1, 1};
				colorBackground[] = {0, 0, 0, 0.5};
				x = safeZoneW + safeZoneX - 0 * safezoneW;	//safeZoneW + safeZoneX - 0.2 * safezoneW;
				y = safeZoneY + 0.2 * safezoneH;
				w = 0.2 * safeZoneW;
				h = 0.1 * SafeZoneH;
			};
		};
	};
	class AGM_RscErrorHint {
		idd = -1;
		onLoad = "uiNamespace setVariable ['AGM_ctrlErrorHint', (_this select 0) displayCtrl 1];";
		movingEnable = false;
		duration = 999999;
		fadeIn = 0.2;
		fadeOut = 0.2;
		name = "AGM_RscErrorHint";

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
	class AGM_EventHandlerHelper: AGM_Rsc_Display_Base {
		idd = -1;
		class controls {
			class CameraView: RscMapControl {
				onDraw = "if (cameraView != uiNamespace getVariable 'AGM_EventHandler_CameraMode') then {uiNamespace setVariable ['AGM_EventHandler_CameraMode', cameraView]; {[uiNamespace getVariable 'AGM_EventHandler_CameraMode'] call _x; nil} count ((missionNamespace getVariable 'AGM_EventHandler_CameraMode') select 2);};";
				idc = -1;
				w = 0;
				h = 0;
			};
		};
	};
	class AGM_EventHandlerHelper2: AGM_Rsc_Display_Base {
		class controls {
			class MapMarkerCreated: RscMapControl {
				onDraw = "if (count allMapMarkers != uiNamespace getVariable 'AGM_EventHandler_MapMarker') then {if (count allMapMarkers > uiNamespace getVariable 'AGM_EventHandler_MapMarker') then {{[allMapMarkers select count allMapMarkers - 1] call _x; nil} count ((missionNamespace getVariable 'AGM_EventHandler_MapMarker') select 2);}; uiNamespace setVariable ['AGM_EventHandler_MapMarker', count allMapMarkers];};";
				idc = -1;
				w = 0;
				h = 0;
			};
		};
	};
};
