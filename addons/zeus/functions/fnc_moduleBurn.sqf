#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Inflames a unit.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC] call ace_zeus_fnc_moduleBurn
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
    case (["ace_fire"] call EFUNC(common,isModLoaded)): {
        [LSTRING(RequiresAddon)] call _fnc_errorAndClose;
    };
};

[QEGVAR(fire,burn), [_unit, 5]] call CBA_fnc_globalEvent;

deleteVehicle _logic;
