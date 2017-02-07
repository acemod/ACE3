/*
 * Author: Glowbal
 * Play the detector sound
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Sound class <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ace_buzz_1", 1] call ace_minedetector_fnc_playDetectorSound
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_soundClass"];

if (isNull _unit) exitWith {
    ERROR_1("unit does not exist [%1]",_unit);
};
if (!alive _unit) exitWith {
    ERROR_1("unit is not alive [%1]",_unit);
};

if (_unit getVariable [QGVAR(isUsingHeadphones), false] && {_unit == ACE_player}) then {
    playSound _soundClass;
} else {
    private _posASL = AGLtoASL (_unit modelToWorld (_unit selectionPosition "granat"));
    [_soundClass, _posASL, 3, 15] call EFUNC(common,playConfigSound3D);
};
