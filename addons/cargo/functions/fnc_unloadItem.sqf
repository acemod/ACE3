#include "script_component.hpp"
/*
 * Author: Glowbal, ViperMaul
 * Unload object from vehicle.
 *
 * Arguments:
 * 0: Item <OBJECT or STRING>
 * 1: Vehicle <OBJECT>
 * 2: Unloader <OBJECT> (default: objNull)
 *
 * Return Value:
 * Object was unloaded <BOOL>
 *
 * Example:
 * [object, vehicle] call ace_cargo_fnc_unloadItem
 *
 * Public: Yes
 */

params ["_item", "_vehicle", ["_unloader", objNull]];
TRACE_3("params",_item,_vehicle,_unloader);

//This covers testing vehicle stability and finding a safe position
private _emptyPosAGL = [_vehicle, _item, _unloader] call EFUNC(common,findUnloadPosition);
TRACE_1("findUnloadPosition",_emptyPosAGL);

if ((count _emptyPosAGL) != 3) exitWith {
    TRACE_4("Could not find unload pos",_vehicle,getPosASL _vehicle,isTouchingGround _vehicle,speed _vehicle);
    if ((!isNull _unloader) && {_unloader == ACE_player}) then {
        //display text saying there are no safe places to exit the vehicle
        [localize ELSTRING(common,NoRoomToUnload)] call EFUNC(common,displayTextStructured);
    };
    false
};

private _loaded = _vehicle getVariable [QGVAR(loaded), []];

if !(_item in _loaded) exitWith {
    ERROR_3("Tried to unload item [%1] not in vehicle[%2] cargo[%3]", _item, _vehicle, _loaded);
    false
};

_loaded deleteAt (_loaded find _item);
_vehicle setVariable [QGVAR(loaded), _loaded, true];

private _space = [_vehicle] call FUNC(getCargoSpaceLeft);
private _itemSize = [_item] call FUNC(getSizeItem);
_vehicle setVariable [QGVAR(space), (_space + _itemSize), true];

private _object = _item;
if (_object isEqualType objNull) then {
    detach _object;
    // hideObjectGlobal must be executed before setPos to ensure light objects are rendered correctly
    // do both on server to ensure they are executed in the correct order
    [QGVAR(serverUnload), [_object, _emptyPosAGL]] call CBA_fnc_serverEvent;
} else {
    _object = createVehicle [_item, _emptyPosAGL, [], 0, "NONE"];
    _object setPosASL (AGLtoASL _emptyPosAGL);
    
    [QEGVAR(common,fixCollision), _object] call CBA_fnc_localEvent;
    [QEGVAR(common,fixPosition), _object] call CBA_fnc_localEvent;
};
// Invoke listenable event
["ace_cargoUnloaded", [_object, _vehicle, "unload"]] call CBA_fnc_globalEvent;
true
