#include "..\script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks the unit's dog tag.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_dogtags_fnc_checkDogtag
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

// Display dog tag
private _doubleTags = (_target getVariable [QGVAR(dogtagTaken), objNull]) != _target;
private _dogtagData = _target call FUNC(getDogtagData);

[LINKFUNC(showDogtag), [_dogtagData, _doubleTags], DOGTAG_SHOW_DELAY] call CBA_fnc_waitAndExecute;
