/*
 * Author: Glowbal
 * Resets all server settings to default.
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
    [MENU_TAB_SERVER_OPTIONS, _name, _default] call FUNC(updateSetting);
} forEach GVAR(serverSideOptions);

{
    _name = _x select 0;
    _default = _x select 7;
    [MENU_TAB_SERVER_COLORS, _name, _default] call FUNC(updateSetting);
} forEach GVAR(serverSideColors);

{
    _name = _x select 0;
    _default = _x select 7;
    [MENU_TAB_SERVER_VALUES, _name, _default] call FUNC(updateSetting);
} forEach GVAR(serverSideVakyes);

_lastSelected = lnbCurSelRow 200;
[GVAR(optionMenu_openTab)] call FUNC(onserverListBoxShowSelectionChanged);
if (_lastSelected != -1) then {
    lbSetCurSel [200, _lastSelected];
};
