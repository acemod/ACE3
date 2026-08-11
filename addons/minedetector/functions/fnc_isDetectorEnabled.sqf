#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Checks if the mine detector is enabled.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Detector type <STRING> (default: currentWeapon Unit)
 *
 * Return Value:
 * Is Enabled <BOOL>
 *
 * Example:
 * [player, currentWeapon player] call ace_minedetector_fnc_isDetectorEnabled
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

if (!alive _unit) exitWith {
    false // return
};

private _detectorType = param [1, currentWeapon _unit, [""]];

_detectorType != "" && {(_unit getVariable [format [QGVAR(enable_%1), _detectorType], false]) isEqualTo [_unit, true]} // return
