#include "..\script_component.hpp"
/*
 * Author: marc_book, commy2, CAA-Picard
 * Unloads and paradrops an object from a plane or helicopter.
 *
 * Arguments:
 * 0: Item <STRING> or <OBJECT>
 * 1: Holder object (vehicle) <OBJECT>
 * 2: Show Hint <BOOL> (default: true)
 *
 * Return Value:
 * Object unloaded <BOOL>
 *
 * Example:
 * ["ACE_Wheel", vehicle player] call ace_cargo_fnc_paradropItem
 *
 * Public: No
 */

params ["_item", "_vehicle", ["_showHint", true]];
TRACE_2("params",_item,_vehicle);

// Get config sensitive case name
if (_item isEqualType "") then {
    _item = _item call EFUNC(common,getConfigName);
};

// Check if item is actually part of cargo
private _loaded = _vehicle getVariable [QGVAR(loaded), []];

if !(_item in _loaded) exitWith {
    false // return
};

// Check if item can be unloaded
private _itemSize = _item call FUNC(getSizeItem);

if (_itemSize < 0) exitWith {
    false // return
};

// Unload item from cargo
_loaded deleteAt (_loaded find _item);
_vehicle setVariable [QGVAR(loaded), _loaded, true];

// Update cargo space remaining
private _cargoSpace = _vehicle call FUNC(getCargoSpaceLeft);
_vehicle setVariable [QGVAR(space), _cargoSpace + _itemSize, true];

(boundingBoxReal _vehicle) params ["_bb1", "_bb2"];
private _distBehind = ((_bb1 select 1) min (_bb2 select 1)) - 4; // 4 meters behind max bounding box
private _posBehindVehicleAGL = _vehicle modelToWorld [0, _distBehind, -2];

TRACE_1("",_distBehind);

private _object = _item;

if (_item isEqualType objNull) then {
    detach _object;

    // hideObjectGlobal must be executed before setPos to ensure light objects are rendered correctly
    // Do both on server to ensure they are executed in the correct order
    [QGVAR(serverUnload), [_object, _posBehindVehicleAGL]] call CBA_fnc_serverEvent;
} else {
    _object = createVehicle [_item, _posBehindVehicleAGL, [], 0, "NONE"];
    _object setPosASL (AGLtoASL _posBehindVehicleAGL);
};

[QEGVAR(common,setVelocity), [_object, (velocity _vehicle) vectorAdd ((vectorNormalized (vectorDir _vehicle)) vectorMultiply -5)], _object] call CBA_fnc_targetEvent;

// Open parachute and IR light effect
[{
    params ["_object"];

    if (isNull _object || {getPos _object select 2 < 1}) exitWith {};

    private _parachute = createVehicle ["B_Parachute_02_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];

    // Prevent collision damage
    [QEGVAR(common,fixCollision), _parachute] call CBA_fnc_localEvent;
    [QEGVAR(common,fixCollision), _object, _object] call CBA_fnc_targetEvent;

    // Cannot use setPos on parachutes without them closing down
    _parachute attachTo [_object, [0, 0, 0]];
    detach _parachute;

    private _velocity = velocity _object;

    // Attach to the middle of the object
    (2 boundingBoxReal _object) params ["_bb1", "_bb2"];

    _object attachTo [_parachute, [0, 0, ((_bb2 select 2) - (_bb1 select 2)) / 2]];
    _parachute setVelocity _velocity;

    if ((GVAR(disableParadropEffectsClasstypes) findIf {_object isKindOf _x}) == -1) then {
        private _light = "Chemlight_yellow" createVehicle [0, 0, 0];
        _light attachTo [_object, [0, 0, 0]];
    };
}, _object, 0.7] call CBA_fnc_waitAndExecute;

// Create smoke effect when crate landed
[{
    (_this select 0) params ["_object"];

    if (isNull _object) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    if (getPos _object select 2 < 1) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;

        if ((GVAR(disableParadropEffectsClasstypes) findIf {_object isKindOf _x}) == -1) then {
            private _smoke = "SmokeshellYellow" createVehicle [0, 0, 0];
            _smoke attachTo [_object, [0, 0, 0]];
        };
    };
}, 1, _object] call CBA_fnc_addPerFrameHandler;

if (_showHint) then {
    [
        [
            LSTRING(unloadedItem),
            [_object, true] call FUNC(getNameItem),
            getText (configOf _vehicle >> "displayName")
        ],
        3
    ] call EFUNC(common,displayTextStructured);
};

// Invoke listenable event
["ace_cargoUnloaded", [_object, _vehicle, "paradrop"]] call CBA_fnc_globalEvent;

true // return
