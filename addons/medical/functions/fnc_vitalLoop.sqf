#include "script_component.hpp"
/*
 * Author: Glowbal, esteldunedain
 * Vital loop for a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Time of last computation <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, 5] call ACE_medical_fnc_vitalLoop
 *
 * Public: No
 */

params ["_unit", "_lastTime"];

// If the unit died the loop is finished
if (!alive _unit) exitWith {};

// If locality changed, broadcast the last medical state and finish the local loop
if (!local _unit) exitWith {
    if (GVAR(level) >= 2) then {
        _unit setVariable [QGVAR(heartRate), _unit getVariable [QGVAR(heartRate), 80], true];
        _unit setVariable [QGVAR(bloodPressure), _unit getVariable [QGVAR(bloodPressure), [80, 120]], true];
    };
    _unit setVariable [QGVAR(bloodVolume), _unit getVariable [QGVAR(bloodVolume), 100], true];
};

// Handle unit vitals
[_unit, CBA_missionTime - _lastTime] call FUNC(handleUnitVitals);

// Play injured sounds
private _pain = _unit getVariable [QGVAR(pain), 0];
if (_pain > (_unit getVariable [QGVAR(painSuppress), 0])) then {
    // This introduces wierd unconscious behaviour for basic medical and possibly also advanced.
    // TODO This is disabled as it's considered non critical code.
    // We will need to decide if we want unconscious triggered on high pain levels or if we can get rid of this entirely.
    /*if (_pain > 0.7 && {random(1) > 0.6}) then {
        [_unit] call FUNC(setUnconscious);
    };*/

    [_unit, _pain] call FUNC(playInjuredSound);
};

// Schedule the loop to be executed again 1 sec later
[DFUNC(vitalLoop), [_unit, CBA_missionTime], 1] call CBA_fnc_waitAndExecute;
