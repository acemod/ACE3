#include "script_component.hpp"

/*
Author: eRazeri and CAA-Picard

Detach an item from a unit

Arguments:
unit

Return Value:
none
*/

private ["_unit", "_itemName", "_count", "_attachedItem"];

_unit = _this select 0;
_itemName = _unit getVariable [QGVAR(ItemName), ""];
_attachedItem = _unit getVariable [QGVAR(Item), objNull];

// Check if unit has an attached item
if (_itemName == "") exitWith {};

// Add item to inventory
_count = (count items _unit) + (count magazines _unit);
_unit addItem _itemName;
if ((count items _unit) + (count magazines _unit) <= _count) exitWith {
  [localize "STR_AGM_Attach_Inventory_Full"] call EFUNC(common,displayTextStructured);
};

if (_itemName == "B_IR_Grenade" or _itemName == "O_IR_Grenade" or _itemName == "I_IR_Grenade") then {
  // Hack for dealing with X_IR_Grenade effect not dissapearing on deleteVehicle
  detach _attachedItem;
  _attachedItem setPos [getPos _unit select 0, getPos _unit select 1, ((getPos _unit select 2) - 1000)];
  // Delete attached item after 0.5 seconds
  [FUNC(detachFix), 0.5, [_attachedItem, (time + 0.5)]] call CBA_fnc_addPerFrameHandler;
} else {
  // Delete attached item
  deleteVehicle _attachedItem;
};

// Reset unit variables
_unit setVariable [QGVAR(ItemName),"", true];
_unit setVariable [QGVAR(Item),nil, true];

// Display message
switch true do {
  case (_itemName == "AGM_IR_Strobe_Item") : {
    [localize "STR_AGM_Attach_IrStrobe_Detached"] call EFUNC(common,displayTextStructured);
  };
  case (_itemName == "B_IR_Grenade" or _itemName == "O_IR_Grenade" or _itemName == "I_IR_Grenade") : {
    [localize "STR_AGM_Attach_IrGrenade_Detached"] call EFUNC(common,displayTextStructured);
  };
  case (_itemName == "Chemlight_blue" or {_itemName == "Chemlight_green"} or {_itemName == "Chemlight_red"} or {_itemName == "Chemlight_yellow"}) : {
    [localize "STR_AGM_Attach_Chemlight_Detached"] call EFUNC(common,displayTextStructured);
  };
  default {
    if (true) exitWith {};
  };
};
