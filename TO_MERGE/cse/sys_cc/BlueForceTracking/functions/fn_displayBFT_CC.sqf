/**
 * fn_displayBFT_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName", "_display"];
_deviceName = _this select 0;
if (isnil "CSE_CURRENT_SELECTED_FILTER_CC_APP_CC") then {
	CSE_CURRENT_SELECTED_FILTER_CC_APP_CC = -1;
	CSE_TOGGLE_ROUTE_LAYER_CC = true;
	CSE_TOGGLE_INTEL_LAYER_CC = true;
	CSE_TOGGLE_CALLSIGNS_CC = true;
	CSE_SELECTED_ICON_CC = "";
};

if (isnil "CSE_INTEL_MARKER_COLLECTION_CC") then {
	CSE_INTEL_MARKER_COLLECTION_CC = [];
};
if (isnil "CSE_ROUTE_MARKER_COLLECTION_CC") then {
	CSE_ROUTE_MARKER_COLLECTION_CC = [];
};
if (isnil "CSE_TRACKER_ICONS") then {
	CSE_TRACKER_ICONS = [];
};

/*
		{
			if (call (_X select 0)) then {
				{
					[_x,(_this select 0)] call cse_fnc_drawBFTMarker_CC;
				}foreach (_x select 1);
			};
		}foreach CSE_MARKER_COLLECTIONS_CC;
*/


disableSerialization;
_display = uiNamespace getvariable _deviceName;
(_display displayCtrl 10) ctrlAddEventHandler ["draw","
		{[_x,(_this select 0)] call cse_fnc_drawBFTIcons_CC;}foreach CSE_TRACKER_ICONS;

		if (CSE_TOGGLE_INTEL_LAYER_CC) then {{[_x,(_this select 0)] call cse_fnc_drawBFTMarker_CC;}foreach CSE_INTEL_MARKER_COLLECTION_CC;};
		if (CSE_TOGGLE_ROUTE_LAYER_CC) then {{[_x,(_this select 0)] call cse_fnc_drawBFTMarker_CC;}foreach CSE_ROUTE_MARKER_COLLECTION_CC;};
		"];

(_display displayCtrl 10) ctrlAddEventHandler ["MouseButtonUp",'if ((_this select 1) == 0) then {[[_this select 2, _this select 3]] call cse_fnc_clickedOnMap_CC;};'];
(_display displayCtrl 10) ctrlAddEventHandler ["MouseMoving",'CSE_MOUSE_RELATIVE_POSITION = [_this select 1, _this select 2];'];
(_display displayCtrl 10) ctrlMapAnimAdd [0, 0.05, player];
ctrlMapAnimCommit (_display displayCtrl 10);