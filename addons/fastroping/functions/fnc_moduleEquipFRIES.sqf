#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Equips synched helicopters with a FRIES.
 *
 * Arguments:
 * 0: Module logic <OBJECT>
 * 1: Units <ARRAY> (unused)
 * 2: Activated <BOOL> (unused)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_module] call ace_fastroping_fnc_moduleEquipFRIES
 *
 * Public: No
 */
params ["_module"];

private _synchedUnits = synchronizedObjects _module;
{
    if (_x isKindOf "CAManBase") then {
        _x = vehicle _x;
    };
    [_x] call FUNC(equipFRIES);
} forEach _synchedUnits;
