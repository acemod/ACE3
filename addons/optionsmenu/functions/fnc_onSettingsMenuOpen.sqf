/*
 * Author: Glowbal
 * Called from the onLoad of ACE_settingsMenu dialog.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [onLoadEvent] call ACE_optionsmenu_fnc_onSettingsMenuOpen
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_setting", "_menu"];

// Filter only user setable setting
GVAR(clientSideOptions) = [];
GVAR(clientSideColors) = [];
private _clientSettableCategories = [""];

{
    // If the setting is user setable and not forced
    if ((_x select 2) && !(_x select 6)) then {
        // Append the current value to the setting metadata
        _setting = + _x;
        _setting pushBack (missionNamespace getVariable (_x select 0));

        // Categorize the setting according to types
        // @todo: allow the user to modify other types of parameters?
        if ((_x select 1) == "SCALAR" || (_x select 1) == "BOOL") then {
            GVAR(clientSideOptions) pushBack _setting;
        };
        if ((_x select 1) == "COLOR") then {
            GVAR(clientSideColors) pushBack _setting;
        };
        _clientSettableCategories pushBackUnique (_x select 8); //Add to list of user-settable categories
    };
} forEach EGVAR(common,settings);

//Delay a frame
[{ [MENU_TAB_OPTIONS] call FUNC(onListBoxShowSelectionChanged) }, []] call CBA_fnc_execNextFrame;

disableSerialization;
_menu = uiNamespace getVariable "ACE_settingsMenu";
(_menu displayCtrl 1002) ctrlEnable false;
(_menu displayCtrl 1003) ctrlEnable false;

if (GVAR(serverConfigGeneration) == 0) then {
    (_menu displayCtrl 1102) ctrlEnable false;
    (_menu displayCtrl 1102) ctrlShow false;
};

lbClear (_menu displayCtrl 14);
{
    if (_x in _clientSettableCategories) then { //only show category if it has user-settable options
        if (_x == "") then {
            _x = localize LSTRING(category_all);
        };
        private _Index = (_menu displayCtrl 14) lbAdd _x;
        (_menu displayCtrl 14) lbSetValue [_Index, _forEachIndex];
    };
} forEach GVAR(categories);

(_menu displayCtrl 14) lbSetCurSel GVAR(currentCategorySelection); //All Catagoies


