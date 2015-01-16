/**
 * fn_isRadialOptionSelected_gui.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_number","_return"];
_number = [_this, 0, 0, [0]] call BIS_fnc_Param;
if (isnil "CSE_SELECTED_RADIAL_OPTION_N_GUI") then {
	_return = false;
} else {
	_return = (CSE_SELECTED_RADIAL_OPTION_N_GUI == _number);
};
_return