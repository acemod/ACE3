/**
 * fn_openScreen_cc_app_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

//_this spawn {
	//[_deviceName] call cse_fnc_clearDeviceScreen_CC;
	private ["_deviceName"];
	_deviceName = _this select 0;
	[_deviceName,"main","full"] call cse_fnc_setMap_CC;

	if (isnil "CSE_CURRENT_SELECTED_FILTER_CC_APP_CC") then {
		CSE_CURRENT_SELECTED_FILTER_CC_APP_CC = -1;
		CSE_TOGGLE_ROUTE_LAYER_CC = false;
		CSE_TOGGLE_INTEL_LAYER_CC = false;
		CSE_TOGGLE_CALLSIGNS_CC = false;
		CSE_SELECTED_ICON_CC = "";
	};

