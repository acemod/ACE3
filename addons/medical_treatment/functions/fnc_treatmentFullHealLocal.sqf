/*
 * Author: Glowbal
 * Handles full heal of a patient.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_caller", "_target"];

if (!alive _target) exitWith {};

private _fullHealLocation = EGVAR(medical,fullHealLocation_PAK);
private _partialHeal = _fullHealLocation > 0; // Full heal not everywhere

if (_partialHeal) then {
    private _medFacility = ([_caller] call EFUNC(medical,isInMedicalFacility)) || {[_target] call EFUNC(medical,isInMedicalFacility)};
    private _medVeh = ([_caller] call EFUNC(medical,isInMedicalVehicle)) || {[_target] call EFUNC(medical,isInMedicalVehicle)};
    switch (_fullHealLocation) do {
        case 1: { _partialHeal = !_medFacility; };
        case 2: { _partialHeal = !_medVeh; };
        case 3: { _partialHeal = !_medFacility && {!_medVeh}; };
    };
};

if (_partialHeal) then {
    private _partialHealCounter = _target getVariable [QGVAR(partialHealCounter), 0];
    _partialHealCounter = _partialHealCounter + 1;
    _target setVariable [QGVAR(partialHealCounter), _partialHealCounter, true];
    
    private _effectiveness = (0 max EGVAR(medical,fieldEffectiveness_PAK) min 1) ^ _partialHealCounter;
    private _persistentDamage = 1 - _effectiveness;
    
    {
        _x params ["", "", "", "", "", "", "_damage"];
        _x set [6, _damage min _persistentDamage];
    } forEach _openWounds;
    
    _target setDamage ((damage _target) min _persistentDamage);
} else {
    _target setVariable [QEGVAR(medical,pain), 0, true];
    _target setVariable [QEGVAR(medical,morphine), 0, true];
    _target setVariable [QEGVAR(medical,bloodVolume), DEFAULT_BLOOD_VOLUME, true];

    // tourniquets
    _target setVariable [QEGVAR(medical,tourniquets), [0,0,0,0,0,0], true];

    // wounds and injuries
    _target setVariable [QEGVAR(medical,openWounds), [], true];
    _target setVariable [QEGVAR(medical,bandagedWounds), [], true];

    // vitals
    _target setVariable [QEGVAR(medical,heartRate), 80];
    _target setVariable [QEGVAR(medical,heartRateAdjustments), []];
    _target setVariable [QEGVAR(medical,bloodPressure), [80, 120]];
    _target setVariable [QEGVAR(medical,peripheralResistance), 100];

    // IVs
    _target setVariable [QEGVAR(medical,ivBags), nil, true];

    // damage storage
    _target setVariable [QEGVAR(medical,bodyPartStatus), [0,0,0,0,0,0], true];

    // generic medical admin
    _target setVariable [QEGVAR(medical,addedToUnitLoop), false, true];
    _target setVariable [QEGVAR(medical,inCardiacArrest), false, true];
    _target setVariable [QEGVAR(medical,inReviveState), false, true];
    _target setVariable [QEGVAR(medical,isUnconscious), false, true];
    _target setVariable [QEGVAR(medical,hasLostBlood), 0, true];
    _target setVariable [QEGVAR(medical,isBleeding), false, true];
    _target setVariable [QEGVAR(medical,hasPain), false, true];
    _target setVariable [QEGVAR(medical,painSuppress), 0, true];
    _target setVariable [QGVAR(partialHealCounter), 0, true];
    
    // medication
    private _allUsedMedication = _target getVariable [QEGVAR(medical,allUsedMedication), []];

    {
       _target setVariable [_x select 0, nil];
    } forEach _allUsedMedication;

    // Resetting damage
    _target setDamage 0;
};

[_unit, false] call EFUNC(medical_engine,setLimping);

[QEGVAR(medical,FullHeal), _target] call CBA_fnc_localEvent;

[_target, "activity", ELSTRING(medical,Activity_fullHeal), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", ELSTRING(medical,Activity_fullHeal), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message
