#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Adds custom fire scream sounds for a unit class.
 *
 * Arguments:
 * 0: Unit class <STRING>
 * 1: Array of CfgSounds classes <ARRAY<STRING>>
 * 2: Overwrite existing (optional, default: false) <BOOL>
 *
 * Return Value:
 * Succeeded <BOOL>
 *
 * Example:
 * [typeOf player, ["sound1", "sound2"]] call ace_fire_fnc_addScreamSounds
 *
 * Public: Yes
 */

params [["_unitClass", "", [""]], ["_screams", [], [[]]], ["_overwrite", false, [false]]];
TRACE_3("fnc_addScreamSounds",_unitClass,_screams,_overwrite);

if (_unitClass == "" || _screams isEqualTo [] || (!_overwrite && _unitClass in GVAR(screams))) exitWith { false };

GVAR(screams) set [_unitClass, _screams];
true;
