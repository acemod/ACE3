/*
 * Author: alganthe
 * Add a full arsenal to an object
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

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
        TRACE_1("BIS_fnc_arsenal: AmmoboxInit",_object);
        // Global Effects: "Action to access the Arsenal will be added automatically on all clients."
        ["AmmoboxInit", [_object, true]] call BIS_fnc_arsenal;
    };
};

deleteVehicle _logic;
