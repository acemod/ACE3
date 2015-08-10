/*
 * Author: eRazeri and esteldunedain
 * Detach an item from a unit
 *
 * Arguments:
 * 0: vehicle that it will be detached from (player or vehicle) <OBJECT>
 * 1: unit doing the detaching (player) <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [car, bob] call ace_attach_fnc_detach
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_attachedObjects", "_attachedItems", "_itemDisplayName",
    "_attachedObject", "_attachedIndex", "_itemName", "_minDistance",
    "_unitPos", "_objectPos"
];
params ["_attachToVehicle","_unit"],
TRACE_2("params",_attachToVehicle,_unit);

_attachedObjects = _attachToVehicle getVariable [QGVAR(Objects), []];
_attachedItems = _attachToVehicle getVariable [QGVAR(ItemNames), []];

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
    if (_objectPos distance _unitPos < _minDistance) then {
        _minDistance = _objectPos distance _unitPos;
        _attachedObject = _x;
        _itemName = _attachedItems select _forEachIndex;
        _attachedIndex = _forEachIndex;
    };
} forEach _attachedObjects;

// Check if unit has an attached item
if (isNull _attachedObject || {_itemName == ""}) exitWith {ERROR("Could not find attached object")};

// Exit if can't add the item
if !(_unit canAdd _itemName) exitWith {
    [localize LSTRING(Inventory_Full)] call EFUNC(common,displayTextStructured);
};

// Add item to inventory
_unit addItem _itemName;

if (toLower _itemName in ["b_ir_grenade", "o_ir_grenade", "i_ir_grenade"]) then {
    // Hack for dealing with X_IR_Grenade effect not dissapearing on deleteVehicle
    detach _attachedObject;
    _attachedObject setPos ((getPos _unit) vectorAdd [0, 0, -1000]);
    // Delete attached item after 0.5 seconds
    [{deleteVehicle (_this select 0)}, [_attachedObject], 2] call EFUNC(common,waitAndExecute);
} else {
    // Delete attached item
    deleteVehicle _attachedObject;
};

// Reset unit variables
_attachedObjects deleteAt _attachedIndex;
_attachedItems deleteAt _attachedIndex;
_attachToVehicle setVariable [QGVAR(Objects), _attachedObjects, true];
_attachToVehicle setVariable [QGVAR(ItemNames), _attachedItems, true];

// Display message
_itemDisplayName = getText (configFile >> "CfgWeapons" >> _itemName >> "displayName");
if (_itemDisplayName == "") then {
    _itemDisplayName = getText (configFile >> "CfgMagazines" >> _itemName >> "displayName");
};

[format [localize LSTRING(Item_Detached), _itemDisplayName]] call EFUNC(common,displayTextStructured);
