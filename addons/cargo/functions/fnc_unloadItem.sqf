#include "..\script_component.hpp"
/*
 * Author: Glowbal, ViperMaul
 * Unloads an object from a vehicle.
 *
 * Arguments:
 * 0: Item to be unloaded <STRING> or <OBJECT> (default: "")
 * 1: Holder object (vehicle) <OBJECT> (default: objNull)
 * 2: Unloader <OBJECT> (default: objNull)
 * 3: Deploy parameters <ARRAY> (default: [])
 * - 0: Position AGL <ARRAY> (default: [])
 * - 1: Direction <NUMBER> (default: 0)
 *
 * Return Value:
 * Object unloaded <BOOL>
 *
 * Example:
 * ["ACE_Wheel", cursorObject] call ace_cargo_fnc_unloadItem
 *
 * Public: Yes
 */

params [["_item", "", [objNull, ""]], ["_vehicle", objNull, [objNull]], ["_unloader", objNull, [objNull]], ["_deploy", [], [[]]]];
_deploy params [["_emptyPosAGL", [], [[]], 3], ["_direction", 0, [0]]];

TRACE_4("params",_item,_vehicle,_unloader,_deploy);

// Get config sensitive case name
if (_item isEqualType "") then {
    _item = _item call EFUNC(common,getConfigName);
};

// Check if item is actually part of cargo
private _loaded = _vehicle getVariable [QGVAR(loaded), []];

if !(_item in _loaded) exitWith {
    ERROR_3("Tried to unload item [%1] not in vehicle[%2] cargo[%3]",_item,_vehicle,_loaded);

    false // return
};

// Check if item can be unloaded
private _itemSize = _item call FUNC(getSizeItem);

if (_itemSize < 0) exitWith {
    false // return
};

private _deployed = _deploy isNotEqualTo [];

if (!_deployed) then {
    // This covers testing vehicle stability and finding a safe position
    for "_i" from 1 to 3 do {
        _emptyPosAGL = [_vehicle, _item, _unloader] call EFUNC(common,findUnloadPosition);

        if (_emptyPosAGL isNotEqualTo []) exitWith {};
    };

    TRACE_1("findUnloadPosition",_emptyPosAGL);
};

if (_emptyPosAGL isEqualTo []) exitWith {
    // Display text saying there are no safe places to exit the vehicle
    if (!isNull _unloader && {_unloader == ACE_player}) then {
        [ELSTRING(common,NoRoomToUnload)] call EFUNC(common,displayTextStructured);
    };

    false // return
};

private _object = [_item, _vehicle, _emptyPosAGL, _deployed, _direction] call FUNC(unload);

// Dragging integration
if (!_deployed) then {
    [_unloader, _object] call FUNC(unloadCarryItem);
};

// Invoke listenable event
["ace_cargoUnloaded", [_object, _vehicle, "unload"]] call CBA_fnc_globalEvent;

true // return
