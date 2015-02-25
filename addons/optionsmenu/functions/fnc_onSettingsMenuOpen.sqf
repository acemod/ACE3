/**
* fnc_onSettingsMenuOpen.sqf
* @Descr: called when the settings or configuration menu has opened. Do not use anywhere else.
* @Author: Glowbal
*
* @Arguments: []
* @Return:
* @PublicAPI: false
*/
#include "script_component.hpp"

// Filter only user setable setting
GVAR(clientSideOptions) = [];
GVAR(clientSideColors) = [];
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
	};
} forEach EGVAR(common,settings);

//Delay a frame
[{ [MENU_TAB_OPTIONS] call FUNC(onListBoxShowSelectionChanged) }, []] call EFUNC(common,execNextFrame);
