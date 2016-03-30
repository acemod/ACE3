/*
 * Author: PabstMirror
 * Resets all 3den ace settings saved to a mission sqm
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_3den_resetSettings
 *
 * Public: No
 */
#include "script_component.hpp"

TRACE_1("params",_this);

private _resetAllSettingsCode = {
    TRACE_1("reseting",_this);
    QUOTE(ADDON) set3DENMissionAttribute ["ACE_MissionSettings", []];
    systemChat "Reset";
};

[format ["%1?",localize LSTRING(3den_resetSettings)], (localize LSTRING(OpenConfigMenu)), [true, _resetAllSettingsCode], true, "\z\ace\addons\common\data\icon_banana_ca.paa"] call BIS_fnc_3DENShowMessage;
