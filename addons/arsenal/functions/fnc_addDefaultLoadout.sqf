#include "script_component.hpp"
/*
 * Author: 654wak654
 * Adds a loadout to the "Default Loadouts" list.
 * If a loadout with the same name exists, it is overwritten.
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

private _loadoutIndex = (+(GVAR(defaultLoadoutsList))) findIf {(_x select 0) == _name};
if (_loadoutIndex == -1) then {
    GVAR(defaultLoadoutsList) pushBack [_name, _loadout];
} else {
    GVAR(defaultLoadoutsList) set [_loadoutIndex, [_name, _loadout]];
};
