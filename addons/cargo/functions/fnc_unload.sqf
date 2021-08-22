#include "script_component.hpp"
/*
 * Author: Glowbal, ViperMaul
 * Unload object from vehicle.
 *
 * Arguments:
 * 0: Item <OBJECT or STRING>
 * 1: Empty position <ARRAY>
 * 2: Items loaded in cargo <ARRAY>
 * 3: Vehicle with the item loaded <OBJECT>
 *
 * Return Value:
 * Object unloaded <OBJECT>
 *
 * Example:
 * [item, posAGL, loaded, vehicle] call ace_cargo_fnc_unload
 *
 * Public: No
 */

params ["_item", "_posAGL", "_loaded", "_vehicle"];

_loaded deleteAt (_loaded find _item);
_vehicle setVariable [QGVAR(loaded), _loaded, true];

private _space = [_vehicle] call FUNC(getCargoSpaceLeft);
private _itemSize = [_item] call FUNC(getSizeItem);
_vehicle setVariable [QGVAR(space), _space + _itemSize, true];

private _object = _item;
if (_object isEqualType objNull) then {
    if (isNull isVehicleCargo _object) then {
        detach _object;
        // hideObjectGlobal must be executed before setPos to ensure light objects are rendered correctly
        // do both on server to ensure they are executed in the correct order
        [QGVAR(serverUnload), [_object, _posAGL]] call CBA_fnc_serverEvent;

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
    _object = createVehicle [_item, _posAGL, [], 0, "NONE"];
    _object setPosASL (AGLtoASL _posAGL);

    [QEGVAR(common,fixCollision), _object] call CBA_fnc_localEvent;
    [QEGVAR(common,fixPosition), _object] call CBA_fnc_localEvent;
};

_object
