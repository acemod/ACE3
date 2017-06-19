/*
 * Author: Ruthberg
 * Adds a new (default) gun profile to the profileNamespace
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_add_new_gun
 *
 * Public: No
 */
#include "script_component.hpp"

call FUNC(trim_gun_name);

private _gunName = ctrlText 11001;

if (_gunName != "") then {
    private _gunProfileEntry = [_gunName, 810, 100, 0.0679, -0.0010350, 3.81, 0, 2, 10, 120, 0, 0, 9.525, 7.82, 25.40, 0.393, 1, "ICAO", [[-15,0],[0,0],[10,0],[15,0],[25,0],[30,0],[35,0]], [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]], true];

    GVAR(gunList) = GVAR(gunList) + [_gunProfileEntry];

    lbAdd [6000, _gunName];

    call FUNC(store_gun_list);
};
