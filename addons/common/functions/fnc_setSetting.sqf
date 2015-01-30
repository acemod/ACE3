/*
 * Author: CAA-Picard
 * Set a setting if it was not previosuly forced. Force if neccesary.
 *
 * Arguments:
 * 0: Setting name (String)
 * 1: Value (Any)
 * 2: Force it? (Bool) (Optional)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_name,_value);

if !(isServer) exitWith {};

private ["force"];
_force = false;
if (count _this > 2) then {
    _force = _this select 2;
};

// Check if it's already forced and quit
if (missionNamespace getVariable [format ["%1_forced", _name], false]) exitWith {};

// Check if the variable is already defined
if (isNil _name) then {
    // Add the variable to a list on the server
    GVAR(settingsList) pushBack _name;
};

// Update the variable and publish it
missionNamespace setVariable [_name, _value];
publicVariable _name;
missionNamespace setVariable [format ["%1_forced", _name], _force];
publicVariable format ["%1_forced", _name];
