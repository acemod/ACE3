/*
 * Author: marc_book, commy2, CAA-Picard
 * Unload and paradrop object from plane or helicopter.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return value:
 * Object unloaded <BOOL>
 *
 * Example:
 * [object, vehicle] call ace_cargo_fnc_paradropItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_item", "_vehicle"];

private "_loaded";
_loaded = _vehicle getVariable [QGVAR(loaded), []];

if !(_item in _loaded) exitWith {false};

// unload item from cargo
_loaded deleteAt (_loaded find _item);
_vehicle setVariable [QGVAR(loaded), _loaded, true];

private ["_cargoSpace", "_itemSize"];

_cargoSpace = [_vehicle] call FUNC(getCargoSpaceLeft);
_itemSize = [_item] call FUNC(getSizeItem);
_vehicle setVariable [QGVAR(space), _cargoSpace - _itemSize, true];

detach _item;

private "_position";
_position = (vectorDir _vehicle vectorMultiply -15) vectorAdd getPosASL _vehicle;

_item setPosASL _position;

["hideObjectGlobal", [_item, false]] call EFUNC(common,serverEvent);

// open parachute and ir light effect
[{
    params ["_item"];

    if (isNull _item || {getPos _item select 2 < 1}) exitWith {};

    private "_parachute";
    _parachute = createVehicle ["B_Parachute_02_F", [0,0,0], [], 0, "CAN_COLLIDE"];

    _parachute attachTo [_item, [0,0,0]];//
    detach _parachute;//

    _item attachTo [_parachute, [0,0,-1]];

    private "_light";
    _light = "Chemlight_yellow" createVehicle [0,0,0];
    _light attachTo [_item, [0,0,0]];

}, [_item], 0.7, 0] call EFUNC(common,waitAndExecute);

// smoke effect when crate landed
[{
    (_this select 0) params ["_item"];

    if (isNull _item) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    if (getPos _item select 2 < 1) then {
        private "_smoke";
        _smoke = "SmokeshellYellow" createVehicle [0,0,0];
        _smoke attachTo [_item, [0,0,0]];

        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

}, 1, [_item]] call CBA_fnc_addPerFrameHandler;

["cargoUnloaded", [_item, _vehicle]] call EFUNC(common,globalEvent);

true
