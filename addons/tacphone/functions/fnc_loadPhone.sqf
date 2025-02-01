#include "..\script_component.hpp"
/*
 * Author: KJW
 * Loads tacphone
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_tacphone_fnc_loadPhone
 *
 * Public: No
 */

/*


This is absolutely not even slightly feature complete nor organised.


*/

private _emptyDisplay = findDisplay 46 createDisplay "RscDisplayEmpty";
private _background = _emptyDisplay ctrlCreate ["RscPicture", -1];

private _phoneWidth = PHONE_WIDTH+0.1;
private _phoneHeight = PHONE_HEIGHT+0.1;
_background ctrlSetPosition [(1-_phoneWidth)/2, (1-_phoneHeight)/2, _phoneWidth, _phoneHeight];
_background ctrlSetText "#(rgb,1,1,1)color(0.3,0.3,0.3,1)";
_background ctrlCommit 0;

// This will be the container, in which all apps content will be created. The phone itself has no control over its contents (besides deleting all of it)
//#TODO this should not be a global variable, for one it doesn't serialize in missionNamespace, second it prevents us from having multiple phone displays open at the same time
GVAR(appsection) = _emptyDisplay ctrlCreate ["RscControlsGroupNoScrollbars", -1];
GVAR(appsection) ctrlSetPosition [(1-PHONE_WIDTH)/2, (1-PHONE_HEIGHT)/2, PHONE_WIDTH, PHONE_HEIGHT];
GVAR(appsection) ctrlCommit 0;

//#TODO remember app that was last opened when phone was closed

GVAR(app_selected) = "";

// Switch to Homescreen, which is the default app
[_emptyDisplay, "Homescreen"] call FUNC(switchToApp);
