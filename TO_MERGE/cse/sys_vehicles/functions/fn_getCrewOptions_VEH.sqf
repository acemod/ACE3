/**
 * fn_getCrewOptions_VEH.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_return","_selectedTarget", "_casList"];
_return = [];

CSE_fnc_dummy = {};
if !(CSE_SYS_VEHICLE_INTERACTION_TARGET isKindOf "CaManBase") then {
	_selectedTarget = ([CSE_SYS_VEHICLE_INTERACTION_TARGET] call cse_fnc_getSelectedData_VEH);
	if (!isNull _selectedTarget) then {
		if (["cse_sys_medical"] call cse_fnc_isModuleEnabled_F) then {
			if (!([_selectedTarget] call cse_fnc_isAwake)) then {
				_return pushback ["Unload Casualty","[player,([CSE_SYS_VEHICLE_INTERACTION_TARGET] call cse_fnc_getSelectedData_VEH)] call cse_fnc_unload_CMS;","Unload Casualty"];
			};
			_return pushback ["Medical Menu","private ['_cmsTarget']; _cmsTarget = ([CSE_SYS_VEHICLE_INTERACTION_TARGET] call cse_fnc_getSelectedData_VEH); closeDialog 314436; [_cmsTarget] call cse_fnc_openMenu_CMS;","Open the CMS Medical Menu for selected unit"];
		};

		if (["cse_sys_advanced_interaction"] call cse_fnc_isModuleEnabled_F) then {
			if ([_selectedTarget] call cse_fnc_isArrested) then {
				_return pushback ["Unload Detainee","[player,([CSE_SYS_VEHICLE_INTERACTION_TARGET] call cse_fnc_getSelectedData_VEH)] call cse_fnc_unload_AIM;","Unload Detainee"];
			};
		};
	};
};

_return