#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Calculates and applies final sway coefficient from sway factors
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_common_fnc_swayLoop
 *
 * Public: No
*/

private _baseline = 1;
if (GVAR(swayFactorsBaseline) isNotEqualTo []) then {
    _baseline = 1 max ([missionNamespace, "ACE_setCustomAimCoef_baseline", "max"] call FUNC(arithmeticGetResult));
};

private _multiplier = 1;
if (GVAR(swayFactorsMultiplier) isNotEqualTo []) then {
    _multiplier = [missionNamespace, "ACE_setCustomAimCoef_multiplier", "product"] call FUNC(arithmeticGetResult);
};

ACE_player setCustomAimCoef (_baseline * _multiplier);

[FUNC(swayLoop), [], 0.5] call CBA_fnc_waitAndExecute
