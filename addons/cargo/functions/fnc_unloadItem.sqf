/*
 * Author: Glowbal, ViperMaul
 * Unload object from vehicle.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Unloader (player) <OBJECT><OPTIONAL>
 *
 * Return value:
 * Object unloaded <BOOL>
 *
 * Example:
 * [object, vehicle] call ace_cargo_fnc_unloadItem
 *
 * Public: No
 */
  #define DEBUG_MODE_FULL
#include "script_component.hpp"

private ["_loaded", "_space", "_itemSize", "_emptyPos", "_validVehiclestate"];

params ["_item", "_vehicle", ["_unloader", objNull]];
TRACE_3("params",_item,_vehicle,_unloader);

//This covers testing vehicle stability and finding a safe position
_emptyPos = [_vehicle, (typeOf _item), _unloader] call EFUNC(common,findUnloadPosition);
TRACE_1("findUnloadPosition",_emptyPos);

if (count _emptyPos != 3) exitWith {
    ACE_LOGWARNING_4("Could not find unload pos %1-ASL: %2 isTouchingGround: %3 Speed: %4",_vehicle, getPosASL _vehicle, isTouchingGround _vehicle, speed _vehicle);
    if ((!isNull _unloader) && {[_unloader] call EFUNC(common,isPlayer)}) then {
        //display text saying there are no safe places to exit the vehicle
        ["displayTextStructured", [_unloader], [localize ELSTRING(common,NoRoomToUnload)]] call EFUNC(common,targetEvent);
    };
    false
};

_loaded = _vehicle getVariable [QGVAR(loaded), []];
if !(_item in _loaded) exitWith {
    ACE_LOGERROR_2("Tried to unload item not in cargo array %1 - %2", _item, _vehicle);
    false
};
_loaded = _loaded - [_item];
_vehicle setVariable [QGVAR(loaded), _loaded, true];

_space = [_vehicle] call FUNC(getCargoSpaceLeft);
_itemSize = [_item] call FUNC(getSizeItem);
_vehicle setVariable [QGVAR(space), (_space + _itemSize), true];

detach _item;
_item setPosASL (_emptyPos call EFUNC(common,PositiontoASL));
["hideObjectGlobal", [_item, false]] call EFUNC(common,serverEvent);

// show hint
private ["_itemName", "_vehicleName"];

_itemName = getText (configFile >> "CfgVehicles" >> typeOf _item >> "displayName");
_vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

["displayTextStructured", [[localize LSTRING(UnloadedItem), _itemName, _vehicleName], 3.0]] call EFUNC(common,localEvent);

// TOOO maybe drag/carry the unloaded item?

// Invoke listenable event
["cargoUnloaded", [_item, _vehicle]] call EFUNC(common,globalEvent);

true
