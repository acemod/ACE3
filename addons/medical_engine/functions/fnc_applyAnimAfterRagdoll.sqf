#include "script_component.hpp"
/*
 * Author: diwako
 * Apply a fitting unconscious animation to a knocked out unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Animation <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, _anim] call ace_medical_engine_fnc_applyAnimAfterRagdoll;
 *
 * Public: No
 */

params ["_unit", "_anim"];
if !(IS_UNCONSCIOUS(_unit) &&                   // do not run if unit is conscious
    {alive _unit &&                             // do not run if unit is dead
    {isNull objectParent _unit}}) exitWith {};  // do not run if unit in any vehicle

private _unconsciousAnimation = selectRandom (GVAR(animations) getVariable [_anim, [""]]);

if (_unconsciousAnimation isEqualTo "") exitWith {
    // not a valid animation found
    ERROR("No valid animation found!");
};

// local only as ragdoll is also local only
_unit switchMove _unconsciousAnimation;
