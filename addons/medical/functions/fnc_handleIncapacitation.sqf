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

private _headDamage = 0;
private _bodyDamage = 0;

{
    _x params ["", "", "_bodyPart", "", "", "", "_damage"];
    switch (_bodyPart) do {
        case 0: {
            _headDamage = _headDamage + _damage;
        };
        case 1: {
            if (_damage > PENETRATION_THRESHOLD) then {
                _bodyDamage = _bodyDamage + _damage;
            };
        };
    };
} forEach (_unit getVariable [QGVAR(openWounds), []]);

// todo: use an ace settings for the thresholds
if (_headDamage > 0.50) then {
    [QGVAR(CriticalInjury), _unit] call CBA_fnc_localEvent;
};
if (_bodyDamage > 1.05) then {
    [QGVAR(CriticalInjury), _unit] call CBA_fnc_localEvent;
};
