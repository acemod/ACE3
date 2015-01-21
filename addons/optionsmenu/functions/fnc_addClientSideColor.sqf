/**
 * fnc_addClientSideColor.sqf
 * @Descr: N/A
 * @Author: PabstMirror
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */
#include "script_component.hpp"

PARAMS_4(_name,_localizedName,_localizedDescription,_defaultValue);

GVAR(clientSideColors) pushBack [_name, _localizedName, _localizedDescription, [], _defaultValue];

//Get the current setting from profile (or default) and set it:
_currentValue = [MENU_TAB_COLORS, _name, _defaultValue] call FUNC(loadFromProfile);
[MENU_TAB_COLORS, _name, _currentValue] call FUNC(updateSetting);
