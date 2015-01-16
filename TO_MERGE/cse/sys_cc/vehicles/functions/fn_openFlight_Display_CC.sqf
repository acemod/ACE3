/**
 * fn_openFlight_Display_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_vehicle", "_displayName"];
_vehicle = _this select 0;

if !([player, _vehicle] call cse_fnc_canUseOnBoard_BFT_Device_CC) exitWith {};

_displayName = "cse_m_flight_display";

if !(_vehicle isKindOf "Air") then {
	_displayName = "cse_m_vehicle_display";
};

createDialog _displayName;
CSE_CURRENT_VEHICLE_BFT_DISPLAY_CC = _vehicle;

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

CSE_CURRENT_VEHICLE_BFT_DISPLAY_ICON_CC = getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "icon");

disableSerialization;
_display = uiNamespace getvariable _displayName;

(_display displayCtrl 10) ctrlAddEventHandler ["draw","
		{[_x,(_this select 0)] call cse_fnc_drawBFTIcons_Vehicles_CC;}foreach CSE_TRACKER_ICONS;
		if (CSE_TOGGLE_INTEL_LAYER_CC) then {{[_x,(_this select 0)] call cse_fnc_drawBFTMarker_Vehicles_CC;}foreach CSE_INTEL_MARKER_COLLECTION_CC;};
		if (CSE_TOGGLE_ROUTE_LAYER_CC) then {{[_x,(_this select 0)] call cse_fnc_drawBFTMarker_Vehicles_CC;}foreach CSE_ROUTE_MARKER_COLLECTION_CC;};
	"];
