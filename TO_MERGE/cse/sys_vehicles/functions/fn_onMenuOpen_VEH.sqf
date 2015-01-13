/**
 * fn_onMenuOpen_VEH.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

_this spawn {
	if (isnil "CSE_LATEST_DISPLAY_OPTION_MENU_VEH") then {
		CSE_LATEST_DISPLAY_OPTION_MENU_VEH = "crew";
	};
	CSE_VEHICLE_INTERACTION_MENU_OPEN = true;
	private ["_display","_target","_previous"];
	_target = CSE_SYS_VEHICLE_INTERACTION_TARGET;
	[CSE_LATEST_DISPLAY_OPTION_MENU_VEH,_target] call cse_fnc_displayOptions_VEH;

	// 11 till 18
	disableSerialization;
	_display = uiNamespace getVariable 'cse_sys_vehicleMenu';
	(_display displayCtrl 11) ctrlSetTooltip "Crew";
	(_display displayCtrl 12) ctrlSetTooltip "Cargo";
	(_display displayCtrl 13) ctrlSetTooltip "Damages & Repair";

	(_display displayCtrl 1) ctrlSetText format["%1",(getText(configFile >> "Cfgvehicles" >> typeof _target >> "displayName"))];

	cse_fnc_updateIcons_VEH = {
		private ["_display","_startIDC","_idc","_options","_name","_amount"];
		disableSerialization;
		_display = uiNamespace getVariable 'cse_sys_vehicleMenu';
		_startIDC = 111;

		_options = ["crew","cargo","repair"]; // temp from 118 to 111 (ONLY NEED THIS ONCE FOR NOW);
		for "_idc" from _startIDC to 118 step 1 do
	    {
	    	if (count _options <= (_idc - 111)) exitwith{};
	    	_name = _options select (_idc - 111);
	    	_amount = switch (_name) do {
	    		case "crew": {crew CSE_SYS_VEHICLE_INTERACTION_TARGET};
	    		case "cargo": {CSE_SYS_VEHICLE_INTERACTION_TARGET getvariable ["cse_logistics_loadedCargo_LOG",[]]};
				case "repair": {[_name] call cse_fnc_getRepairOptions_VEH};
				case "advanced": {[]};
				default {[]};
			};
	    	if ((count _amount) > 0) then {
	    		(_display displayCtrl _idc) ctrlSettextColor [1,1,1,1];
	    	} else {
	    		(_display displayCtrl _idc) ctrlSettextColor [0.4,0.4,0.4,1];
	    	};
	    };
	};

	["cse_onMenuOpen_Veh", "onEachFrame", {
		[CSE_LATEST_DISPLAY_OPTION_MENU_VEH] call cse_fnc_displayOptions_VEH;
		[CSE_SYS_VEHICLE_INTERACTION_TARGET] call cse_fnc_updateInformationList_VEH;
		[] call cse_fnc_updateIcons_VEH;
	 }, [_display]] call BIS_fnc_addStackedEventHandler;

};