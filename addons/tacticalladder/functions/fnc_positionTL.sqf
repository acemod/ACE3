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
[_unit, "forceWalk", "ACE_Ladder", true] call EFUNC(common,statusEffect_set);

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
GVAR(cancelTime) = CBA_missionTime + 1; // Workaround to prevent accidental canceling
GVAR(currentStep) = 3;
GVAR(currentAngle) = 0;

// add mouse buttons and hints
//private _adjustText = format ["%1, +%2", localize LSTRING(Adjust), localize LSTRING(AdjustTilt)]; // Tilting disabled due to sinking, interaction point offset and unsuitable animation
[localize LSTRING(Deploy), localize LSTRING(Drop), /*_adjustText*/ localize LSTRING(Adjust)] call EFUNC(interaction,showMouseHint);

_unit setVariable [QGVAR(Deploy), [
    _unit, "DefaultAction",
    {!isNull GVAR(ladder)},
    {[_this select 0, GVAR(ladder)] call FUNC(confirmTLdeploy)}
] call EFUNC(common,addActionEventHandler)];
