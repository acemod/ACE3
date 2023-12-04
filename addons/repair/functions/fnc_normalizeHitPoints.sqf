#include "..\script_component.hpp"
/*
 * Author: commy2
 * Used to normalize dependant hitpoints. May overwrite some global variables that are named like hitpoints or "Total" though...
 *
 * Arguments:
 * 0: Local Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call ace_repair_fnc_normalizeHitPoints
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_2("params",_vehicle, typeOf _vehicle);

// Can't execute all commands if the vehicle isn't local, exit if that's so
if !(local _vehicle) exitWith {ERROR_1("Vehicle Not Local %1", _vehicle);};

([_vehicle] call FUNC(getSelectionsToIgnore)) params ["", "_dependsIndexMap"];

// apply normalized damage to all depends hitpoints
{
    private _damage = _vehicle getHitIndex _y;
    TRACE_2("setting depends hitpoint",_x,_damage);
    _vehicle setHitIndex [_x, _damage];
} forEach _dependsIndexMap;
