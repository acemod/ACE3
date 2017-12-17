/*
 * Author: SilentSpike
 * Set the cargo space of any object. Has global effect.
 * Adds the cargo action menu if necessary.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Cargo space <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, 20] call ace_cargo_fnc_setSpace
 *
 * Public: Yes
 */
#include "script_component.hpp"

// Only run this after the settings are initialized
if !(EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(setSpace), _this];
};

params [
    ["_vehicle",objNull,[objNull]],
    ["_space",nil,[0]] // Default can't be a number since all are valid
];
TRACE_2("setSpace",_vehicle,_size);

// Nothing to do here
if (
    (isNil "_space") ||
    {isNull _vehicle} ||
    {_space == _vehicle getVariable [QGVAR(space), CARGO_SPACE(typeOf _vehicle)]}
) exitWith {};

// Apply new space globally
// Necessary to update value, even if no space, as API could be used again
_vehicle setVariable [QGVAR(hasCargo), _space > 0, true];
_vehicle setVariable [QGVAR(space), _space, true];

// If no cargo space no need for cargo menu
if (_space <= 0) exitWith {};

// If an existing ID is present, cargo menu has already been added globally
private _jipID = _vehicle getVariable QGVAR(setSpace_jipID);

// Cargo menu should be added to all future JIP players too
if (isNil "_jipID") then {
    _jipID = [QGVAR(initVehicle), [_vehicle]] call CBA_fnc_globalEventJIP;
    [_jipID, _vehicle] call CBA_fnc_removeGlobalEventJIP;

    // Store the ID for any future calls to this function
    _vehicle setVariable [QGVAR(setSpace_jipID), _jipID, true];
};
