/*
 * Author: Ruthberg
 * Handle incapacitation due to wounds
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * nothing
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _bodyDamage = 0;

{
    _x params ["", "", "_bodyPart", "", "", "", "_damage"];
    if (_bodyPart < 2 && {_damage > PENETRATION_THRESHOLD}) then {
        _bodyDamage = _bodyDamage + _damage;
    };
} forEach (_unit getVariable [QGVAR(openWounds), []]);

// todo: use an ace setting for the incapacitation threshold
private _incapacitationThreshold = 3 * PENETRATION_THRESHOLD;
if (_bodyDamage > _incapacitationThreshold) then {
    [QGVAR(CriticalInjury), _unit] call CBA_fnc_localEvent;
};
