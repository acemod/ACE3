#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Equips synched helicopters with a FRIES.
 *
 * Arguments:
 * 0: Module <LOGIC>
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
    false
} count _synchedUnits;
