/**
 * fn_setRadialOptionSelected_gui.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_number","_selected","_display","_backgroundCtrl"];
_number = [_this, 0, 10, [0]] call BIS_fnc_Param;
_selected = [_this, 1, false, [false]] call BIS_fnc_Param;

if (_number > 9 && _number < 18 || _number == -1) then {
	disableSerialization;
	_display = uiNamespace getvariable "CSE_RADIAL_MENU";

	for "_i" from 800 to 808 do {
		_backgroundCtrl = _display displayCtrl _i;
		_backgroundCtrl ctrlSetTextColor [ 0, 0, 0, 0.66];
	};
	CSE_SELECTED_RADIAL_OPTION_N_GUI = _number;
	if (_number != -1) then {
		_backgroundCtrl = _display displayCtrl (_number + 790);
		if (_selected) then {
			_backgroundCtrl ctrlSetTextColor [ 0.77, 0.5, 0.0, 0.66];
		} else {
			_backgroundCtrl ctrlSetTextColor [ 0, 0, 0, 0.66];
		};
		_backgroundCtrl ctrlCommit 0;
	};

};