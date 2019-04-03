#include "script_component.hpp"
/*
 * Author: diwako
 * Code for animationChanged Eventhandler after unit falls unconscious
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Animation <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit,_anim] call ace_medical_engine_fnc_animChangedEH;
 *
 * Public: No
 */

params ["_unit","_anim"];
if !(IS_UNCONSCIOUS(_unit) &&                   // do not run if unit is conscious
    {alive _unit &&                             // do not run if unit is dead
    {isNull objectParent _unit}}) exitWith {};  // do not run if unit in any vehicle

private _unconsciousAnimation = selectRandom (GVAR(animations) getVariable [_anim, [""]]);

if (_unconsciousAnimation isEqualTo "") exitWith {
    // not a valid animation found
    systemChat format ["none valid anim found!!! %1",_anim];
    ERROR("none valid anim found!");
};

// local only as ragdoll is also local only
_unit switchMove _unconsciousAnimation;
