/*
 * Author: alganthe
 * Un-garrison a garrisoned group
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
*/

#include "script_component.hpp"

params ["_logic"];

scopeName "Main";
private _fnc_errorAndClose = {
    params ["_msg"];
    deleteVehicle _logic;
    [_msg] call EFUNC(common,displayTextStructured);
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
        [LSTRING(OnlyNonPlayer)] call _fnc_errorAndClose;
    };
};

[units _unit] call EFUNC(common,unGarrison);

deleteVehicle _logic;
