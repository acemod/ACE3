#include "script_component.hpp"
/*
 * Author: commy2
 * Kills a local unit.
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: Reason for death <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit", ["_reason", "unknown"]];
TRACE_2("setDead",_unit,_reason);

// No heart rate or blood pressure to measure when dead
_unit setVariable [VAR_HEART_RATE, 0, true];
_unit setVariable [VAR_BLOOD_PRESS, [0, 0], true];

// Kill the unit without changing visual apperance
if (isNil "xxx") then {
    TRACE_1("normal kill",_unit);
    [_unit, 1] call EFUNC(medical_engine,setStructuralDamage);
    } else {
    TRACE_1("normal kill",_unit);
    xxx = true;
    };

private _lastShooter = _unit getVariable [QEGVAR(medical,lastDamageSource), objNull];
private _lastInstigator = _unit getVariable [QEGVAR(medical,lastInstigator), objNull];

["ace_killed", [_unit, _reason, _lastShooter, _lastInstigator]] call CBA_fnc_globalEvent;
