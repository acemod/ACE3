/*
 * Author: esteldunedain, commy2
 * Cycle through non explosive grenades.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_weaponselect_fnc_selectGrenadeOther
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_nextMuzzle", "_text"];

params ["_unit"];

_nextMuzzle = ["NonFrag"] call FUNC(findNextGrenadeMuzzle);

if (_nextMuzzle != "") then {
    GVAR(CurrentGrenadeMuzzleOther) = _nextMuzzle;

    private ["_magazines", "_magazine", "_count", "_return"];
    _magazines = GVAR(NonFragMagazines) select (GVAR(NonFragMuzzles) find _nextMuzzle);
    reverse _magazines;

    _magazine = "";
    _count = {_return = _x in _magazines; if (_return) then {_magazine = _x}; _return} count magazines _unit;

    // There is a muzzle with magazines --> cycle to it
    [_unit, _nextMuzzle] call FUNC(setNextGrenadeMuzzle);

    [_magazine, _count] call FUNC(displayGrenadeTypeAndNumber);

} else {
    // There is a no muzzle with magazines --> select nothing
    GVAR(CurrentGrenadeMuzzleOther) = "";
    if (GVAR(DisplayText)) then {
        _text = [localize LSTRING(NoMiscGrenadeLeft), [1,0,0]] call EFUNC(common,stringToColoredText);
        [composeText [lineBreak, _text]] call EFUNC(common,displayTextStructured);
    };
};

GVAR(CurrentGrenadeMuzzleIsFrag) = false;
