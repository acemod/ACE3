#include "script_component.hpp"
/*
 * Author: Glowbal
 * Unload a person from a vehicle
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Returns true if succesfully unloaded person <BOOL>
 *
 * Example:
 * [hurtGuy] call ace_common_fnc_unloadPerson
 *
 * Public: No
 */

#define GROUP_SWITCH_ID QFUNC(loadPerson)

params ["_unit"];

private _vehicle = vehicle _unit;

if (_vehicle == _unit) exitWith {false};

if (speed _vehicle > 1 || {((getPos _vehicle) select 2) > 2}) exitWith {false};

if (!isNull _vehicle) then {
    ["ace_unloadPersonEvent", [_unit, _vehicle], [_unit]] call CBA_fnc_targetEvent;
};

true
