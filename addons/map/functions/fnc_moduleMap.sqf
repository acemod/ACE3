/*
 * Author: esteldunedain
 * Initializes the Map module.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.) <UNKNOWN>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_map_fnc_moduleMap
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(mapIllumination),          "MapIllumination"         ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapGlow),                  "MapGlow"                 ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapShake),                 "MapShake"                ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapLimitZoom),             "MapLimitZoom"            ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapShowCursorCoordinates), "MapShowCursorCoordinates"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(DefaultChannel),           "DefaultChannel"          ] call EFUNC(common,readSettingFromModule);

INFO("Map Module Initialized.");
