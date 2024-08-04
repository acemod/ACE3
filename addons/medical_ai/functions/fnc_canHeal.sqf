#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Checks if an injured unit can be healed.
 *
 * Arguments:
 * 0: Healer <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [cursorObject, cursorObject] call ace_medical_ai_fnc_canHeal
 *
 * Public: No
 */

if (GVAR(requireItems) == 0) exitWith {
    true // return
};

params ["_healer", "_target"];
(_healer getVariable [QGVAR(currentTreatment), [-1]]) params ["_finishTime", "_treatmentTarget", ["_treatmentEvent", ""], "_treatmentArgs", "_treatmentItem"];

// No healing going on at the moment
if (_treatmentEvent == "") exitWith {true};

// Target still needs healing, but the healer doesn't have the required items
if (_treatmentEvent in ["#none", "#needsIV"]) exitWith {
    _healer setVariable [QGVAR(canHealNextCheck), CBA_missionTime + 30];

    false // return
};

true // return
