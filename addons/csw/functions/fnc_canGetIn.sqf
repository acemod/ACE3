#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Checks if it's possible to get in the CSW.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_csw_fnc_canGetIn
 *
 * Public: No
 */

// Hide this action if quick mount is enabled
if (GVAR(quickmountEnabled)) exitWith {false};

params ["_vehicle"];

alive _vehicle && {!(alive (gunner _vehicle))} && {(locked _vehicle) < 2} && {!(_vehicle lockedTurret [0])} && {0.3 < ((vectorUp _vehicle) select 2)} // return
