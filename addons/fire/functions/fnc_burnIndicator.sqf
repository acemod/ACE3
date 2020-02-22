#include "script_component.hpp"
#include "\z\ace\addons\medical_engine\script_macros_medical.hpp"
/*
 * Author: Brandon (TCVM)
 * Run once per second in a PFH. Update screen effects with burn indicator
 *
 * Arguments:
 * 0: Unit on fire <OBJECT>
 * 1: PFH Handle <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 4] call ace_fire_fnc_burnIndicator
 *
 * Public: No
 */
params ["_unit", "_pfhHandle"];
if !(IS_UNCONSCIOUS(_unit)) then {
    private _iteration = _unit getVariable [QGVAR(indicatorIteration), 0];
    if (_iteration == 0) then {
        QGVAR(indicatorLayer) cutRsc [QGVAR(onFire1), "PLAIN"];
        _iteration = 1;
    } else {
        QGVAR(indicatorLayer) cutRsc [QGVAR(onFire2), "PLAIN"];
        _iteration = 0;
    };
    _unit setVariable [QGVAR(indicatorIteration), _iteration];
};

if (!([_unit] call FUNC(isBurning)) || { !alive _unit }) then {
    [_pfhHandle] call CBA_fnc_removePerFrameHandler;
    _unit setVariable [QGVAR(burnUIPFH), -1];
};

