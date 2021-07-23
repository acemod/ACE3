#include "script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2
 * Initializes unit variables.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Is Respawned <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, false] call ace_medical_status_fnc_initUnit
 *
 * Public: No
 */

params ["_unit", ["_isRespawn", true]];
TRACE_2("initUnit",_unit,_isRespawn);

if (!_isRespawn) then { // Always add respawn EH (same as CBA's onRespawn=1)
    _unit addEventHandler ["Respawn", {[(_this select 0), true] call FUNC(initUnit)}];
};

if (!local _unit) exitWith {};

if (damage _unit > 0) then {
    _unit setDamage 0;
};

if (_isRespawn) then {
    TRACE_1("reseting all vars on respawn",_isRespawn); // note: state is handled by ace_medical_statemachine_fnc_resetStateDefault

    // - Blood and heart ----------------------------------------------------------
    _unit setVariable [VAR_BLOOD_VOL, DEFAULT_BLOOD_VOLUME, true];
    _unit setVariable [VAR_HEART_RATE, DEFAULT_HEART_RATE, true];
    _unit setVariable [VAR_BLOOD_PRESS, [80, 120], true];
    _unit setVariable [VAR_PERIPH_RES, DEFAULT_PERIPH_RES, true];
    _unit setVariable [VAR_CRDC_ARRST, false, true];
    _unit setVariable [VAR_HEMORRHAGE, 0, true];

    // - Pain ---------------------------------------------------------------------
    _unit setVariable [VAR_PAIN, 0, true];
    _unit setVariable [VAR_IN_PAIN, false, true];
    _unit setVariable [VAR_PAIN_SUPP, 0, true];

    // - Wounds -------------------------------------------------------------------
    _unit setVariable [VAR_OPEN_WOUNDS, [], true];
    _unit setVariable [VAR_BANDAGED_WOUNDS, [], true];
    _unit setVariable [VAR_STITCHED_WOUNDS, [], true];
    _unit setVariable [QEGVAR(medical,isLimping), false, true];
    _unit setVariable [VAR_FRACTURES, DEFAULT_FRACTURE_VALUES, true];

    // - Misc ---------------------------------------------------------------------
    _unit setVariable [VAR_UNCON, false, true];

    // - Treatments ---------------------------------------------------------------
    _unit setVariable [VAR_TOURNIQUET, DEFAULT_TOURNIQUET_VALUES, true];
    _unit setVariable [QEGVAR(medical,occludedMedications), nil, true]; // Delayed Medications (from tourniquets)
    _unit setVariable [QEGVAR(medical,ivBags), nil, true];

    // Update wound bleeding
    [_unit] call EFUNC(medical_status,updateWoundBloodLoss);

    // Triage card and logs
    _unit setVariable [QEGVAR(medical,triageLevel), 0, true];
    _unit setVariable [QEGVAR(medical,triageCard), [], true];

    // Damage storage
    _unit setVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0], true];

    // Medication
    _unit setVariable [VAR_MEDICATIONS, [], true];

    // Unconscious spontanious wake up chance
    _unit setVariable [QEGVAR(medical,lastWakeUpCheck), nil];
};

[{
    params ["_unit"];
    TRACE_3("Unit Init",_unit,local _unit,typeOf _unit);

    _unit setVariable [QEGVAR(medical,initialized), true, true];
    [QGVAR(initialized), [_unit]] call CBA_fnc_localEvent;
}, [_unit], 0.5] call CBA_fnc_waitAndExecute;
