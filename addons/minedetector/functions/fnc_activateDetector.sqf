#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Activates the mine detector. Selects the mine detector if not selected.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Detector type <STRING> (default: currentWeapon Unit)
 *
 * Return Value:
 * If the detector was activated <BOOL>
 *
 * Example:
 * [player, currentWeapon player] call ace_minedetector_fnc_activateDetector
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

if (!local _unit || {!alive _unit}) exitWith {
    false // return
};

private _currentWeapon = currentWeapon _unit;
private _detectorType = param [1, _currentWeapon, [""]];

if (_detectorType == "" || {!([_unit, _detectorType] call FUNC(canActivateDetector))}) exitWith {
    false // return
};

// Select mine detector if not already selected
if (_currentWeapon != _detectorType) then {
    _unit selectWeapon _detectorType;
};

// This prevents multiple PFH for the same weapon
_unit setVariable [format [QGVAR(enable_%1), _detectorType], [_unit, true], true];

if (_unit == ACE_player) then {
    playSoundUI ["ACE_Sound_Click"];
};

// API
[QGVAR(detectorEnabled), [_unit, _detectorType]] call CBA_fnc_localEvent;

// Start monitoring
[LINKFUNC(detectorLoop), 0.05, [_unit, _detectorType, _detectorType call FUNC(getDetectorConfig), CBA_missionTime - 0.25]] call CBA_fnc_addPerFrameHandler;

true // return
