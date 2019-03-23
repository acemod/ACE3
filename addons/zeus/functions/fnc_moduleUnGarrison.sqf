#include "script_component.hpp"
/*
 * Author: alganthe
 * Un-garrison a garrisoned group.
 *
 * Arguments:
 * 0: Module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC] call ace_zeus_fnc_moduleUngarrison
 *
 * Public: No
*/

params ["_logic"];

if (!local _logic) exitWith {}; // Module is global

scopeName "Main";
private _fnc_errorAndClose = {
    params ["_msg"];
    deleteVehicle _logic;
    [_msg] call FUNC(showMessage);
    breakOut "Main";
};

private _unit = effectiveCommander (attachedTo _logic);

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
    case !(isPlayer _unit): {
        ["str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer"] call _fnc_errorAndClose;
    };
};
private _units = units _unit;

[QEGVAR(ai,unGarrison), [_units], _units] call CBA_fnc_targetEvent;

deleteVehicle _logic;
