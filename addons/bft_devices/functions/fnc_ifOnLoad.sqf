/*
 * Author: Gundy
 *
 * Description:
 *   Handles dialog / display setup, called by "onLoad" event
 *
 * Arguments:
 *   0: Display <OBJECT>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [_dispaly] call ace_bft_devices_fnc_ifOnLoad;
 *
 * Public: No
 */

#include "script_component.hpp"

private [];

uiNamespace setVariable [GVAR(ifOpen) select 1,_this select 0];

[] call FUNC(ifUpdate);

GVAR(ifOpenStart) = false;

true