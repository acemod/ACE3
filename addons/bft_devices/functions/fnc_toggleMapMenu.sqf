/*
 * Author: Gundy
 *
 * Description:
 *   Toggle map menu on / off
 *
 * Arguments:
 *   0: Interface ID <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["interfaceID"] call ace_bft_devices_fnc_toggleMapMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_showMenu"];

PARAMS_1(_interfaceID);

_showMenu = [_interfaceID,"showMenu"] call FUNC(getSettings);
_showMenu = !_showMenu;
[_interfaceID,[["showMenu",_showMenu]]] call FUNC(setSettings);

true