#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Detonates all attached deadman's switched triggered explosives.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_explosives_fnc_onIncapacitated
 *
 * Public: No
 */

// NOTE: Extended_Killed_EventHandlers runs only where _unit is local
params ["_unit"];
TRACE_1("params",_unit);

// Close cellphone if open
if (_unit == ACE_player) then {
    findDisplay 8855 closeDisplay 0;
};

// Exit if no item
if !([_unit, "ACE_DeadManSwitch"] call EFUNC(common,hasItem)) exitWith {};

private _range = getNumber (configFile >> "CfgWeapons" >> "ACE_DeadManSwitch" >> QGVAR(range));
private _deadmanExplosives = [_unit, "DeadManSwitch"] call FUNC(getPlacedExplosives);
TRACE_2("placed",_deadmanExplosives,_range);

{
    [_unit, _range, _x, "ACE_DeadManSwitch"] call FUNC(detonateExplosive);
} forEach _deadmanExplosives;

// Handle deadman connected to explosive in inventory
private _connectedInventoryExplosive = _unit getVariable [QGVAR(deadmanInvExplosive), ""];

if !([_unit, _connectedInventoryExplosive] call EFUNC(common,hasMagazine)) exitWith {};

// Remove 1 ammo and reset variable
[_unit, _connectedInventoryExplosive] call EFUNC(common,adjustMagazineAmmo);
_unit setVariable [QGVAR(deadmanInvExplosive), nil, true];

private _magazineConfig = configFile >> "CfgMagazines" >> _connectedInventoryExplosive;
private _ammo = getText (_magazineConfig >> "ammo");
TRACE_2("deadman inventory",_connectedInventoryExplosive,_ammo);

private _magazineTrigger = _magazineConfig >> "ACE_Triggers" >> "DeadmanSwitch";

if (isText (_magazineTrigger >> "ammo")) then {
    _ammo = getText (_magazineTrigger >> "ammo");
};

private _explosive = _ammo createVehicle [0, 0, 0];
_explosive setPosASL (getPosASL _unit);

// Explode, ignoring range, with a 0.5 second delay
[_unit, -1, [_explosive, 0.5], "ACE_DeadManSwitch"] call FUNC(detonateExplosive);

nil
