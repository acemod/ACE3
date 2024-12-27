#include "..\script_component.hpp"
/*
 * Author: SzwedzikPL
 * If the dog tag hasn't already been taken, it triggers an event on the server.
 * If the dog tag has already been taken, it displays info about it.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_dogtags_fnc_takeDogtag
 *
 * Public: No
 */

params ["_player", "_target"];

// Animation
_player call EFUNC(common,goKneeling);

// Sound
private _position = _target modelToWorldWorld (_target selectionPosition "neck");

playSound3D [
    selectRandom RUSTLING_SOUNDS,
    objNull,
    false,
    _position,
    1,
    1,
    50
];

// Display message
if ((_target getVariable [QGVAR(dogtagTaken), objNull]) == _target) then {
    [EFUNC(common,displayTextStructured), [LLSTRING(dogtagAlreadyTaken), 2.5], DOGTAG_SHOW_DELAY] call CBA_fnc_waitAndExecute;
} else {
    _target setVariable [QGVAR(dogtagTaken), _target, true];

    [QGVAR(getDogtagItem), [_player, _target]] call CBA_fnc_serverEvent;
};
