#include "script_component.hpp"

params ["_vehicle"];

if (_vehicle isKindOf "Helicopter") exitWith {
    [GVAR(heliAlt), QGVAR(heliAlt)]
};

[GVAR(planeAlt), QGVAR(planeAlt)]
