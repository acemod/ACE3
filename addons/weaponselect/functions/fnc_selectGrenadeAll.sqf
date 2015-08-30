/*
 * Author: esteldunedain, commy2
 * Cycle through all grenades.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_weaponselect_fnc_selectGrenadeAll
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_text", "_nextMuzzle"];

params ["_unit"];

_nextMuzzle = ["All"] call FUNC(findNextGrenadeMuzzle);

if (_nextMuzzle != "") then {

    private ["_magazines", "_magazine", "_count", "_return"];
    _magazines = GVAR(AllMagazines) select (GVAR(AllMuzzles) find _nextMuzzle);
    reverse _magazines;

    _magazine = "";
    _count = {_return = _x in _magazines; if (_return) then {_magazine = _x}; _return} count magazines _unit;

    // There is a muzzle with magazines --> cycle to it
    [_unit, _nextMuzzle] call FUNC(setNextGrenadeMuzzle);

    [_magazine, _count] call FUNC(displayGrenadeTypeAndNumber);

} else {
    // There is a no muzzle with magazines --> select nothing
    GVAR(CurrentGrenadeMuzzleFrag) = ""; GVAR(CurrentGrenadeMuzzleOther) = "";

    if (GVAR(DisplayText)) then {
        _text = [localize LSTRING(NoGrenadesLeft), [1,0,0]] call EFUNC(common,stringToColoredText);
        [composeText [lineBreak, _text]] call EFUNC(common,displayTextStructured);
    };
};

if (_nextMuzzle in GVAR(FragMuzzles)) then {
    GVAR(CurrentGrenadeMuzzleFrag)   = _nextMuzzle;
    GVAR(CurrentGrenadeMuzzleIsFrag) = true;
} else {
    GVAR(CurrentGrenadeMuzzleOther)  = _nextMuzzle;
    GVAR(CurrentGrenadeMuzzleIsFrag) = false;
};
