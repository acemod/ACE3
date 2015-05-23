#include "script_component.hpp"

// initialize event handlers
private "_fnc";
_fnc = {
    private ["_args","_idd","_idc"];
    _args = _this select 0;
    _idd = _args select 0;
    _idc = _args select 1;

    if (!isNull (findDisplay _idd) && GVAR(serverinit)) then {
        {
            (findDisplay _idd displayCtrl _idc) ctrlAddEventhandler _x;
        } forEach (_this select 1);

        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
};

// event handlers for each map
private "_ehs";
_ehs = [
    ["KeyDown",FUNC(KeyDown)],
    ["KeyUp",FUNC(KeyUp)],
    ["MouseButtonDown",FUNC(MouseButtonDown)],
    ["MouseButtonUp",FUNC(MouseButtonUp)],
    ["MouseMoving",{GVAR(mousepos)=[_this select 1,_this select 2];}],
    ["MouseHolding",{GVAR(mousepos)=[_this select 1,_this select 2];}],
    ["Draw",FUNC(mapDraw)]
];

{
    [_fnc,0,[_x,_ehs]] call CBA_fnc_addPerFrameHandler;
} forEach [[12,51]];
