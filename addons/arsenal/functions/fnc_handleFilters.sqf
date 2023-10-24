#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Brett Mayson
 * Handles the filters control group
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Current panel control IDC <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_ctrlIDC"];

// Handle sorting
private _filters = 	GVAR(filterListLeftPanel) select (
[
	IDC_buttonPrimaryWeapon,
	IDC_buttonHandgun,
	IDC_buttonSecondaryWeapon,
	IDC_buttonUniform,
	IDC_buttonVest,
	IDC_buttonBackpack,
	IDC_buttonHeadgear,
	IDC_buttonGoggles,
	IDC_buttonNVG,
	IDC_buttonBinoculars,
	IDC_buttonMap,
	IDC_buttonGPS,
	IDC_buttonRadio,
	IDC_buttonCompass,
	IDC_buttonWatch,
	IDC_buttonFace,
	IDC_buttonVoice,
	IDC_buttonInsignia
] find _ctrlIDC);

// {
//     if (_x isEqualTo []) then {
//         continue;
//     };

//     _x params ["_filterName", "_displayName"];

// 	_index = _sortCtrl lbAdd _displayName;
// 	_sortCtrl lbSetData [_index, _sortName];
// } forEach _filters;

private _show = _filters isNotEqualTo [];
private _ctrl = _display displayCtrl IDC_filtersBox;
_ctrl ctrlShow _show;
_ctrl ctrlCommit 0.15;

if (!_show) exitWith {};

private _filtersBoxCtrl = _display displayCtrl IDC_filtersBox;
