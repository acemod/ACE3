/*
 * Author: Rocko, Ruthberg
 * Position tactical ladder
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: ladder <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, _ladder] call ace_tacticalladder_fnc_positionTL
 *
 * Public: No
 */
#include "script_component.hpp"

#define __ANIMS ["extract_1","extract_2","extract_3","extract_4","extract_5","extract_6","extract_7","extract_8","extract_9","extract_10","extract_11"]

params ["_unit", "_ladder"];

// prevent the placing unit from running
[_unit, "ACE_Ladder", true] call EFUNC(common,setForceWalkStatus);

{
    _ladder animate [_x, 0];
} count __ANIMS;

[_unit, "amovpercmstpslowwrfldnon_player_idlesteady03", 2] call EFUNC(common,doAnimation);

_ladder attachTo [_unit, [0, 0.75, 0], ""]; // Position ladder in front of player

_ladder animate ["rotate", 0];
{
    _ladder animate [_x, 1];
} count ["extract_1", "extract_2", "extract_3"]; // Extract ladder at head height (extract_3)

GVAR(ladder) = _ladder;
GVAR(cancelTime) = ACE_time + 1; // Workaround to prevent accidental canceling
GVAR(currentStep) = 3;
GVAR(currentAngle) = 0;

// add mouse buttons and hints
[localize LSTRING(Deploy), localize LSTRING(Drop), localize LSTRING(Adjust)] call EFUNC(interaction,showMouseHint);

_unit setVariable [QGVAR(Deploy), [
    _unit, "DefaultAction",
    {!isNull GVAR(ladder)},
    {[_this select 0, GVAR(ladder)] call FUNC(confirmTLdeploy)}
] call EFUNC(common,addActionEventHandler)];

_unit setVariable [QGVAR(Cancel), [
    _unit, "zoomtemp",
    {!isNull GVAR(ladder)},
    {[_this select 0, GVAR(ladder)] call FUNC(cancelTLdeploy)}
] call EFUNC(common,addActionEventHandler)];
