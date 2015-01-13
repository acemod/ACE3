/**
 * fn_setRadialMenuTargetName_gui.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_menuName"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;
ctrlSetText [2, _menuName];