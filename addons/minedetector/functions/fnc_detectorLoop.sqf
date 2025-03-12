#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Handles mine detection in a PFH loop.
 *
 * Arguments:
 * 0: Args <ARRAY>
 * 1: PFH Id <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[args], 2] call ace_minedetector_fnc_detectorLoop
 *
 * Public: No
 */

params ["_args", "_pfhID"];
_args params ["_unit", "_detectorType", "_detectorConfig", "_lastPlayed"];

// Check that the unis is in a valid state and if the unit hasn't switched weapons
if (!alive _unit || {_unit != ACE_player} || {currentWeapon _unit != _detectorType}) exitWith {
    [_unit, _detectorType] call FUNC(deactivateDetector);

    _pfhID call CBA_fnc_removePerFrameHandler;
};

if !([_unit, _detectorType] call FUNC(isDetectorEnabled)) exitWith {
    _pfhID call CBA_fnc_removePerFrameHandler;
};

private _detected = [[_unit, _detectorType, _detectorConfig], FUNC(getDetectedObject), _unit, QGVAR(detectedObjects), 0.15] call EFUNC(common,cachedCall);
_detected params ["_hasDetected", "_mine", "_distance"];

if (!_hasDetected) exitWith {};

// API
[QGVAR(mineDetected), [_unit, _mine, _distance, _detectorType]] call CBA_fnc_localEvent;

_detectorConfig params ["", "", "_sounds", "_soundDistances", "_soundIntervals", "_soundIntervalDistances"];

private _index = _soundIntervalDistances findIf {_distance >= _x};

if (_index == -1 || {CBA_missionTime - _lastPlayed < _soundIntervals select _index}) exitWith {};

_args set [3, CBA_missionTime];

// Find the sound class to play that matches with distance
_index = _soundDistances findIf {_distance >= _x};

if (_index == -1) exitWith {};

[_unit, _sounds select _index] call FUNC(playDetectorSound);
