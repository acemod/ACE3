/*
 * Author: esteldunedain
 * Initializes the Map module.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None
 */

#include "script_component.hpp"

if !(isServer) exitWith {};

params ["_logic", "", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(mapIllumination),          "MapIllumination"         ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapGlow),                  "MapGlow"                 ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapShake),                 "MapShake"                ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapLimitZoom),             "MapLimitZoom"            ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapShowCursorCoordinates), "MapShowCursorCoordinates"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(DefaultChannel),           "DefaultChannel"          ] call EFUNC(common,readSettingFromModule);

ACE_LOGINFO("Map Module Initialized.");
