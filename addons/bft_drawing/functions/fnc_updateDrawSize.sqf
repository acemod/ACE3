/*
 * Author: Gundy
 *
 * Description:
 *   Update all Text / Icon size variables based on provided multiplier
 *
 * Arguments:
 *   1: Multiplier <FLOAT>
 *
 * Return Value:
 *   Current multiplier <FLOAT>
 *
 * Example:
 *   [0.1] call ace_bft_drawing_fnc_updateDrawSize;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_multiplier"];

call {
    if (_multiplier < SIZE_MULTIPLIER_MIN) exitWith {
        _multiplier = SIZE_MULTIPLIER_MIN;
    };
    if (_multiplier > SIZE_MULTIPLIER_MAX) then {
        _multiplier = SIZE_MULTIPLIER_MAX;
    };
};

GVAR(mapIconSize) = MAP_ICON_SIZE * _multiplier;
GVAR(mapTextSize) = MAP_TEXT_SIZE * _multiplier;

_multiplier