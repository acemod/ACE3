/**
 * fn_getIcon_f.sqf
 * @Descr: Grab an icon from the CSE Icon collection
 * @Author: Glowbal
 *
 * @Arguments: [name STRING]
 * @Return: STRING Path to icon. Returns empty path if icon does not exist
 * @PublicAPI: true
 */

#define CSE_ICON_PATH "cse\cse_gui\radialmenu\data\icons\"

private ["_iconName","_return"];
_iconName = [_this, 0, "",[""]] call bis_fnc_param;
if (_iconName == "") then {
	_iconName = "icon_cse";
};
_return = CSE_ICON_PATH + _iconName + ".paa";

_return