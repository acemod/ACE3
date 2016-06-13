/*
 * Author: BaerMitUmlaut
 * Registers an aircraft to the radar system.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_aircraft"];

private _config = configFile >> "CfgVehicles" >> typeOf _aircraft;

private _rcs = if (isNumber (_config >> QGVAR(rcs))) then {
    getNumber (_config >> QGVAR(rcs))
} else {
    // Arbitrary value, middle between F-15 and F/A-18
    // Source: http://www.globalsecurity.org/military/world/stealth-aircraft-rcs.htm
    12
};
_aircraft setVariable [QGVAR(rcs), _rcs];

/*private _range = if (isNumber (_config >> QGVAR(range))) then {
    getNumber (_config >> QGVAR(range))
} else {
    // Arbitrary value
    25
};
_aircraft setVariable [QGVAR(range), _range];*/

private _coneAngleMin = if (isNumber (_config >> QGVAR(coneAngleMin))) then {
    getNumber (_config >> QGVAR(coneAngleMin))
} else {
    // Arbitrary value
    60
};

private _coneAngleMax = if (isNumber (_config >> QGVAR(coneAngleMax))) then {
    getNumber (_config >> QGVAR(coneAngleMax))
} else {
    // Arbitrary value
    15
};

_aircraft setVariable [QGVAR(coneAngleV), (_coneAngleMax - _coneAngleMin) / 2];
_aircraft setVariable [QGVAR(coneAngleH), (_coneAngleMax - _coneAngleMin) / 2];

GVAR(aircraft) pushBack _aircraft;
