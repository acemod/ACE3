/**
 * fnc_addClientSideOptions.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */
#include "script_component.hpp"

private ["_currentValue"];
PARAMS_5(_name,_localizedName,_localizedDescription,_possibleValues,_defaultValue);

GVAR(clientSideOptions) pushBack [_name, _localizedName, _localizedDescription, _possibleValues, -1, _defaultValue];

//Get the current setting from profile (or default) and set it:
_currentValue = [MENU_TAB_OPTIONS, _name, _defaultValue] call FUNC(loadFromProfile);
[MENU_TAB_OPTIONS, _name, _currentValue] call FUNC(updateSetting);
