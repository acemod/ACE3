#include "script_component.hpp"

_map = _this select 0;

if (isNull _map) exitWith {};

// event handlers for each map
{
    _map ctrlAddEventhandler _x;
} forEach [
    ["KeyDown",FUNC(KeyDown)],
    ["KeyUp",FUNC(KeyUp)],
    ["MouseButtonDown",FUNC(MouseButtonDown)],
    ["MouseButtonUp",FUNC(MouseButtonUp)],
    ["MouseMoving",{GVAR(mousepos)=[_this select 1,_this select 2];}],
    ["MouseHolding",{GVAR(mousepos)=[_this select 1,_this select 2];}],
    ["Draw",FUNC(mapDraw)]
];