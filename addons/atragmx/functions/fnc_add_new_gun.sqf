/*
 * Author: Ruthberg
 * Adds a new (default) gun profile to the profileNamespace
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_add_new_gun
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_gunName", "_gunProfileEntry"];

_gunName = ctrlText 11001;
if (_gunName != "") then {
    _gunProfileEntry = [_gunName, 810, 100, 0.0679, -0.0010350, 3.81, 0, 2, 10, 120, 0, 0, 9.525, 7.82, 25.40, 0.393, 1, "ICAO"],

    GVAR(gunList) = GVAR(gunList) + [_gunProfileEntry];

    lbAdd [6000, _gunProfileEntry select 0];

    profileNamespace setVariable ["ACE_ATragMX_gunList", GVAR(gunList)];
};
