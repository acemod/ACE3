#include "..\script_component.hpp"
/*
 * Author: Glowbal, ViperMaul
 * Unloads an object from a vehicle.
 *
 * Arguments:
 * 0: Item to be unloaded <STRING or OBJECT> (default: "")
 * 1: Holder object (vehicle) <OBJECT> (default: objNull)
 * 2: Unloader <OBJECT> (default: objNull)
 * 3: Deploy parameters <ARRAY> (default: [])
 * - 0: Position AGL <ARRAY>
 * - 1: Direction <NUMBER>
 * 4: Unload only if stable <BOOL> (default: true) (Applies only if argument 3 is [])
 *
 * Return Value:
 * Object unloaded <BOOL>
 *
 * Example:
 * ["ACE_Wheel", cursorObject] call ace_cargo_fnc_unloadItem
 *
 * Public: Yes
 */

params [
    ["_item", "", [objNull, ""]],
    ["_vehicle", objNull, [objNull]],
    ["_unloader", objNull, [objNull]],
    ["_deploy", []],
    ["_checkVehicleIsStable", true, [true]]
];
_deploy params ["_emptyPosAGL", "_direction"];

TRACE_5("params",_item,_vehicle,_unloader,_deploy,_checkVehicleIsStable);

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
        _emptyPosAGL = [_vehicle, _item, _unloader, nil, _checkVehicleIsStable] call EFUNC(common,findUnloadPosition);

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

// Unload item from cargo
_loaded deleteAt (_loaded find _item);
_vehicle setVariable [QGVAR(loaded), _loaded, true];

// Update cargo space remaining
private _cargoSpace = _vehicle call FUNC(getCargoSpaceLeft);
_vehicle setVariable [QGVAR(space), _cargoSpace + _itemSize, true];

private _object = _item;

if (_object isEqualType objNull) then {
    detach _object;

    // If player unloads via deployment, set direction first, then unload
    if (_deployed) then {
        [QGVAR(setDirAndUnload), [_object, _emptyPosAGL, _direction], _object] call CBA_fnc_targetEvent;
    } else {
        [QGVAR(serverUnload), [_object, _emptyPosAGL]] call CBA_fnc_serverEvent;
    };

    if (["ace_zeus"] call EFUNC(common,isModLoaded)) then {
        // Get which curators had this object as editable
        private _objectCurators = _object getVariable [QGVAR(objectCurators), []];

        if (_objectCurators isEqualTo []) exitWith {};

        [QEGVAR(zeus,addObjects), [[_object], _objectCurators]] call CBA_fnc_serverEvent;
    };

    // Reenable UAV crew
    private _UAVCrew = _object getVariable [QGVAR(isUAV), []];

    if (_UAVCrew isNotEqualTo []) then {
        // Reenable AI
        {
            [_x, false] call EFUNC(common,disableAiUAV);
        } forEach _UAVCrew;

        _object setVariable [QGVAR(isUAV), nil, true];
    };
} else {
    _object = createVehicle [_item, _emptyPosAGL, [], 0, "NONE"];

    // If player unloads via deployment, set direction. Must happen before setPosASL command according to wiki
    if (_deployed) then {
        _object setDir _direction;
    };

    _object setPosASL (AGLToASL _emptyPosAGL);

    [QEGVAR(common,fixCollision), _object] call CBA_fnc_localEvent;
    [QEGVAR(common,fixPosition), _object] call CBA_fnc_localEvent;
};

// Dragging integration
if (!_deployed) then {
    [_unloader, _object] call FUNC(unloadCarryItem);
};

// Invoke listenable event
["ace_cargoUnloaded", [_object, _vehicle, "unload"]] call CBA_fnc_globalEvent;

true // return
