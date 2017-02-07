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

private ["_setting", "_settingsMenu"];

if (GVAR(serverConfigGeneration) == 0 || isMultiplayer) exitWith {closeDialog 145246;};

// Filter only user setable setting
GVAR(serverSideOptions) = [];
GVAR(serverSideColors) = [];
GVAR(serverSideValues) = [];
{
    _x params ["_name", "_typeName", "_isClientSetable", "_localizedName", "_localizedDescription", "_possibleValues", "_defaultValue"];

    // Exclude client side options if they are not included for the export
    if (!(_isClientSetable) || GVAR(ClientSettingsExportIncluded)) then {
        // Append the current value to the setting metadata
        _setting = + _x;
        _setting pushBack (missionNamespace getVariable (_x select 0));

        // Categorize the setting according to types
        // @todo: allow the user to modify other types of parameters?
        if ((_typeName == "SCALAR" && count _possibleValues > 0) || (_x select 1) == "BOOL") then {
            GVAR(serverSideOptions) pushBack _setting;
        };
        if (_typeName == "COLOR") then {
            GVAR(serverSideColors) pushBack _setting;
        };
        if ((_typeName == "SCALAR" && count _possibleValues == 0) || _typeName == "ARRAY" || _typeName == "STRING") then {
            GVAR(serverSideValues) pushBack _setting;
        };
    };
} forEach EGVAR(common,settings);

//Delay a frame
[{ [MENU_TAB_SERVER_OPTIONS] call FUNC(onServerListBoxShowSelectionChanged) }, []] call CBA_fnc_execNextFrame;

disableSerialization;
private _menu = uiNamespace getVariable "ACE_serverSettingsMenu";
(_menu displayCtrl 1003) ctrlEnable false;

if (GVAR(ClientSettingsExportIncluded)) then {
    (_settingsMenu displayCtrl 1102) ctrlSetText localize (LSTRING(exClientSettings));
} else {
    (_settingsMenu displayCtrl 1102) ctrlSetText localize (LSTRING(inClientSettings));
};


lbClear (_menu displayCtrl 14);
{
    if (_x == "") then {
        _x = localize (LSTRING(category_all));
    };
    (_menu displayCtrl 14) lbAdd _x;
} forEach GVAR(categories);

(_menu displayCtrl 14) lbSetCurSel GVAR(currentCategorySelection); //All Catagoies
