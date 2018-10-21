#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * If dogtag is not already taken triggers event on server.
 * If dogtag already taken displays info about it.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, unit] call ace_dogtags_fnc_takeDogtag
 *
 * Public: No
 */

params ["_player", "_target"];

// animation
_player call EFUNC(common,goKneeling);

// sound
private _position = AGLToASL (_target modelToWorld (_target selectionPosition "neck"));

playSound3D [
    selectRandom RUSTLING_SOUNDS,
    objNull,
    false,
    _position,
    1,
    1,
    50
];

// display message
if ((_target getVariable [QGVAR(dogtagTaken), objNull]) == _target) then {
    [{
        [_this, 2.5] call EFUNC(common,displayTextStructured);
    }, localize LSTRING(dogtagAlreadyTaken), DOGTAG_SHOW_DELAY] call CBA_fnc_waitAndExecute;
} else {
    _target setVariable [QGVAR(dogtagTaken), _target, true];
    [QGVAR(getDogtagItem), [_player, _target]] call CBA_fnc_serverEvent;
};
