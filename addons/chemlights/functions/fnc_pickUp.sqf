/*
 * Author: voiper
 * Pick up chemlight.
 *
 * Arguments:
 * 1: Player <OBJECT>
 * 2: Chemlight <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _vehicle] call ace_chemlights_fnc_pickUp;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_chemlight"];
private ["_class", "_ammoType"];

_class = typeOf _chemlight;
_ammoType = if (_class isKindOf ["Chemlight_base", configFile >> "CfgAmmo"]) then {
    getText (configFile >> "CfgAmmo" >> _class >> "ACE_Pickup")
} else {
    getText (configFile >> "CfgVehicles" >> _class >> "ACE_Pickup")
};

{
    detach _x;
    deleteVehicle _x;
} forEach (attachedObjects _chemlight);

[_chemlight, objNull] call FUNC(removeIR);
[_unit, _ammoType] call EFUNC(common,addToInventory);