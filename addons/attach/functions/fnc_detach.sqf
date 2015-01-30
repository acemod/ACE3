#include "script_component.hpp"

/*
Author: eRazeri and CAA-Picard

Detach an item from a unit

Arguments:
0: OBJECT - unit doing the attaching (player)
1: OBJECT - vehicle that it will be detached from (player or vehicle)

Return Value:
none
*/

private ["_itemName", "_count", "_attachedItem", "_fnc_detachDelay"];

PARAMS_2(_unit,_attachToVehicle);

_attachedObjectsArray = _attachToVehicle getVariable ["ACE_AttachedObjects", []];
_attachedItemsArray = _attachToVehicle getVariable ["ACE_AttachedItemNames", []];

_attachedObject = objNull;
_attachedIndex = -1;
_itemName = "";

//Find closest attached object
_minDistance = 1000;
_unitPos = getPos _unit;
_unitPos set [2,0];
{
  _objectPos = getPos _x;
  _objectPos set [2, 0];
  if ((_objectPos distance _unitPos) < _minDistance) then {
    _minDistance = (_objectPos distance _unitPos);
    _attachedObject = _x;
    _itemName = _attachedItemsArray select _forEachIndex;
    _attachedIndex = _forEachIndex;
  };
} forEach _attachedObjectsArray;

// Check if unit has an attached item
if ((isNull _attachedObject) || {_itemName == ""}) exitWith {ERROR("Could not find attached object")};

// Add item to inventory
_count = (count items _unit) + (count magazines _unit);
_unit addItem _itemName;
if ((count items _unit) + (count magazines _unit) <= _count) exitWith {
  [localize "STR_ACE_Attach_Inventory_Full"] call EFUNC(common,displayTextStructured);
};

if (_itemName == "B_IR_Grenade" or _itemName == "O_IR_Grenade" or _itemName == "I_IR_Grenade") then {
  // Hack for dealing with X_IR_Grenade effect not dissapearing on deleteVehicle
  detach _attachedObject;
  _attachedObject setPos [getPos _unit select 0, getPos _unit select 1, ((getPos _unit select 2) - 1000)];
  // Delete attached item after 0.5 seconds
  _fnc_detachDelay = {
    deleteVehicle (_this select 0);
  };
  [_fnc_detachDelay, [_attachedObject], 0.5, 0] call EFUNC(common,waitAndExecute);
} else {
  // Delete attached item
  deleteVehicle _attachedObject;
};

// Reset unit variables
_attachedObjectsArray deleteAt _attachedIndex;
_attachedItemsArray deleteAt _attachedIndex;
_attachToVehicle setVariable ["ACE_AttachedObjects", _attachedObjectsArray, true];
_attachToVehicle setVariable ["ACE_AttachedItemNames", _attachedItemsArray, true];

// Display message
switch true do {
  case (_itemName == "ACE_IR_Strobe_Item") : {
    [localize "STR_ACE_Attach_IrStrobe_Detached"] call EFUNC(common,displayTextStructured);
  };
  case (_itemName == "B_IR_Grenade" or _itemName == "O_IR_Grenade" or _itemName == "I_IR_Grenade") : {
    [localize "STR_ACE_Attach_IrGrenade_Detached"] call EFUNC(common,displayTextStructured);
  };
  case (_itemName == "Chemlight_blue" or {_itemName == "Chemlight_green"} or {_itemName == "Chemlight_red"} or {_itemName == "Chemlight_yellow"}) : {
    [localize "STR_ACE_Attach_Chemlight_Detached"] call EFUNC(common,displayTextStructured);
  };
};
