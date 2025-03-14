#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Plays the detector sound.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Sound class <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ace_buzz_1"] call ace_minedetector_fnc_playDetectorSound
 *
 * Public: No
 */

params ["_unit", "_soundClass"];

if (_unit getVariable [QGVAR(isUsingHeadphones), false]) then {
    if (alive _unit && {_unit == ACE_player}) then {
        playSoundUI [_soundClass];
    };
} else {
    private _posASL = _unit modelToWorldWorld (_unit selectionPosition "granat");

    [_soundClass, _posASL, 3, 15] call EFUNC(common,playConfigSound3D);
};
