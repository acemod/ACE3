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

#include "script_component.hpp"

#define INDEX_PART 2
#define INDEX_RATIO 3
#define INDEX_BLEEDING 4
#define INDEX_TIME 0 // value equals to 0 if not applied

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

// Check damage or bleeing for Splint
private _damage = _unit getVariable [QGVAR(bodyPartStatus), [0, 0, 0, 0, 0, 0]];
private _tourniquets = _unit getVariable [QGVAR(tourniquets), [0, 0, 0, 0, 0, 0]];
private _openWounds = _unit getVariable [QGVAR(openWounds), []];
private _splint = _unit getVariable [QGVAR(samSplint), [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]];
for "_i" from 0 to 5 do {
    private _hasDamage = (_damage select _i) > 0;
    private _hasTourniquet = (_tourniquets select _part) != 0;
    private _bleedingWound = {((_x select INDEX_PART) isEqualTo _part) && ((_x select INDEX_BLEEDING) * (_x select INDEX_RATIO) > 0)} count _openWounds > 0;

    if ((_hasDamage || (!_hasTourniquet && _bleedingWound)) && ((_splint select _i select INDEX_TIME) > 0)) then {
        [_unit, _i] call FUNC(treatmentSAMSplintDamaged);
    };
};

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
