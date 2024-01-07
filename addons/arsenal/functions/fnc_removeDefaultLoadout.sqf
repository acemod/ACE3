#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Removes a loadout from the "Default Loadouts" list.
 *
 * Arguments:
 * 0: Name of loadout <STRING>
 * 1: Remove globally <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Squad Leader", true] call ace_arsenal_fnc_removeDefaultLoadout
 *
 * Public: Yes
*/
params [["_name", "", [""]], ["_global", false, [false]]];

if (_global) exitWith {
    private _eventID = format [QGVAR(loadouts_%1), _name];
    [_eventID] call CBA_fnc_removeGlobalEventJIP;
    [QGVAR(removeDefaultLoadout), [_name]] call CBA_fnc_globalEvent;
};

GVAR(defaultLoadoutsList) deleteAt (GVAR(defaultLoadoutsList) findIf {(_x select 0) == _name});

if (is3DEN) then {
    set3DENMissionAttributes [[QGVAR(DummyCategory), QGVAR(DefaultLoadoutsListAttribute), GVAR(defaultLoadoutsList)]];
};
