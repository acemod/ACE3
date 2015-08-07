/*
 * Author: Rocko, Ruthberg
 * Confirm tactical ladder deployment
 *
 * Arguments:
 * 0: ladder <OBJECT>
 *
 * Return Value:
 * Success <BOOL>
 *
 * Example:
 * [_ladder] call ace_tacticalladder_fnc_confirmTLdeploy
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_ladder"];

private ["_pos1", "_pos2"];
_pos1 = getPosASL GVAR(ladder);
_pos2 = (GVAR(ladder) modelToWorld (GVAR(ladder) selectionPosition "check2")) call EFUNC(common,positionToASL);
if (lineIntersects [_pos1, _pos2, GVAR(ladder)]) exitWith { false };

call EFUNC(interaction,hideMouseHint);
[ACE_player, "DefaultAction", ACE_player getVariable [QGVAR(Deploy), -1]] call EFUNC(Common,removeActionEventHandler);
[ACE_player, "zoomtemp", ACE_player getVariable [QGVAR(Cancel), -1]] call EFUNC(Common,removeActionEventHandler);

detach _ladder;
GVAR(ladder) = objNull;

true
