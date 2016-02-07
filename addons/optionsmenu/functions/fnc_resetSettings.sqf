/*
 * Author: Glowbal
 * Resets all settings to default.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_onListBoxSettingsChanged
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_name", "_default", "_lastSelected"];

{
    _name = _x select 0;
    _default = _x select 7;
    [MENU_TAB_OPTIONS, _name, _default] call FUNC(updateSetting);
} forEach GVAR(clientSideOptions);

{
    _name = _x select 0;
    _default = _x select 7;
    [MENU_TAB_COLORS, _name, _default] call FUNC(updateSetting);
} forEach GVAR(clientSideColors);

_lastSelected = lnbCurSelRow 200;
[GVAR(optionMenu_openTab)] call FUNC(onListBoxShowSelectionChanged);
if (_lastSelected != -1) then {
    lnbSetCurSelRow [200, _lastSelected];
};
