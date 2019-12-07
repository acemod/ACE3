#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles the unconscious state
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_handleStateCardiacArrest
 *
 * Public: No
 */

params ["_unit"];

// If the unit died the loop is finished
if (!alive _unit) exitWith {};
if (!local _unit) exitWith {};

[_unit] call EFUNC(medical_vitals,handleUnitVitals);

private _timeDiff = CBA_missionTime - (_unit getVariable [QGVAR(cardiacArrestTimeLastUpdate), 0]);
if (_timeDiff >= 1) then {
    _timeDiff = _timeDiff min 10;
    _unit setVariable [QGVAR(cardiacArrestTimeLastUpdate), CBA_missionTime];
    private _recieveingCPR = alive (_unit getVariable [QEGVAR(medical,CPR_provider), objNull]);
    private _timeLeft = _unit getVariable [QGVAR(cardiacArrestTimeLeft), -1];
    TRACE_3("cardiac arrest life tick",_unit,_recieveingCPR,_timeDiff);
    if (_recieveingCPR) then { _timeDiff = _timeDiff * 0.5; }; // if being cpr'ed, then time decrease is reduced
    _timeLeft = _timeLeft - _timeDiff; // negative values are fine
    _unit setVariable [QGVAR(cardiacArrestTimeLeft), _timeLeft];
};

