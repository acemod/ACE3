#include "..\script_component.hpp"
/*
 * Author: commy2
 * Kills a local unit.
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: Reason for death <STRING>
 * 2: Killer <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit", ["_reason", "#setDead"], ["_instigator", objNull]];
TRACE_3("setDead",_unit,_reason,_instigator);


// No heart rate or blood pressure to measure when dead
_unit setVariable [VAR_HEART_RATE, 0, true];
_unit setVariable [VAR_BLOOD_PRESS, [0, 0], true];

// Clear uncon variable just to be safe
_unit setVariable [VAR_UNCON, nil, true];

_unit setVariable [QEGVAR(medical,causeOfDeath), _reason, true];

// Send a local event before death
[QEGVAR(medical,death), [_unit]] call CBA_fnc_localEvent;

// Update the state machine if necessary (forced respawn, scripted death, etc)
private _unitState = [_unit, EGVAR(medical,STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
if (_unitState isNotEqualTo "Dead") then {
    [_unit, EGVAR(medical,STATE_MACHINE), _unitState, "Dead"] call CBA_statemachine_fnc_manualTransition;
};

// (#8803) Reenable damage if disabled to prevent having live units in dead state
// Keep this after death event for compatibility with third party hooks
if !(isDamageAllowed _unit) then {
    WARNING_1("setDead executed on unit with damage blocked - %1",_this);
    _unit allowDamage true;
};

// Kill the unit without changing visual apperance
private _prevDamage = _unit getHitPointDamage "HitHead";

_unit setHitPointDamage ["HitHead", 1, true, _instigator];

_unit setHitPointDamage ["HitHead", _prevDamage];
