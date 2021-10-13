#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks unit dogtag.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, unit] call ace_dogtags_fnc_checkDogtag
 *
 * Public: No
 */

params ["_player", "_target"];

// animation
_player call EFUNC(common,goKneeling);

// sound
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

// display dogtag
private _doubleTags = (_target getVariable [QGVAR(dogtagTaken), objNull]) != _target;
private _dogTagData = [_target] call FUNC(getDogTagData);

[{
    [QGVAR(showDogtag), _this] call CBA_fnc_localEvent;
}, [_dogTagData, _doubleTags], DOGTAG_SHOW_DELAY] call CBA_fnc_waitAndExecute;
