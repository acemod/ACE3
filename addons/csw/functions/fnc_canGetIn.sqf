#include "..\script_component.hpp"
/*
 * Author:tcvm
 * Checks if the player can get in the CSW
 *
 * Arguments:
 * 0: CSW <OBJECT>
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

params ["_vehicle"];

alive _vehicle
&& {!(alive (gunner _vehicle))}
&& {(locked _vehicle) < 2}
&& {0.3 < ((vectorUp _vehicle) select 2)}
