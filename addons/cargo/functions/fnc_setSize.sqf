#include "..\script_component.hpp"
/*
 * Author: kymckay
 * Sets the cargo size of any object. Has global effect.
 * Adds the load action menu if necessary.
 * A negative size disables the object's cargo interactions.
 *
 * Arguments:
 * 0: Object <OBJECT> (default: objNull)
 * 1: Cargo size <NUMBER> (default: nil)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, 3] call ace_cargo_fnc_setSize
 *
 * Public: Yes
 */

params [
    ["_object", objNull, [objNull]],
    ["_size", nil, [0]] // default can't be a number since all are valid
];
TRACE_2("setSize",_object,_size);

private _oldSize = _object call FUNC(getSizeItem);

// Nothing to do here
if (isNil "_size" || {isNull _object} || {_size == _oldSize}) exitWith {};

// Apply new size globally
// Necessary to update value, even if disabled, as API could be used again
_object setVariable [QGVAR(canLoad), _size >= 0, true];
_object setVariable [QGVAR(size), _size, true];

// Update remaining cargo space, if loaded as cargo in a vehicle
private _vehicle = attachedTo _object;

if (!isNull _vehicle && {_object in (_vehicle getVariable [QGVAR(loaded), []])}) then {
    private _cargoSpace = _vehicle call FUNC(getCargoSpaceLeft);

    _vehicle setVariable [QGVAR(space), _cargoSpace + (_oldSize max 0) - (_size max 0), true]; // don't let negative size items increase space
};

// Actions should be added for all future JIP players too, regardless of size
private _jipID = format [QGVAR(sizeJipID_%1), hashValue _object];
[QGVAR(initObject), _object, _jipID] call CBA_fnc_globalEventJIP;

// Remove from JIP queue if object is deleted
if !(_object getVariable [QGVAR(setSizeRemoveJip), false]) then {
    [_jipID, _object] call CBA_fnc_removeGlobalEventJIP;

    _object setVariable [QGVAR(setSizeRemoveJip), true, true];
};
