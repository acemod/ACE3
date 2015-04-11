/*
 * Author: Ruthberg
 * Adds a new (default) gun profile to the profileNamespace
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
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
    _gunProfileEntry = [_gunName, 850, 500, 0.280, -0.0010000, 3.81, 0, 0.338, 0.338, 120, 0, 0, 9.460, "", "", 0.393, 1, "ICAO"];

    GVAR(gunList) = GVAR(gunList) + [_gunProfileEntry];

    lbAdd [6000, _gunProfileEntry select 0];

    profileNamespace setVariable ["ACE_ATragMX_gunList", GVAR(gunList)];
};
