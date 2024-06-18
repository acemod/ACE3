#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Run once per second in a PFH. Update screen effects with burn indicator.
 *
 * Arguments:
 * 0: Unit on fire <OBJECT>
 * 1: PFH Handle <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, _pfhID] call ace_fire_fnc_burnIndicator
 *
 * Public: No
 */

params ["_unit", "_pfhID"];

if (!alive _unit || {!(_unit call FUNC(isBurning))}) exitWith {
    _pfhID call CBA_fnc_removePerFrameHandler;

    _unit setVariable [QGVAR(burnUIPFH), nil];
};

// Don't show burn overlay if unconscious or dead
if !(_unit call EFUNC(common,isAwake)) exitWith {};

private _iteration = _unit getVariable [QGVAR(indicatorIteration), 0];

if (_iteration == 0) then {
    QGVAR(indicatorLayer) cutRsc [QGVAR(onFire1), "PLAIN"];
    _iteration = 1;
} else {
    QGVAR(indicatorLayer) cutRsc [QGVAR(onFire2), "PLAIN"];
    _iteration = 0;
};

_unit setVariable [QGVAR(indicatorIteration), _iteration];
