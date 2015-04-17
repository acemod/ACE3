/*
 * Author: esteldunedain
 * Modify the visuals of a medical action point.
 * On Basic medical: modify the icon color based on damage on that body part.
 *
 * Arguments:
 * 0: The Patient Unit <OBJECT>
 * 1: The Diagnosing Unit <OBJECT>
 * 2: Selection Number <NUMBER>
 * 3: The action to modify <OBJECT>
 *
 * ReturnValue:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"

// Quit for the advanced medical system
if (GVAR(level) >= 2) exitWith {};

EXPLODE_4_PVT(_this,_target,_player,_selectionN,_actionData);

private ["_pointDamage"];
_pointDamage = _target getHitPointDamage (["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"] select _selectionN);

if (_pointDamage >= 0.8) exitWith {
    _actionData set [2, QUOTE(PATHTOF(UI\icons\medical_crossRed.paa))];
};
if (_pointDamage > 0) exitWith {
    _actionData set [2, QUOTE(PATHTOF(UI\icons\medical_crossYellow.paa))];
};
