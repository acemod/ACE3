/**
 * fnc_loadFromProfile.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */
#include "script_component.hpp"

private ["_settingValue"];
PARAMS_3(_type,_name,_default);

_typeString = "";
switch (_type) do {
case (MENU_TAB_OPTIONS): {_typeString = "option";};
case (MENU_TAB_COLORS): {_typeString = "color";};
};

_settingValue = profileNamespace getvariable [(format ["ace_%1_%2", _typeString, _name]), _default];

_badData = isNil "_settingValue";
if (!_badData) then {
	switch (_type) do {
		case (MENU_TAB_OPTIONS): {_badData = ((typeName _settingValue) != (typeName 0));};
		case (MENU_TAB_COLORS): {_badData = (((typeName _settingValue) != (typeName [])) || {(count _settingValue) != 4});};
	};
};
if (_badData) then {
  _settingValue = _default;
  systemChat format ["Bad Data in profile [ace_%1_%2] using default", _typeString, _name];
  ERROR("Bad Value in profile");
};

_settingValue
