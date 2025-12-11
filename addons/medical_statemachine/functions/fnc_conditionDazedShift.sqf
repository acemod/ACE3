#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Condition for switching between "Dazed" and "Unconscious" states (both directions)
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Become Dazed (true: uncon->dazed, false: dazed->uncon) <BOOL>
 *
 * Returns:
 * <BOOL>
 *
 * Example:
 * [player, true] call ace_medical_statemachine_fnc_conditionDazedShift
 *
 * Public: No
 */

params ["_unit", "_becomeDazed"];

if (!(_unit call EFUNC(medical_status,canBecomeDazed))) exitWith { 
    !_becomeDazed
};

if (_unit isNil QEGVAR(medical,lastDazedCheck)) then {
    _unit setVariable [QEGVAR(medical,lastDazedCheck), CBA_missionTime];
};
private _timeCheck = CBA_missionTime - (_unit getVariable QEGVAR(medical,lastDazedCheck));
if (_timeCheck < 10) exitWith { false };
_unit setVariable [QEGVAR(medical,lastDazedCheck), CBA_missionTime];

if (_becomeDazed) then {
    random 1 < EGVAR(medical,dazedChance)
} else {
    random 1 >= EGVAR(medical,dazedChance)
}
