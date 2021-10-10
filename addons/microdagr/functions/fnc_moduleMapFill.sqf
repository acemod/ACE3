#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Function for the module (handles the map fill level)
 *
 * Arguments:
 * 0: logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [module] call ace_microdagr_fnc_moduleMapFill
 *
 * Public: No
 */

params ["_logic"];

[_logic, QGVAR(MapDataAvailable), "MapDataAvailable"] call EFUNC(common,readSettingFromModule);
