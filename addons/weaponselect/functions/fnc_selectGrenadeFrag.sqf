/*
 * Author: esteldunedain, commy2
 *
 * Cycle through frags.
 *
 * Argument:
 * None
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

private ["_text", "_nextMuzzle"];

PARAMS_1(_unit);

_nextMuzzle = ["Frag"] call FUNC(findNextGrenadeMuzzle);

if (_nextMuzzle != "") then {
    GVAR(CurrentGrenadeMuzzleFrag) = _nextMuzzle;

    private ["_magazines", "_magazine", "_count", "_return"];
    _magazines = GVAR(FragMagazines) select (GVAR(FragMuzzles) find _nextMuzzle);
    reverse _magazines;

    _magazine = "";
    _count = {_return = _x in _magazines; if (_return) then {_magazine = _x}; _return} count magazines _unit;

    // There is a muzzle with magazines --> cycle to it
    [_unit, _nextMuzzle] call FUNC(setNextGrenadeMuzzle);

    [_magazine, _count] call FUNC(displayGrenadeTypeAndNumber);

} else {
    // There is a no muzzle with magazines --> select nothing
    GVAR(CurrentGrenadeMuzzleFrag) = "";
    if (GVAR(DisplayText)) then {
        _text = [localize "STR_ACE_WeaponSelect_NoFragsLeft", [1,0,0]] call EFUNC(common,stringToColoredText);
        [composeText [lineBreak, _text]] call EFUNC(common,displayTextStructured);
    };
};

GVAR(CurrentGrenadeMuzzleIsFrag) = true;
