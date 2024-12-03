#include "..\script_component.hpp"
/*
 * Author: mharis001
 * Full heal unit.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC] call ace_zeus_fnc_moduleHeal
 *
 * Public: No
 */

params ["_logic"];

if !(local _logic) exitWith {};

private _unit = attachedTo _logic;

// Validate module target
scopeName "Main";
private _fnc_errorAndClose = {
    params ["_msg"];
    deleteVehicle _logic;
    [_msg] call FUNC(showMessage);
    breakOut "Main";
};

switch (false) do {
    case !(isNull _unit): {
        [LSTRING(NothingSelected)] call _fnc_errorAndClose;
    };
    case (_unit isKindOf "CAManBase"): {
        [LSTRING(OnlyInfantry)] call _fnc_errorAndClose;
    };
    case (alive _unit): {
        [LSTRING(OnlyAlive)] call _fnc_errorAndClose;
    };
};

// Heal validated target
if (GETEGVAR(medical,enabled,false)) then {
    TRACE_1("healing with ace_medical",_unit);
    [QEGVAR(medical_treatment,fullHealLocal), [_unit], _unit] call CBA_fnc_targetEvent;
} else {
    // BI's scripted revive system
    if ((missionNamespace getVariable ["bis_revive_mode", 0]) != 0) then {
        ["#rev", 1, _unit] call BIS_fnc_reviveOnState;
        _unit setVariable ["#rev", 1, true];
    } else {
        _unit setDamage 0;
    };
};

deleteVehicle _logic;
