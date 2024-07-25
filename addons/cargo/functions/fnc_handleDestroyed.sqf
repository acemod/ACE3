#include "..\script_component.hpp"
/*
 * Author: mharis001, Glowbal
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

private _loaded = _object getVariable [QGVAR(loaded), []];

if (_loaded isNotEqualTo []) then {
    // Delete all cargo
    {
        if (_x isEqualType objNull) then {
            detach _x;
            deleteVehicle _x;
        };
    } forEach _loaded;

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
