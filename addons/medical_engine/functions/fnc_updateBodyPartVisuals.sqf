#include "script_component.hpp"
/*
 * Author: commy2
 * Damages a body part of a local unit. Does not kill the unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Update Head <BOOLEAN>
 * 2: Update Body <BOOLEAN>
 * 3: Update Arms <BOOLEAN>
 * 4: Update Legs <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true, true, true, true] call ace_medical_engine_fnc_updateBodyPartVisuals
 *
 * Public: No
 */

params ["_unit", "_updateHead", "_updateBody", "_updateArms", "_updateLegs"];
TRACE_5("updateBodyPartVisuals",_unit,_updateHead,_updateBody,_updateArms,_updateLegs);

private _bodyPartDamage = _unit getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];

if (_updateHead) then {
    [_unit, "head", (_bodyPartDamage select 0) > VISUAL_BODY_DAMAGE_THRESHOLD] call FUNC(damageBodyPart);
};
if (_updateBody) then {
    [_unit, "body", (_bodyPartDamage select 1) > VISUAL_BODY_DAMAGE_THRESHOLD] call FUNC(damageBodyPart);
};
if (_updateArms) then {
    [_unit, "arms", ((_bodyPartDamage select 2) max (_bodyPartDamage select 3)) > VISUAL_BODY_DAMAGE_THRESHOLD] call FUNC(damageBodyPart);
};
if (_updateLegs) then {
    [_unit, "legs", ((_bodyPartDamage select 4) max (_bodyPartDamage select 5)) > VISUAL_BODY_DAMAGE_THRESHOLD] call FUNC(damageBodyPart);
};
