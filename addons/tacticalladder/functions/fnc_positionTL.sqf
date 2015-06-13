/*
 * Author: Rocko, Ruthberg
 * Position tactical ladder
 *
 * Arguments:
 * 0: sandbag <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ladder, _unit] call ace_tacticalladder_fnc_positionTL;
 *
 * Public: No
 */
#include "script_component.hpp"

#define __ANIMS ["extract_1","extract_2","extract_3","extract_4","extract_5","extract_6","extract_7","extract_8","extract_9","extract_10","extract_11"]

PARAMS_2(_ladder,_unit);

{
    _ladder animate [_x, 0];
} forEach __ANIMS;

_unit switchMove "amovpercmstpslowwrfldnon_player_idlesteady03";
_ladder attachTo [_unit, [0, 0.75, 0], ""]; // Position ladder in front of player

_ladder animate ["rotate", 0];
{
    _ladder animate [_x, 1];
} forEach ["extract_1", "extract_2", "extract_3"]; // Extract ladder at head height (extract_3)

GVAR(ladder) = _ladder;
GVAR(cancelTime) = ACE_time + 1; // Workaround to prevent accidental canceling
GVAR(currentStep) = 3;
GVAR(currentAngle) = 0;

[localize LSTRING(Deploy), localize LSTRING(Drop), localize LSTRING(Adjust)] call EFUNC(interaction,showMouseHint);

ACE_player setVariable [QGVAR(Deploy),
    [ACE_player, "DefaultAction",
    {!isNull GVAR(ladder)},
    {GVAR(ladder) call FUNC(confirmTLdeploy);}
] call EFUNC(common,AddActionEventHandler)];

ACE_player setVariable [QGVAR(Cancel),
    [ACE_player, "zoomtemp",
    {!isNull GVAR(ladder)},
    {GVAR(ladder) call FUNC(cancelTLdeploy);}
] call EFUNC(common,AddActionEventHandler)];
