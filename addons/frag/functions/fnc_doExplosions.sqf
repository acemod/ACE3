#include "..\script_component.hpp"
/*
 * Author: ACE-Team
 * PFH that creates the queued reflection explosions, a few per frame.
 *
 * Arguments:
 * 0: PFH Args <ARRAY>
 * - 0: Explosions to create <ARRAY>
 * - 1: Index of next explosion <NUMBER>
 * 1: PFH ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_frag_fnc_doExplosions, 0, [_explosions, 0]] call CBA_fnc_addPerFrameHandler
 *
 * Public: No
 */

params ["_args", "_pfhID"];
_args params ["_explosions", "_index"];

private _lastIndex = (_index + 1) min ((count _explosions) - 1);

for "_i" from _index to _lastIndex do {
    private _exp = _explosions select _i;
    _exp params ["_refExp", "_bpos", "_hit", "_distance", "_indirectHitRange", "_depth"];
    _refExp createVehicle (ASLToATL _bpos);
    // if (_hit >= 150 && _distance > _indirectHitRange) then {
        // [_bpos, _refExp, _depth] call FUNC(doReflections);
    // };
};

_index = _lastIndex + 1;

if (_index >= count _explosions) then {
    [_pfhID] call CBA_fnc_removePerFrameHandler;
} else {
    _args set [1, _index];
};
