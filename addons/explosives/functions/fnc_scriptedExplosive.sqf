#include "..\script_component.hpp"
/*
 * Author: VKing
 * Detonate explosives via script, for use in triggers or mission scripts to detonate editor-placed explosives.
 *
 * Arguments:
 * 0: Explosives objects to detonate <OBJECT or ARRAY of OBJECTs> (default: [])
 * 1: Fuse delay (for all explosives; use negative number for random time up to value) <NUMBER> (default: 0)
 * 2: Trigger Item Classname <STRING> (default: "#scripted")
 *
 * Return Value:
 * None
 *
 * Example:
 * [[charge1, charge2, charge3], -1] call ace_explosives_fnc_scriptedExplosive
 * [[claymore1, claymore2]] call ace_explosives_fnc_scriptedExplosive
 *
 * Public: Yes
 */

params [["_explosiveArr", [], [[], objNull]], ["_fuseTime", 0, [0]], ["_triggerClassname", "#scripted", [""]]];

if (_explosiveArr isEqualType objNull) then {
    _explosiveArr = [_explosiveArr];
};

{
    private _detTime = if (_fuseTime < 0) then {random abs _fuseTime} else {_fuseTime};
    [objNull, -1, [_x, _detTime], _triggerClassname] call FUNC(detonateExplosive);
} forEach _explosiveArr;
