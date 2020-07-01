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

// Apply the animation only locally on the machine and do not broadcast it to others
// Reason is the nature of setUnconscious' end of ragdoll animation is not synced on all machines either
// Not synced animations are preferred over units snapping from one to another animation
_unit switchMove _unconsciousAnimation;
