/*
 * Author: Ir0n1E
 * switches gunbag full/empty for mass calculation
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * backpack <OBJECT>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

private ["_altgunbag", "_items", "_gunbag"];

_gunbag = backpackContainer _unit;
_items = backpackItems _unit;

_altgunbag = getText (configFile >> "CfgVehicles" >> typeof _gunbag >> QGVAR(gunbagswitch));

removeBackpack _unit;
_unit addBackpack _altgunbag;

{
  _unit addItemToBackpack _x;
} forEach _items;

if ([QUOTE(ACE_Backpacks)] call EFUNC(common,isModLoaded)) then {
  [_unit, backpackContainer _unit] call EFUNC(backpacks,backpackOpened);
};

(backpackContainer _unit)
