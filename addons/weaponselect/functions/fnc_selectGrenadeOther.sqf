/*
 * Author: esteldunedain, commy2
 *
 * Cycle through non explosive grenades.
 *
 * Argument:
 * None
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

private ["_nextMuzzle", "_text"];

PARAMS_1(_unit);

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
        _text = [localize STRING(NoMiscGrenadeLeft), [1,0,0]] call EFUNC(common,stringToColoredText);
        [composeText [lineBreak, _text]] call EFUNC(common,displayTextStructured);
    };
};

GVAR(CurrentGrenadeMuzzleIsFrag) = false;
