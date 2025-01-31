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
GVAR(background) = _emptyDisplay ctrlCreate ["RscPicture", -1];

private _phoneWidth = PHONE_WIDTH+0.1;
private _phoneHeight = PHONE_HEIGHT+0.1;
GVAR(background) ctrlSetPosition [(1-_phoneWidth)/2, (1-_phoneHeight)/2, _phoneWidth, _phoneHeight];
GVAR(background) ctrlSetText "#(rgb,1,1,1)color(0.3,0.3,0.3,1)";
GVAR(background) ctrlCommit 0;

//#TODO remember app that was last opened when phone was closed

GVAR(app_selected) = "";

// Switch to Homescreen, which is the default app
[QGVAR(loadApp),["Homescreen",_emptyDisplay]] call CBA_fnc_localEvent;
