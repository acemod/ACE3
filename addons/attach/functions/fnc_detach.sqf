#include "..\script_component.hpp"
/*
 * Author: eRazeri and esteldunedain
 * Detach an item from a unit
 *
 * Arguments:
 * 0: vehicle that it will be detached from (player or vehicle) <OBJECT>
 * 1: unit doing the detaching (player) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [car, bob] call ace_attach_fnc_detach
 *
 * Public: No
 */

params ["_attachToVehicle","_unit"];
TRACE_2("params",_attachToVehicle,_unit);

private _attachedList = _attachToVehicle getVariable [QGVAR(attached), []];

private _attachedObject = objNull;
private _attachedIndex = -1;
private _itemName = "";

//Find closest attached object
private _minDistance = 1000;

{
    _x params ["_xObject", "_xItemName"];

    if (((getPos _unit) distance2d (getPos _xObject)) < _minDistance) then {
        _minDistance = ((getPos _unit) distance2d (getPos _xObject));
        _attachedObject = _xObject;
        _itemName = _xItemName;
        _attachedIndex = _forEachIndex;
    };
} forEach _attachedList;

// Check if unit has an attached item
if (isNull _attachedObject || {_itemName == ""}) exitWith {ERROR("Could not find attached object")};

// Check if item is a chemlight
private _isChemlight = _attachedObject isKindOf "Chemlight_base";

// Exit if can't add the item
if (!([_unit, _itemName] call CBA_fnc_canAddItem) && {!_isChemlight}) exitWith {
    [LELSTRING(common,Inventory_Full)] call EFUNC(common,displayTextStructured);
};

[QGVAR(detaching), [_attachedObject, _itemName, false]] call CBA_fnc_localEvent;

// Add item to inventory (unless it's a chemlight)
if (!_isChemlight) then {
    _unit addItem _itemName;
};

if (toLowerANSI _itemName in ["b_ir_grenade", "o_ir_grenade", "i_ir_grenade"]) then {
    // Hack for dealing with X_IR_Grenade effect not dissapearing on deleteVehicle
    detach _attachedObject;
    _attachedObject setPos ((getPos _unit) vectorAdd [0, 0, -1000]);
    // Delete attached item after 0.5 seconds
    [{deleteVehicle (_this select 0)}, [_attachedObject], 2] call CBA_fnc_waitAndExecute;
} else {
    //handle any objects that may be attached to the object
    {
        detach _x;
        deleteVehicle _x;
    } forEach (attachedObjects _attachedObject);

    // Delete attached item
    detach _attachedObject;
    deleteVehicle _attachedObject;
};

// Reset unit variables
_attachedList deleteAt _attachedIndex;
_attachToVehicle setVariable [QGVAR(attached), _attachedList, true];

// Display message
private _itemDisplayName = getText (configFile >> "CfgWeapons" >> _itemName >> "displayName");
if (_itemDisplayName == "") then {
    _itemDisplayName = getText (configFile >> "CfgMagazines" >> _itemName >> "displayName");
};

[format [localize LSTRING(Item_Detached), _itemDisplayName], 2] call EFUNC(common,displayTextStructured);
