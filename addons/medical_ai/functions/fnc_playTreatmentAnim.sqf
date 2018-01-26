/*
 * Author: BaerMitUmlaut
 * Plays the corresponding treatment animation.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Is bandage <BOOL>
 * 2: Is self treatment <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, true, true] call ACE_medical_ai_fnc_playTreatmentAnim
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_unit", "_isBandage", "_isSelfTreatment"];

if (vehicle _unit != _unit) exitWith {};

private _animConfig = if (_isBandage) then {
    configFile >> "ACE_Medical_Actions" >> "Basic" >> "Bandage";
} else {
    configFile >> "ACE_Medical_Actions" >> "Basic" >> "Morphine";
};

private _configProperty = "animationCaller";
if (_isSelfTreatment) then {
    _configProperty = _configProperty + "Self";
};
if (stance _unit == "PRONE") then {
    _configProperty = _configProperty + "Prone";
};

private _anim = getText (_animConfig >> _configProperty);
private _wpn = switch (true) do {
    case ((currentWeapon _unit) == ""): {"non"};
    case ((currentWeapon _unit) == (primaryWeapon _unit)): {"rfl"};
    case ((currentWeapon _unit) == (handgunWeapon _unit)): {"pst"};
    default {"non"};
};
_anim = [_anim, "[wpn]", _wpn] call CBA_fnc_replace;

[_unit, _anim] call EFUNC(common,doAnimation);
