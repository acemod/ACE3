/**
 * fn_getSelectedData_VEH.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_veh","_curSelected", "_return","_loaded","_crew"];
_veh = _this select 0;
    _curSelected = lbCurSel 212;
    _return = ObjNull;

    if (_curSelected > -1) then {
		if (CSE_LATEST_DISPLAY_OPTION_MENU_VEH == "cargo") then {
			_loaded = _veh getvariable ["cse_logistics_loadedCargo_LOG",[]];
			if (_curSelected >= count _loaded) exitwith{};
			_return = _loaded select _curSelected;
		};


		if (CSE_LATEST_DISPLAY_OPTION_MENU_VEH == "crew") then {
			_crew = crew _veh;
			if (_curSelected >= count _crew) exitwith{};
			_return = _crew select _curSelected;
		};
    };
_return