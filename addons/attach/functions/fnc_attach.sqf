#include "script_component.hpp"

/*
Author: eRazeri and CAA-Picard

Attach an item to the unit

Arguments:
0: unit
1: Item name

Return Value:
none
*/

private ["_unit", "_itemName", "_attachedItem"];

_unit = _this select 0;
_itemName = _this select 1;

// Check if unit has an attached item
if (_unit getVariable [QGVAR(ItemName), ""] != "") exitWith {};

// Check if the unit still has the item
if !((_itemName in items _unit) or (_itemName in magazines _unit)) exitWith {};

// Attach item
switch true do {
  case (_itemName == "AGM_IR_Strobe_Item") : {
    _attachedItem = "AGM_IR_Strobe_Effect" createVehicle [0,0,0];
    _attachedItem attachTo [_unit,[0,-0.11,0.16],"pilot"];//makes it attach to the head a bit better, shoulder is not good for visibility - eRazeri
    [localize "STR_AGM_Attach_IrStrobe_Attached"] call EFUNC(core,displayTextStructured);
  };
  case (_itemName == "B_IR_Grenade") : {
    _attachedItem = "B_IRStrobe" createVehicle [0,0,0];
    _attachedItem attachTo [_unit,[-0.05,0,0.12],"rightshoulder"];
    [localize "STR_AGM_Attach_IrGrenade_Attached"] call EFUNC(core,displayTextStructured);
  };
  case (_itemName == "O_IR_Grenade") : {
    _attachedItem = "O_IRStrobe" createVehicle [0,0,0];
    _attachedItem attachTo [_unit,[-0.05,0,0.12],"rightshoulder"];
    [localize "STR_AGM_Attach_IrGrenade_Attached"] call EFUNC(core,displayTextStructured);
  };
  case (_itemName == "I_IR_Grenade") : {
    _attachedItem = "I_IRStrobe" createVehicle [0,0,0];
    _attachedItem attachTo [_unit,[-0.05,0,0.12],"rightshoulder"];
    [localize "STR_AGM_Attach_IrGrenade_Attached"] call EFUNC(core,displayTextStructured);
  };
  case (_itemName == "Chemlight_blue" or {_itemName == "Chemlight_green"} or {_itemName == "Chemlight_red"} or {_itemName == "Chemlight_yellow"}) : {
    _attachedItem = _itemName createVehicle [0,0,0];
    _attachedItem attachTo [_unit,[-0.05,0,0.12],"rightshoulder"];
    [localize "STR_AGM_Attach_Chemlight_Attached"] call EFUNC(core,displayTextStructured);;
  };
  default {
    if (true) exitWith {};
  };
};

// Remove item
_unit removeItem _itemName;
_unit setVariable [QGVAR(ItemName), _itemName, true];
_unit setVariable [QGVAR(Item), _attachedItem, true];
