/*
 * Author: PabstMirror
 * Handles double clicking on the setting listbox
 *
 * Arguments:
 * 0: Setting List box (not used) <CONTROL>
 * 1: Index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [settingList, 1] call ace_microdagr_fnc_appSettingsLBClick
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;
params ["_control", "_itemClicked"];

switch (_itemClicked) do {
    case (0): { GVAR(settingUseMils) = ! GVAR(settingUseMils)};
    case (1): { GVAR(settingShowAllWaypointsOnMap) = ! GVAR(settingShowAllWaypointsOnMap)};
};

[] call FUNC(updateDisplay);
