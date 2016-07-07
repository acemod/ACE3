/*
 * Author: Glowbal
 * Handle mine detection in a PFH loop
 *
 * Arguments:
 * 0: args <ARRAY>
 * 1: PHD Id <PFH_ID>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_args", "_idPFH"];
_args params ["_unit", "_type", "_detectorConfig", "_lastPlayed"];

if !([_unit, _type] call FUNC(hasDetector)) exitWith {
    // disable detector type
    [_unit, _type] call FUNC(disableDetector);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

if (!alive _unit) exitWith {
    [_unit, _type] call FUNC(disableDetector);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

if !([_unit, _type] call FUNC(isDetectorEnabled)) exitWith {
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

if (ACE_player != _unit || {currentWeapon _unit != _type}) exitWith {};

private _detected = [[_unit, _detectorConfig], FUNC(getDetectedObject), _unit, QGVAR(detectedObjects), 0.15] call EFUNC(common,cachedCall);
_detected params ["_hasDetected", "", "_distance"];

if (!_hasDetected) exitWith {};

private _distanceTiming = switch (true) do {
    case (_distance >= 2): {1};
    case (_distance >= 1.25): {0.85};
    case (_distance >= 0.75): {0.7};
    default {0.5};
};

if (CBA_missionTime - _lastPlayed < _distanceTiming) exitWith {};

_args set [3, CBA_missionTime];
_detectorConfig params ["", "", "_soundClasses"];
private _soundClass = switch (true) do {
    case (_distance >= 2): {_soundClasses select 3};
    case (_distance >= 1.25): {_soundClasses select 2};
    case (_distance >= 0.5): {_soundClasses select 1};
    default {_soundClasses select 0};
};

[_unit, _soundClass] call FUNC(playDetectorSound);
