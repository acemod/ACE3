#include "script_component.hpp"
/*
 * Author: 654wak654
 * Adds a loadout to the "Default Loadouts" list.
 *
 * Arguments:
 * 0: Name of loadout <STRING>
 * 1: getUnitLoadout array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Squad Leader", getUnitLoadout sql1] call ace_arsenal_fnc_addDefaultLoadout
 *
 * Public: Yes
*/

params [["_name", "", [""]], ["_loadout", [], [[]], 10]];

if (isNil QGVAR(defaultLoadoutsList)) then {
	GVAR(defaultLoadoutsList) = [];
};

GVAR(defaultLoadoutsList) append [_name, _loadout];
