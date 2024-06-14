#include "script_component.hpp"

params ["_vehicle"];

if (_vehicle isKindOf "Helicopter") exitWith {
    [GVAR(heliSpeed), QGVAR(heliSpeed)]
};

if (_vehicle isKindOf "Plane") exitWith {
    [GVAR(planeSpeed), QGVAR(planeSpeed)]
};

if (_vehicle isKindOf "Ship") exitWith {
    [GVAR(seaSpeed), QGVAR(seaSpeed)]
};

[GVAR(landSpeed), QGVAR(landSpeed)]
