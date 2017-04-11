/*
 * Author: PabstMirror
 * Loads the version info HTML box from main menu
 *
 * Arguments:
 * 0: Display (from onMouseMoving) <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * onMouseMovingEvent execVM "script_loadMainMenuBox.sqf";
 *
 * Public: No
 */
#include "\a3\ui_f\hpp\defineResinclDesign.inc"
#include "script_component.hpp"

params ["_display"];
private _controlsGroup = _display displayCtrl IDC_MAIN_INFO;

//Need to load from profileNamespace because ace_settings might not be init if world = empty
if (profileNamespace getVariable [QGVAR(showNewsOnMainMenu), true]) then {
    _controlsGroup ctrlShow true;

    private _fnc_onSetFocus = {
        params ["_control"];
        private _controlsGroup = ctrlParentControlsGroup _control;

        (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BACKGROUND) ctrlSetTextColor [1,1,1,1];
        (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BACKGROUND_ICON) ctrlSetTextColor [1,1,1,1];
        (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_ICON) ctrlSetTextColor [0,0,0,1];
    };

    private _fnc_onKillFocus = {
        params ["_control"];
        private _controlsGroup = ctrlParentControlsGroup _control;

        (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BACKGROUND) ctrlSetTextColor [0,0,0,0.75];
        (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BACKGROUND_ICON) ctrlSetTextColor [0,0,0,0.75];
        (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_ICON) ctrlSetTextColor [1,1,1,0.5];
    };

    (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BUTTON) ctrlAddEventHandler ["MouseEnter", _fnc_onSetFocus];
    (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BUTTON) ctrlAddEventHandler ["SetFocus", _fnc_onSetFocus];
    (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BUTTON) ctrlAddEventHandler ["MouseExit", _fnc_onKillFocus];
    (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BUTTON) ctrlAddEventHandler ["KillFocus", _fnc_onKillFocus];

    private _versionStr = getText (configFile >> "CfgPatches" >> "ace_main" >> "versionStr") splitString ".";
    _versionStr resize 3; // MAJOR, MINOR, PATCH
    _versionStr = _versionStr joinString ".";

    (_display displayCtrl IDC_MAIN_INFO_CURRENT_VERSION_INFO) ctrlSetText format ["Version: %1", _versionStr];
    (_display displayCtrl IDC_MAIN_INFO_NEWEST_VERSION_INFO) htmlLoad "https://ace3mod.com/version.html";
} else {
    _controlsGroup ctrlShow false;
};

/*
Note: switch version.html to simpler format and right align
<h1 align="right">Latest: {{site.ace.version.major}}.{{site.ace.version.minor}}.{{site.ace.version.patch}}</h1>
*/
