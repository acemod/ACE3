/*
 * Author: Glowbal, ViperMaul
 * Unload object from vehicle.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return value:
 * Object unloaded <BOOL>
 *
 * Example:
 * [object, vehicle] call ace_cargo_fnc_unloadItem
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_loaded", "_space", "_itemSize", "_emptyPos", "_validVehiclestate"];

params ["_item", "_vehicle"];

if !([_item, _vehicle] call FUNC(canUnloadItem)) exitWith {
    false
};

_validVehiclestate = true;
_emptyPos = [];
if (_vehicle isKindOf "Ship" ) then {
    if !(speed _vehicle <1 && {(((getPosATL _vehicle) select 2) < 2)}) then {_validVehiclestate = false};
    TRACE_1("SHIP Ground Check", getPosATL _vehicle );
    _emptyPos = ((getPosASL _vehicle) call EFUNC(common,ASLtoPosition) findEmptyPosition [0, 15, typeOf _item]); // TODO: if spot is underwater pick another spot.
} else {
    if (_vehicle isKindOf "Air" ) then {
        if !(speed _vehicle <1 && {isTouchingGround _vehicle})  then {_validVehiclestate = false};
        TRACE_1("Vehicle Ground Check", isTouchingGround _vehicle);
        _emptyPos = (getPosASL _vehicle) call EFUNC(common,ASLtoPosition);
        _emptyPos = [(_emptyPos select 0) + random(5), (_emptyPos select 1) + random(5), _emptyPos select 2 ];
    } else {
        if !(speed _vehicle <1 && {(((getPosATL _vehicle) select 2) < 2)})  then {_validVehiclestate = false};
        TRACE_1("Vehicle Ground Check", isTouchingGround _vehicle);
        _emptyPos = ((getPosASL _vehicle) call EFUNC(common,ASLtoPosition) findEmptyPosition [0, 13, typeOf _item]);
    };
};

TRACE_1("getPosASL Vehicle Check", getPosASL _vehicle);
if (!_validVehiclestate) exitWith {false};

if (count _emptyPos == 0) exitWith {false};  //consider displaying text saying there are no safe places to exit the vehicle

_loaded = _vehicle getVariable [QGVAR(loaded), []];
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
