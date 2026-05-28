#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Adds custom fire scream sounds for a unit class.
 *
 * Arguments:
 * 0: Unit class <STRING>
 * 1: Array of CfgSounds classes <ARRAY of STRINGs>
 * 2: Append to existing sounds array <BOOL> (default: true)
 *    - true : Passed sounds will be added to unit's existing sounds
 *    - false: Passed sounds will replace unit's existing sounds
 *
 * Return Value:
 * Succeeded <BOOL>
 *
 * Example:
 * [typeOf player, ["sound1", "sound2"]] call ace_fire_fnc_addScreamSounds
 *
 * Public: Yes
 */

params [["_unitClass", "", [""]], ["_screams", [], [[]]], ["_append", true, [false]]];
TRACE_3("fnc_addScreamSounds",_unitClass,_screams,_overwrite);

if (_unitClass == "" || _screams isEqualTo [] || !(_unitClass isKindOf "CAManBase")) exitWith { false };

if (_append) then {
    private _existingScreams = _unitClass call FUNC(getScreamSounds);
    _existingScreams append _screams;
    GVAR(screamSounds) set [_unitClass, _existingScreams];
} else {
    GVAR(screamSounds) set [_unitClass, _screams];
};

true // return
