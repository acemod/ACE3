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

params ["_unit"];
TRACE_1("unloadPerson",_unit);

private _vehicle = vehicle _unit;

if (isNull _vehicle) exitWith {false};
if (_vehicle == _unit) exitWith {false};

if (speed _vehicle > 1 || {((getPos _vehicle) select 2) > 2}) exitWith {false};

["ace_unloadPersonEvent", [_unit, _vehicle], [_unit]] call CBA_fnc_targetEvent;

true
