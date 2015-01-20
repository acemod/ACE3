// by Falke, commy2
#include "script_component.hpp"

GVAR(windHead) = 0;
GVAR(wheelState) = 1;

[{

    if (!GVAR(isKestrelWheel)) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    private ["_dlgKestrelWheel", "_ctrlKestrelWheel"];

    disableSerialization;
    _dlgKestrelWheel = _this select 0;
    _ctrlKestrelWheel = _dlgKestrelWheel displayCtrl 1;

    _ctrlKestrelWheel ctrlShow (cameraView != "GUNNER");

    private ["_wheelState", "_wheelStateAdd"];

    _wheelState = GVAR(wheelState);
    _wheelStateAdd = ((round GVAR(windHead) * 2) min 5) max -5;

    _wheelState = _wheelState + _wheelStateAdd;

    if (_wheelState < 0) then {_wheelState = _wheelState + 9};
    if (_wheelState > 9) then {_wheelState = _wheelState - 9};

    GVAR(wheelState) = _wheelState;

    if (preloadTitleRsc ["ACE_Kestrel_Preload", "PLAIN"]) then {

        private "_brightness";
        _brightness = call EFUNC(common,ambientBrightness);

        _ctrlKestrelWheel ctrlSetText format [QUOTE(PATHTOF(data\kestrel_%1.paa)), _wheelState];
        _ctrlKestrelWheel ctrlSetTextColor [_brightness, _brightness, _brightness, 1];

    };

}, 0.01, _this select 0] call CBA_fnc_addPerFrameHandler;
