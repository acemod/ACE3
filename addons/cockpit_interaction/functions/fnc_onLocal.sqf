/*
 * Author: BaerMitUmlaut
 * Adds/removes the handleActionsPFH where the vehicle is/was local.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 * 1: Local <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_helo, true] call ace_cockpit_interaction_fnc_onLocal
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle", "_local"];

if !(getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(enabled)) == 1) exitWith {};

if (_local) then {
    private _pfh = [FUNC(handleActionsPFH), 0, _vehicle] call CBA_fnc_addPerFrameHandler;
    _vehicle setVariable [QGVAR(handleActionsPFH), _pfh];
} else {
    private _pfh = _vehicle getVariable [QGVAR(handleActionsPFH), -1];
    [_pfh] call CBA_fnc_removePerFrameHandler;
};
