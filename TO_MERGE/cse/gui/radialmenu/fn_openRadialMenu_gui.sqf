/**
 * fn_openRadialMenu_gui.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_entries", "_menuName","_target"];
disableSerialization;
createDialog "CSE_RADIAL_MENU";
CSE_RADIAL_SUB_MENU_GUI = [];

_menuName = [_this, 0, "Main Menu", [""]] call BIS_fnc_Param;
_entries = [_this, 1, [], [[]]] call BIS_fnc_Param;
_target = [_this, 2, ObjNull, [ObjNull]] call BIS_fnc_Param;
setMousePosition [ 0.5, 0.6 ];
[_menuName,_entries, _target] call cse_fnc_openRadialSubMenu_GUI;

[[_menuName, _entries, _target],"openRadialMenu"] call cse_fnc_customEventHandler_F;