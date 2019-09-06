#include "script_component.hpp"
/*
 * Author: alganthe
 * Add a full ACE Arsenal to an object
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_logic"];
if (!local _logic) exitWith {};

private _object = attachedTo _logic;
TRACE_3("moduleAddArsenal",_logic,_object,typeOf _object);

switch (true) do {
    case (isNull _object): {
        [LSTRING(NothingSelected)] call FUNC(showMessage);
    };
    case (isPlayer _object): {
        ["str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer"] call FUNC(showMessage);
    };
    case (!alive _object): {
        [LSTRING(OnlyAlive)] call FUNC(showMessage);
    };
    default {
        [_object, true] call EFUNC(arsenal,removeBox);
        [_object, true, true] call EFUNC(arsenal,initBox);
    };
};

deleteVehicle _logic;
