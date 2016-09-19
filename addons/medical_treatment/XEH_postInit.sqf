
#include "script_component.hpp"

[QEGVAR(medical,initialized), {
    params ["_unit"];
    _unit call FUNC(checkItems);
}] call CBA_fnc_addEventHandler;

[QGVAR(createLitterServer), FUNC(litterHandleCreate)] call CBA_fnc_addEventHandler;
