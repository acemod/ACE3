/*
 * Author: LAxemann
 * Checks how much the suppression value should decrease, should be
 * called via the CBA perFrameHandler with 1s delay
 *
 * Example:
 * [ace_playersuppression_fnc_main, 1, []] call CBA_fnc_addPerFrameHandler
 *
 * Public: Yes
 */
#include "script_component.hpp"

if (GVAR(threshold) > 0) then {
    private ["_shotAt","_subtract"];
    _shotAt 	= false;	
    if ((time - GVAR(lastShotAt)) <= 1.75) then {_shotAt = true};

    _subtract = switch (true) do {
        case (_shotAt)             : {0};
        case (GVAR(isSuppressed))  : {1.2};
        default                      {2};
    };
    GVAR(threshold) = GVAR(threshold) - _subtract;
    if (GVAR(threshold) < 0) then {GVAR(threshold) = 0};
};