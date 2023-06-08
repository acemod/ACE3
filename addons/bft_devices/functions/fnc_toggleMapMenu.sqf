#include "script_component.hpp"
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


params ["_interfaceID"];

private _showMenu = [_interfaceID, "showMenu"] call FUNC(getSettings);
[_interfaceID, [["showMenu", !_showMenu]]] call FUNC(setSettings);

true
