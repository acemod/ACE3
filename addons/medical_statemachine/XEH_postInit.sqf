#include "script_component.hpp"

["ace_killed", { // global event
    params ["_unit"];

    // Prevent second ragdoll of uncon units when they're killed
    if (
        IS_UNCONSCIOUS(_unit) && !isAwake _unit // uncon and not ragdolling
        && {isPlayer _unit || {_unit getVariable [QGVAR(AIUnconsciousness), GVAR(AIUnconsciousness)]}}
    ) then {
        _unit enableSimulation false;
        [{_this enableSimulation true}, _unit, 2] call CBA_fnc_waitAndExecute;
    };
}] call CBA_fnc_addEventHandler;
