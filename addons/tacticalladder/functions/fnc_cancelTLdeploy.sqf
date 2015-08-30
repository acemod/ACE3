/*
 * Author: Rocko, Ruthberg
 * Cancel tactical ladder deployment
 *
 * Arguments:
 * 0: ladder <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ladder] call ace_tacticalladder_fnc_cancelTLdeploy
 *
 * Public: No
 */
#include "script_component.hpp"

#define __ANIMS ["extract_1","extract_2","extract_3","extract_4","extract_5","extract_6","extract_7","extract_8","extract_9","extract_10","extract_11"]

params ["_ladder"];

detach _ladder;
_ladder animate ["rotate", 0];
{
    _ladder animate [_x, 0];
} count __ANIMS;

call EFUNC(interaction,hideMouseHint);
[ACE_player, "DefaultAction", ACE_player getVariable [QGVAR(Deploy), -1]] call EFUNC(Common,removeActionEventHandler);
[ACE_player, "zoomtemp", ACE_player getVariable [QGVAR(Cancel), -1]] call EFUNC(Common,removeActionEventHandler);

GVAR(ladder) = objNull;
