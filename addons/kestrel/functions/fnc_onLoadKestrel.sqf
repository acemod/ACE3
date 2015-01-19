// by Falke, commy2
#include "script_component.hpp"

GVAR(windHead) = 0;

[{
    private ["_dlgKestrel", "_ctrlKestrel1", "_ctrlKestrel2", "_ctrlHUD1", "_ctrlHUD2", "_ctrlHUD3", "_ctrlHUD4"];

    disableSerialization;
    _dlgKestrel = _this select 0;
    _ctrlKestrel1 = _dlgKestrel displayCtrl 10;
    _ctrlKestrel2 = _dlgKestrel displayCtrl 11;
    _ctrlHUD1 = _dlgKestrel displayCtrl 12;
    _ctrlHUD2 = _dlgKestrel displayCtrl 13;
    _ctrlHUD3 = _dlgKestrel displayCtrl 14;
    _ctrlHUD4 = _dlgKestrel displayCtrl 15;

    private ["_wheelState", "_wheelStateAdd"];

    systemChat str diag_frameno;



    if (!GVAR(isKestrel) || {!("ACE_Kestrel" in items ACE_player)}) exitWith {
        call FUNC(closeKestrel);

        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

}, 0.01, _this select 0] call CBA_fnc_addPerFrameHandler;
