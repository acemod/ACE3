/**
 * fn_createRadialInteraction_f.sqf
 * @Descr: Creates a radial interaction menu
 * @Author: Glowbal
 *
 * @Arguments: [menuName STRING, displayName STRING, condition CODE, type NUMBER (0 = self, 1 = other, 2 = combined), icon STRING, onOpened CODE]
 * @Return: BOOL. True if menu has succesfully been created
 * @PublicAPI: true
 */


private ["_menuName","_condition","_typeOfMenu","_icon","_onOpened", "_currentEntries" , "_useSorter"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;
_displayName = [_this, 1, "",[""]] call BIS_fnc_Param;
_condition = [_this, 2, {false},[{}]] call BIS_fnc_Param;
_typeOfMenu = [_this, 3, 0, [0]] call BIS_fnc_Param;
_icon = [_this, 4, "", [""]] call BIS_fnc_Param;
_onOpened = [_this, 5, {}, [{}]] call BIS_fnc_Param;
_useSorter = [_this, 6, false, [false]] call BIS_fnc_Param;

_currentEntries = missionNamespace getvariable ["cse_radiusInteraction_f_allMenuNames", []];
missionNamespace setvariable ["cse_radiusInteraction_f_"+_menuName, [_menuName,_displayName,_condition,_typeOfMenu,_icon,_onOpened, _useSorter]]; // if it exist, we want to overwrite it with new values

if (!(_menuName in _currentEntries)) then {
	_currentEntries pushback _menuName;
	missionNamespace setvariable ["cse_radiusInteraction_f_allMenuNames", _currentEntries];
	true;
} else {
	false;
};