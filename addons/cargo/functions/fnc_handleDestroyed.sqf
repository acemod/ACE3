#include "..\script_component.hpp"
/*
 * Author: mharis001, Glowbal, drofseh
 * Handles an object being destroyed/deleted.
 * If object contained loaded cargo, the cargo is deleted.
 * If object was loaded cargo, it's removed from loaded cargo list.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_cargo_fnc_handleDestroyed
 *
 * Public: No
 */

params ["_object"];

private _killed = count _this > 1; // The Killed event has 4 params. The Deleted event only has 1 param.

private _loaded = _object getVariable [QGVAR(loaded), []];

if (_loaded isNotEqualTo []) then {
    // Delete all cargo
    {
        if (_x isEqualType objNull) then {
            private _delete = true;
            private _flying = false;

            if (_killed && {random 1 < GVAR(unloadOnKilled)}) then {
                private _pos = getPos _object;
                if (_object isKindOf "Air" && {_pos select 2 > 1}) then { // flying aircraft don't work with FUNC(unloadItem) so work around it.
                    [QGVAR(serverUnload), [_x, (ASLToAGL getPosASL _object) vectorAdd [random [-3, 0, 3], random [-3, 0, 3], random -3]]] call CBA_fnc_serverEvent;
                    detach _x;
                    _x addForce [[0,0,1], [0,0,0]];
                    _delete = false;
                    _flying = true;
                } else {
                    _delete = !([_x, _object, objNull, [], false] call FUNC(unloadItem)); // If a safe position to unload cannot be found FUNC(unloadItem) returns false, delete cargo instead
                };
            };

            if (_delete) then {
                detach _x;
                deleteVehicle _x;
            } else {
                [QGVAR(unloadedCargoOnKilled), [_x, _object, _flying], _x] call CBA_fnc_targetEvent;
            };
        };
    } forEachReversed _loaded;

    // In case vehicle is killed, but not deleted, reset loaded list
    _object setVariable [QGVAR(loaded), [], true];
};

// Update remaining cargo space, if loaded as cargo in a vehicle
private _vehicle = attachedTo _object;

if (!isNull _vehicle && {_object in (_vehicle getVariable [QGVAR(loaded), []])}) then {
    private _cargoSpace = _vehicle call FUNC(getCargoSpaceLeft);
    private _itemSize = (_object call FUNC(getSizeItem)) max 0; // don't let negative size items increase space

    _vehicle setVariable [QGVAR(space), _cargoSpace + _itemSize, true];
};
