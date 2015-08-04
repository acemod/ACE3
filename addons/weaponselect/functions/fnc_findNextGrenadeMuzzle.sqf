/*
 * Author: commy2
 *
 * Find the next Grenade Muzzle.
 *
 * Argument:
 * 0: Grenade Type ("All", "Frag", "NonFrag") <STRING>
 *
 * Return value:
 * Class name of next throw muzzle <STRING>
 */
#include "script_component.hpp"

private ["_allMags", "_allMuzzles", "_magazines", "_start", "_index", "_nextMuzzle"];

params ["_type"];

_allMags = missionNamespace getVariable [format [QGVAR(%1Magazines), _type], []];
_allMuzzles = missionNamespace getVariable [format [QGVAR(%1Muzzles), _type], []];

_magazines = magazines ACE_player;

_start = [GVAR(CurrentGrenadeMuzzleOther), GVAR(CurrentGrenadeMuzzleFrag)] select GVAR(CurrentGrenadeMuzzleIsFrag);
_index = _allMuzzles find _start;

scopeName "SearchMain";

_nextMuzzle = "";
for "_index" from (_index + 1) to (count _allMuzzles - 1) do {
    {
        if (_x in (_allMags select _index)) exitWith {_nextMuzzle = _allMuzzles select _index; breakTo "SearchMain"};
    } count _magazines;
};

if (_nextMuzzle != "") exitWith {_nextMuzzle};

for "_index" from 0 to _index do {
    {
        if (_x in (_allMags select _index)) exitWith {_nextMuzzle = _allMuzzles select _index; breakTo "SearchMain"};
    } count _magazines;
};

_nextMuzzle
