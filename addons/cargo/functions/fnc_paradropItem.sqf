/*
 * Author: marc_book, commy2, CAA-Picard
 * Unload and paradrop object from plane or helicopter.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * Object unloaded <BOOL>
 *
 * Example:
 * [object, vehicle] call ace_cargo_fnc_paradropItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_item", "_vehicle"];
TRACE_2("params",_item,_vehicle);

private _loaded = _vehicle getVariable [QGVAR(loaded), []];

if !(_item in _loaded) exitWith {false};

// unload item from cargo
_loaded deleteAt (_loaded find _item);
_vehicle setVariable [QGVAR(loaded), _loaded, true];

private _cargoSpace = [_vehicle] call FUNC(getCargoSpaceLeft);
private _itemSize = [_item] call FUNC(getSizeItem);
_vehicle setVariable [QGVAR(space), (_cargoSpace + _itemSize), true];

(boundingBoxReal _vehicle) params ["_bb1", "_bb2"];
private _distBehind = ((_bb1 select 1) min (_bb2 select 1)) - 4; // 4 meters behind max bounding box
TRACE_1("",_distBehind);
private _posBehindVehicleAGL = _vehicle modelToWorld [0, _distBehind, -2];


private _itemObject = if (_item isEqualType objNull) then {
    detach _item;
    // hideObjectGlobal must be executed before setPos to ensure light objects are rendered correctly
    // do both on server to ensure they are executed in the correct order
    [QGVAR(serverUnload), [_item, _posBehindVehicleAGL]] call CBA_fnc_serverEvent;
    _item
} else {
    private _newItem = createVehicle [_item, _posBehindVehicleAGL, [], 0, "NONE"];
    _newItem setPosASL (AGLtoASL _posBehindVehicleAGL);
    _newItem
};

_itemObject setVelocity ((velocity _vehicle) vectorAdd ((vectorNormalized (vectorDir _vehicle)) vectorMultiply -5));

// open parachute and ir light effect
[{
    params ["_item"];

    if (isNull _item || {getPos _item select 2 < 1}) exitWith {};

    private _parachute = createVehicle ["B_Parachute_02_F", [0,0,0], [], 0, "CAN_COLLIDE"];

    // cannot use setPos on parachutes without them closing down
    _parachute attachTo [_item, [0,0,0]];
    detach _parachute;

    private _velocity = velocity _item;

    _item attachTo [_parachute, [0,0,1]];
    _parachute setVelocity _velocity;

    private _light = "Chemlight_yellow" createVehicle [0,0,0];
    _light attachTo [_item, [0,0,0]];

}, [_itemObject], 0.7] call CBA_fnc_waitAndExecute;

// smoke effect when crate landed
[{
    (_this select 0) params ["_item"];

    if (isNull _item) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    if (getPos _item select 2 < 1) then {
        private _smoke = "SmokeshellYellow" createVehicle [0,0,0];
        _smoke attachTo [_item, [0,0,0]];

        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

}, 1, [_itemObject]] call CBA_fnc_addPerFrameHandler;

[
    [
        LSTRING(UnloadedItem),
        getText (configFile >> "CfgVehicles" >> typeOf _itemObject >> "displayName"),
        getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName")
    ],
    3
] call EFUNC(common,displayTextStructured);

// Invoke listenable event
["ace_cargoUnloaded", [_item, _vehicle, "paradrop"]] call CBA_fnc_globalEvent;

true
