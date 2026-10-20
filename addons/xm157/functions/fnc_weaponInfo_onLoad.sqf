#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Creates UI
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display] call ace_xm157_fnc_weaponInfo_onLoad
 *
 * Public: No
 */

params ["_display"];
TRACE_1("weaponInfo_onLoad",_display);

uiNamespace setVariable [QGVAR(display), _display];
[_display, true] call cba_optics_fnc_loadScriptedOptic; // pass thru to cba


// Setup the scope object
private _ctrlScopeObject = _display displayCtrl IDC_SCOPE_OBJECT;
private _scale = 1 / (getResolution # 5); // keep object the same size for any interface size
private _distance = 2.0 * 4/3;
if ((getResolution # 4) < (4/3)) then { _distance = _distance * (getResolution # 7); }; // eg 5x4
private _base = ["3d", [0,0,_distance], _scale] call EFUNC(common,rscObjectHelper);
_ctrlScopeObject ctrlSetPosition _base;
_ctrlScopeObject ctrlSetModelScale _scale;
_ctrlScopeObject ctrlSetModelDirAndUp [[0,1,0],[0,0,1]];
_ctrlScopeObject ctrlShow true;

private _ctrlScopeGroup = _display displayCtrl IDC_SCOPE_GROUP;
// Add reticle
private _ctrlScopeReticle = _display ctrlCreate ["RscPicture", IDC_SCOPE_RETICLE, _ctrlScopeGroup];
_ctrlScopeReticle ctrlSetPosition [0, 0, 1, 4/3];
_ctrlScopeReticle ctrlCommit 0;


// Setup the screen object
private _ctrlScreenObject = _display displayCtrl IDC_SCREEN_OBJECT;
private _scale = 1 / (getResolution # 5); // keep object the same size for any interface size
private _distance = 4/3;
if ((getResolution # 4) < (4/3)) then { _distance = _distance * (getResolution # 7); }; // eg 5x4
private _base = ["3d", [0,0,_distance], _scale] call EFUNC(common,rscObjectHelper);
_ctrlScreenObject ctrlSetPosition _base;
_ctrlScreenObject ctrlSetModelScale _scale;
_ctrlScreenObject ctrlSetModelDirAndUp [[0,1,0],[0,0,1]];
_ctrlScreenObject ctrlShow true;

private _ctrlScreenGroup = _display displayCtrl IDC_SCREEN_GROUP;
// Info display
private _ctrl = _display ctrlCreate [QGVAR(text), IDC_SCREEN_TEXT_UPPER_LEFT, _ctrlScreenGroup];
_ctrl ctrlSetPosition [0.3, 0.2, 0.25, 0.25];
_ctrl ctrlCommit 0;
private _ctrl = _display ctrlCreate [QGVAR(text), IDC_SCREEN_TEXT_UPPER_RIGHT, _ctrlScreenGroup];
_ctrl ctrlSetPosition [0.7, 0.2, 0.25, 0.25];
_ctrl ctrlCommit 0;
// Menu
private _ctrlMenuText = _display ctrlCreate [QGVAR(textMenu), IDC_SCREEN_MENU_TEXT, _ctrlScreenGroup];
_ctrlMenuText ctrlSetPosition [0.1, 0.45, 0.8, 0.7];
_ctrlMenuText ctrlCommit 0;


// Add screen reticle
private _ctrl = _display ctrlCreate ["RscPicture", IDC_SCREEN_RETICLE, _ctrlScreenGroup];


// Add dummy idcs for dist/angle from engine
// 151=Dist, 156=Heading, 182=Pitch,
private _ctrl = _display ctrlCreate ["RscText", 151]; // IDC_IGUI_WEAPON_DISTANCE
_ctrl ctrlSetPosition [-1, -1, 0, 0];
_ctrl ctrlCommit 0;
private _ctrl = _display displayCtrl 168; // hide ca_zeroing (from cba)
_ctrl ctrlShow false;


GVAR(shown) = true;
GVAR(data) set ["menu_updated", true];
addMissionEventHandler ["Draw3D", LINKFUNC(weaponInfo_draw), [_display]];
