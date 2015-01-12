/**
 * fn_getAllCategoryEntriesRadialMenu_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_menuName","_categoryName"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;
_categoryName = [_this, 1, "",[""]] call BIS_fnc_Param;

(missionNamespace getvariable ["cse_radiusInteraction_f_category_entries_"+_menuName+_categoryName, []])