#include "..\script_component.hpp"
/*
 * Author: Rocko, Ruthberg, commy2
 * Confirm tactical ladder deployment
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: ladder <OBJECT>
 *
 * Return Value:
 * Success <BOOL>
 *
 * Example:
 * [_ladder] call ace_tacticalladder_fnc_confirmTLdeploy
 *
 * Public: No
 */

params ["_unit", "_ladder"];

// enable running again
[_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

private _pos1 = getPosASL _ladder;
private _pos2 = _ladder modelToWorldWorld (_ladder selectionPosition "check2");

if (lineIntersects [_pos1, _pos2, _ladder]) exitWith {false};

detach _ladder;

// remove mouse buttons and hint
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Deploy), -1]] call EFUNC(common,removeActionEventHandler);

GVAR(ladder) = objNull;

true
