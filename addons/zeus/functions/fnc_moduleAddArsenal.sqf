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

private _object = attachedTo _logic;

scopeName "Main";
private _fnc_errorAndClose = {
    params ["_msg"];
    _display closeDisplay 0;
    deleteVehicle _logic;
    [_msg] call EFUNC(common,displayTextStructured);
    breakOut "Main";
};

if !(isNull _object) then {
    switch (false) do {
        case !(isPlayer _object): {
            [LSTRING(OnlyNonPlayer)] call _fnc_errorAndClose;
        };
        case (alive _object): {
            [LSTRING(OnlyAlive)] call _fnc_errorAndClose;
        };
    };
} else {
    deleteVehicle _logic;
};

["AmmoboxInit", [_object, true]] call BIS_fnc_arsenal;
deleteVehicle _logic;
