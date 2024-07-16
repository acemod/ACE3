#include "script_component.hpp"
/*
 * Author: Glowbal, ViperMaul
 * Unload object from vehicle.
 *
 * Arguments:
 * 0: Item <OBJECT or STRING>
 * 1: Vehicle with the item loaded <OBJECT>
 * 2: Unloading position <ARRAY>
 * 3: If the object was deployed <BOOL>
 *
 * Return Value:
 * Object unloaded <OBJECT>
 *
 * Example:
 * ["ACE_Wheel", cursorObject, getPos player, false] call ace_cargo_fnc_unload
 *
 * Public: No
 */

params ["_item", "_posAGL", "_vehicle", "_deployed"];

// Unload item from cargo
private _loaded = _vehicle getVariable [QGVAR(loaded), []];
_loaded deleteAt (_loaded find _item);
_vehicle setVariable [QGVAR(loaded), _loaded, true];

// Update cargo space remaining
private _cargoSpace = _vehicle call FUNC(getCargoSpaceLeft);
_vehicle setVariable [QGVAR(space), _cargoSpace + _itemSize, true];

private _object = _item;

if (_object isEqualType objNull) then {
    if (isNull isVehicleCargo _object) then {
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

        private _cargoNet = _object getVariable [QGVAR(cargoNet), objNull];
        if !(isNull _cargoNet) then {
            private _itemsRemaining = _loaded select {
                _x getVariable [QGVAR(cargoNet), objNull] isEqualTo _cargoNet
            };
            if (_itemsRemaining isEqualTo []) then {
                objNull setVehicleCargo _cargoNet;
                deleteVehicle _cargoNet;
            };
        };
    } else {
        objNull setVehicleCargo _object;
        _object setPosASL (AGLtoASL _posAGL);
    };
} else {
    _object = createVehicle [_item, _emptyPosAGL, [], 0, "NONE"];

    // If player unloads via deployment, set direction. Must happen before setPosASL command according to wiki
    if (_deployed) then {
        _object setDir _direction;
    };

    _object setPosASL (AGLtoASL _emptyPosAGL);

    [QEGVAR(common,fixCollision), _object] call CBA_fnc_localEvent;
    [QEGVAR(common,fixPosition), _object] call CBA_fnc_localEvent;
};

_object
