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
#include "script_component.hpp"

//Need to load from profileNamespace because ace_settings might not be init if world = empty
if (profileNamespace getVariable [QGVAR(showNewsOnMainMenu), true]) then {
    ((_this select 0) displayCtrl 80090) ctrlShow true;

    private _ace3VersionStr = (getText (configFile >> "CfgPatches" >> "ace_main" >> "versionStr")) select [0,5];
    ((_this select 0) displayCtrl 80094) ctrlSetText format ["Version: %1", _ace3VersionStr];
    ((_this select 0) displayCtrl 80095) htmlLoad "http://ace3mod.com/version.html";
} else {
    ((_this select 0) displayCtrl 80090) ctrlShow false;
};

/*
Note: switch version.html to simpler format and right align
<h1 align="right">Latest: {{site.ace.version.major}}.{{site.ace.version.minor}}.{{site.ace.version.patch}}</h1>
*/
