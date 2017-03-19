/*
 * Author: simpo ( based on fnc_tapShoulder.sqf by commy2)
 * Taps a shoulder
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 * 2: Shoulder which was tapped [0: left, 1: right] <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, target, 0] call ace_interaction_fnc_tapShoulder
 *
 * Public: No
 */
#include "script_component.hpp"


if (_unit == ACE_player) then {
    addCamShake [4, 0.5, 5];
};

[_unit, "gesturePoint"] call EFUNC(common,doGesture);

