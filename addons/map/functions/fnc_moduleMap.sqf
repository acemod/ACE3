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

PARAMS_3(_logic,_units,_activated);

if !(_activated) exitWith {};

[_logic, QGVAR(mapIllumination),          "MapIllumination"         ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapShake),                 "MapShake"                ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapLimitZoom),             "MapLimitZoom"            ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapShowCursorCoordinates), "MapShowCursorCoordinates"] call EFUNC(common,readSettingFromModule);

diag_log text "[ACE]: Map Module Initialized.";
