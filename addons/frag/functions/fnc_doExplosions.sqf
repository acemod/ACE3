/*
 * Author: ACE-Team
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_frag_fnc_doExplosions
 *
 * Public: No
 */

//fnc_doExplosions.sqf
#include "script_component.hpp"

params ["_args", "_pfhID"];
_args params ["_explosions", "_index"];

for "_i" from _index to ((_index + 2) min (count _explosions)) do {
    private _exp = _explosions select _i;
    _exp params ["_refExp", "_bpos", "_hit", "_distance", "_indirectHitRange", "_depth"];
    _refExp createVehicle (ASLtoATL _bpos);
    // if (_hit >= 150 && _distance > _indirectHitRange) then {
        // [_bpos, _refExp, _depth] call FUNC(doReflections);
    // };
};

ADD(_index,2);

if (_index >= count _explosions) then {
    [_pfhID] call CBA_fnc_removePerFrameHandler;
} else {
    _args set [1, _index];
};
