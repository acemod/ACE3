#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Renames a loadout from the "Default Loadouts" list.
 *
 * Arguments:
 * 0: Current name of loadout <STRING>
 * 1: New name of loadout <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Squad Leader", "Team Leader"] call ace_arsenal_fnc_renameDefaultLoadout
 *
 * Public: Yes
*/
params [["_currentName", "", [""]], ["_newName", "", [""]]];

if (_currentName isEqualTo _newName) exitWith {};

private _loadoutIndex = GVAR(defaultLoadoutsList) findIf {(_x select 0) == _currentName};
if (_loadoutIndex isEqualTo -1) exitWith {};

(GVAR(defaultLoadoutsList) select _loadoutIndex) set [0, _newName];
