#include "script_component.hpp"

// initialize event handlers
private "_fnc";
_fnc = {
    private ["_args","_idd","_idc"];
    _args = _this select 0;
    _idd = _args select 0;
    _idc = _args select 1;

    if (!isNull (findDisplay _idd)) then {
        // main map
        [(findDisplay _idd displayCtrl _idc)] call FUNC(doBFTDraw);

        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
};

[_fnc,0,[12,51]] call CBA_fnc_addPerFrameHandler;
