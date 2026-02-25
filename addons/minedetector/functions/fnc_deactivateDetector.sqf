#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Deactivates the mine detector.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Detector type <STRING> (default: currentWeapon Unit)
 *
 * Return Value:
 * If the detector was deactivated <BOOL>
 *
 * Example:
 * [player, currentWeapon player] call ace_minedetector_fnc_deactivateDetector
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

if (!local _unit) exitWith {
    false // return
};

private _detectorType = param [1, currentWeapon _unit, [""]];

if (_detectorType == "" || {!([_unit, _detectorType] call FUNC(canDeactivateDetector))}) exitWith {
    false // return
};

_unit setVariable [format [QGVAR(enable_%1), _detectorType], nil, true];

if (alive _unit && {_unit == ACE_player}) then {
    playSoundUI ["ACE_Sound_Click"];
};

// API
[QGVAR(detectorDisabled), [_unit, _detectorType]] call CBA_fnc_localEvent;

true // return
