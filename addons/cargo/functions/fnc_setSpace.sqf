#include "..\script_component.hpp"
/*
 * Author: kymckay
 * Sets the cargo space of any object. Has global effect.
 * Adds the cargo action menu if necessary.
 *
 * Arguments:
 * 0: Vehicle <OBJECT> (default: objNull)
 * 1: Cargo space <NUMBER> (default: nil)
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, 20] call ace_cargo_fnc_setSpace
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_space", nil, [0]] // default can't be a number since all are valid
];
TRACE_2("setSpace",_vehicle,_space);

// Nothing to do here
if (isNil "_space" || {isNull _vehicle}) exitWith {};

// Account for cargo already in the vehicle
private _loaded = _vehicle getVariable [QGVAR(loaded), []];
private _cargoSpace = _space;

{
    _cargoSpace = _cargoSpace - ((_x call FUNC(getSizeItem)) max 0);
} forEach _loaded;

// If the new value is the same as the old, do nothing
if (_cargoSpace == (_vehicle call FUNC(getCargoSpaceLeft))) exitwith {};

// Apply new space globally
// Necessary to update value, even if no space, as API could be used again
_vehicle setVariable [QGVAR(hasCargo), _space > 0, true];
_vehicle setVariable [QGVAR(space), _cargoSpace, true];

// Space should be added for all future JIP players too, regardless of space
private _jipID = format [QGVAR(spaceJipID_%1), hashValue _vehicle];
[QGVAR(initVehicle), _vehicle, _jipID] call CBA_fnc_globalEventJIP;

// Remove from JIP queue if vehicle is deleted
if !(_vehicle getVariable [QGVAR(setSpaceRemoveJip), false]) then {
    [_jipID, _vehicle] call CBA_fnc_removeGlobalEventJIP;

    _vehicle setVariable [QGVAR(setSpaceRemoveJip), true, true];
};
