/*
 * Author: PabstMirror
 * Verifies magazines moved with exact ammo counts preserved.
 * Arrays will be in format from magazinesAmmo/magazinesAmmoCargo
 * e.g.: [["30Rnd_65x39_caseless_mag",15], ["30Rnd_65x39_caseless_mag",30]]
 *
 * Arguments:
 * 0: Start on container A <ARRAY>
 * 1: End on container A <ARRAY>
 * 2: Start on container B <ARRAY>
 * 3: End on container B <ARRAY>
 *
 * Return Value:
 * Verified Good <BOOL>
 *
 * Example:
 * [] call ace_disarming_fnc_verifyMagazinesMoved
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_problem", "_beginingArray"];

PARAMS_4(_startA,_endA,_startB,_endB);

//Quick Lazy Count Check
if (((count _startA) + (count _startB)) != ((count _endA) + (count _endB))) exitWith {
    systemChat format ["%1 - %2", ((count _startA) + (count _startB)), ((count _endA) + (count _endB))];
    false
};

_beginingArray = (_startA + _startB);

_problem = false;
{
    _index = _beginingArray find _x;
    if (_index == -1) exitWith {_problem = true;};
    _beginingArray deleteAt _index;
} forEach (_endA + _endB);

systemChat format ["%1 - %2", _problem, _beginingArray];

(!_problem) && {_beginingArray isEqualTo []}
