#include "..\script_component.hpp"
/*
 * Author: 654wak654, johnb43
 * Adds a loadout to the "Default Loadouts" list.
 * If a loadout with a similar name exists (case insensitve), it is overwritten.
 *
 * Arguments:
 * 0: Name of loadout <STRING>
 * 1: CBA extended loadout or getUnitLoadout array <ARRAY>
 * 2: Add globally <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Squad Leader", getUnitLoadout sql1] call ace_arsenal_fnc_addDefaultLoadout
 *
 * Public: Yes
*/

params [["_name", "", [""]], ["_loadout", [], [[]]], ["_global", false, [false]]];

if (_global) then {
    [QGVAR(addDefaultLoadout), [_name, _loadout]] call CBA_fnc_remoteEvent;
};

private _extendedInfo = createHashMap;

// Check if CBA extended loadout array
if (count _loadout == 2) then {
    _extendedInfo = _loadout select 1;
    _loadout = _loadout select 0;
};

if (count _loadout != 10) exitWith {};

if (isNil QGVAR(defaultLoadoutsList)) then {
    GVAR(defaultLoadoutsList) = [];
};

// Replace unique items with their bases and replace weapons with their base weapons
_loadout = [_loadout] call FUNC(replaceUniqueItemsLoadout);

private _index = GVAR(defaultLoadoutsList) findIf {(_x select 0) == _name};

// If there is an already existing loadout with similar name, overwrite it
if (_index != -1) then {
    GVAR(defaultLoadoutsList) set [_index, [_name, [_loadout, _extendedInfo]]];
} else {
    // Otherwise just add
    GVAR(defaultLoadoutsList) pushBack [_name, [_loadout, _extendedInfo]];
};

if (is3DEN) then {
    set3DENMissionAttributes [[QGVAR(DummyCategory), QGVAR(DefaultLoadoutsListAttribute), GVAR(defaultLoadoutsList)]];
};
