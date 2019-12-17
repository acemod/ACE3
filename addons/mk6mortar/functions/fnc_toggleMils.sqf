#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Toggles the mortart to show mils or degrees
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [mortar,bob] call ace_mk6mortar_fnc_toggleMils;
 *
 * Public: No
 */

params ["_mortarVeh"];
TRACE_1("toggleMils",_mortarVeh);

private _currentSetting = _mortarVeh getVariable [QGVAR(useMils), true];
_mortarVeh setVariable [QGVAR(useMils), (!_currentSetting)];
