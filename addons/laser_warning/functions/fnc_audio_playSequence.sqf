#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Plays a constructed audio sequence
 *
 * Arguments:
 * 0: Sequence <ARRAY>
 * 1: Only play to crew <BOOL>
 *
 * Return Values:
 * 0: Start time <NUMBER>
 * 1: Sequence length <NUMBER>
 * 2: Audio source <OBJECT>
 * Example:
 * [[], false] call ace_laser_warning_fnc_audio_playSequence;
 *
 * Public: No
 */
params ["_sequence", "_targets"];

private _accumulatedLength = 0;
private _sourceObject = createVehicle ["#particlesource", [0, 0, 0], [], 0, "NONE"];
{
    _x params ["_clip", "_length"];
    [{
        params ["_clip", "_source", "_targets"];
        private _params = [_clip, 100, 1, 2];
        if (_targets isNotEqualTo []) then {
            [QGVAR(say3D), [_source, _params, true], _targets] call CBA_fnc_targetEvent;
        } else {
            [QGVAR(say3D), [_source, _params, true]] call CBA_fnc_globalEvent;
        };
    }, [_clip, _sourceObject, _targets], _accumulatedLength] call CBA_fnc_waitAndExecute;
    _accumulatedLength = _accumulatedLength + _length;
} forEach _sequence;

[{
    deleteVehicle _this;
}, _sourceObject, _accumulatedLength + 0.5] call CBA_fnc_waitAndExecute;
[CBA_missionTime, _accumulatedLength, _sourceObject]