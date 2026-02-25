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


[QEGVAR(medical,activateMedical), { // should be called where unit is local
    params ["_unit"];
    _unit setVariable [VAR_MEDICAL_ACTIVITY, true, true];
    TRACE_2("activating medical",_unit,typeOf _unit);
    // Because vitals loop has never run, set to 1 second ago to avoid large time delta (would hit max of 10 seconds)
    if (_unit isNil QEGVAR(medical_vitals,lastTimeUpdated)) then {
        _unit setVariable [QEGVAR(medical_vitals,lastTimeUpdated), CBA_missionTime - 1];
    };
}] call CBA_fnc_addEventHandler;
[QEGVAR(medical,woundReceived), {
    params ["_unit"];
    if (!IS_MEDICAL_ACTIVITY(_unit)) then {
        [QEGVAR(medical,activateMedical), _unit] call CBA_fnc_localEvent;
    };
}] call CBA_fnc_addEventHandler;
["ace_treatmentStarted", {
    params ["", "_patient"];
    if (!IS_MEDICAL_ACTIVITY(_patient)) then {
        [QEGVAR(medical,activateMedical), _patient, _patient] call CBA_fnc_targetEvent;
    };
}] call CBA_fnc_addEventHandler;
