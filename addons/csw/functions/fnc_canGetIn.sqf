#include "script_component.hpp"
/*
 * Author: TCVM
 * Checks if the player can get in the weapon
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call ace_csw_fnc_canGetIn
 *
 * Public: No
 */

// hide this action if quick mount is enabled
if ((missionNamespace getVariable [QEGVAR(quickmount,enabled), false]) && {(missionNamespace getVariable [QEGVAR(quickmount,enableMenu), -1]) in [1, 3]}) exitWith {
    false
};

params ["_staticWeapon"];

alive _staticWeapon
&& {!(alive (gunner _staticWeapon))}
&& {(locked _staticWeapon) < 2}
&& {0.3 < ((vectorUp _staticWeapon) select 2)}
