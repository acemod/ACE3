/*
 * Author: commy2
 * Find the next Grenade Magazine.
 *
 * Arguments:
 * 0: Grenade Type ("All", "Frag", "NonFrag") <STRING>
 *
 * Return Value:
 * Magazine classname <STRING>
 *
 * Example:
 * ["All"] call ace_weaponselect_fnc_findNextGrenadeMagazine
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_allMags", "_allMuzzles", "_magazines", "_start", "_index", "_nextMagazine"];

params ["_type"];

_allMags = missionNamespace getVariable [format [QGVAR(%1Magazines), _type], []];
_allMuzzles = missionNamespace getVariable [format [QGVAR(%1Muzzles), _type], []];

_magazines = magazines ACE_player;

_start = [GVAR(CurrentGrenadeMuzzleOther), GVAR(CurrentGrenadeMuzzleFrag)] select GVAR(CurrentGrenadeMuzzleIsFrag);
_index = _allMuzzles find _start;

scopeName "SearchMain";

_nextMagazine = "";
for "_index" from (_index + 1) to (count _allMuzzles - 1) do {
    {
        if (_x in (_allMags select _index)) exitWith {_nextMagazine = _x; breakTo "SearchMain"};
    } count _magazines;
};

if (_nextMagazine != "") exitWith {_nextMagazine};

for "_index" from 0 to _index do {
    {
        if (_x in (_allMags select _index)) exitWith {_nextMagazine = _x; breakTo "SearchMain"};
    } count _magazines;
};

_nextMagazine
