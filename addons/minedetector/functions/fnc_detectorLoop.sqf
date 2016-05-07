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

if !([_unit, _type] call FUNC(hasDetectorType)) exitwith {
    // disable detector type
    [_unit, _type] call FUNC(disableDetector);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

if (!alive _unit) exitwith {
    [_unit, _type] call FUNC(disableDetector);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

if !([_unit, _type] call FUNC(isDetectorEnabled)) exitwith {
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

if (ACE_player == _unit && {currentWeapon _unit == _type}) then {
    private _detected = [_unit, _detectorConfig] call FUNC(getDetectedObject);
    _detected params ["_hasDetected", "_object", "_distance"];
    if (_hasDetected && {ACE_time - _lastPlayed > 0.9}) then {
        _args set [3, ACE_time];
        _detectorConfig params ["_type", "_radius", "_detectableTypes", "_sounds"];
        private _sound = _sounds select (_distance >= 1.2);
        [_unit, _sound, true] call FUNC(playDetectorSound);
    };
};
