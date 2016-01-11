/*
 * Author: VKing
 * Detonate explosives via script, for use in triggers or mission scripts to
 * detonate editor-placed explosives.
 *
 * Arguments:
 * 0: Explosives objects to detonate <ARRAY>
 * 1: Fuze delay (for each explosive; use negative number for random time up to value) <NUMBER> <OPTIONAL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[charge1, charge2, charge3], -1] call ACE_Explosives_fnc_scriptedExplosive;
 * [[claymore1, claymore2]] call ACE_Explosives_fnc_scriptedExplosive;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_explosiveArr",["_fuzeTime",0]];

private _detTime;
{
    _detTime = if (_fuzeTime < 0) then {random abs _fuzeTime} else {_fuzeTime};
    [objNull, -1, [_x, _detTime]] call FUNC(detonateExplosive);
} forEach _explosiveArr;
