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
 * Public: No
 */
#include "script_component.hpp"

#define GROUP_SWITCH_ID QUOTE(FUNC(loadPerson))

params ["_unit"];

private "_vehicle";
_vehicle = vehicle _unit;

if (_vehicle == _unit) exitWith {false};

if (speed _vehicle > 1 || getPos _vehicle select 2 > 2) exitWith {false};

private "_emptyPos";
_emptyPos = (getPos _vehicle) findEmptyPosition [0, 10, typeof _unit];

if (count _emptyPos == 0) exitWith {false};

if (!isNull _vehicle) then {
    [[_unit], QUOTE(FUNC(unloadPersonLocal)), _unit, false] call FUNC(execRemoteFnc);
};

true
