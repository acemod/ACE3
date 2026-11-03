#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Initializes the Map module.
 *
 * Arguments:
 * 0: Logic <OBJECT>
 * 1: Synchronized Units (not used) <ARRAY>
 * 2: Module Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_map_fnc_moduleMap
 *
 * Public: No
 */

params ["_logic", "", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(mapIllumination),          "MapIllumination"         ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapGlow),                  "MapGlow"                 ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapShake),                 "MapShake"                ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapLimitZoom),             "MapLimitZoom"            ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapShowCursorCoordinates), "MapShowCursorCoordinates"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(DefaultChannel),           "DefaultChannel"          ] call EFUNC(common,readSettingFromModule);

INFO("Map Module Initialized.");
