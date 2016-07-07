

#include "script_component.hpp"

params ["_unit"];

private _reviveVal = _unit getVariable [QGVAR(enableRevive), GVAR(enableRevive)];
if (_reviveVal == 1 && {[_unit] call EFUNC(common,isPlayer)} || _reviveVal == 2) then {
    if (_unit getVariable [QGVAR(inReviveState), false]) exitWith {
        // Error, already in revive state
        false;
    };

    private _lifesLeft = _unit getVariable[QGVAR(amountOfReviveLives), GVAR(amountOfReviveLives)];
    if (GVAR(amountOfReviveLives) > 0 && _lifesLeft == 0) exitWith {
        [_unit, "NoLives", []] call FUNC(stateEvent);
    };

    _unit setVariable [QGVAR(inReviveState), true, true];
    _unit setVariable [QGVAR(reviveStartTime), CBA_missionTime];
    [_unit, true] call FUNC(setUnconscious);
} else {
    [_unit, "NoLives", []] call FUNC(stateEvent);
};
