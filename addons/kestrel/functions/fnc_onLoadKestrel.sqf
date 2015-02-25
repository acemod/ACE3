// by Falke, commy2
#include "script_component.hpp"

GVAR(windHead) = 0;
GVAR(wheelState) = 1;

[{

    // exit loop
    if (!GVAR(isKestrel) || {!("ACE_Kestrel" in items ACE_player)}) exitWith {
        call FUNC(closeKestrel);

        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    // get controls
    private ["_dlgKestrel", "_ctrlKestrel1", "_ctrlKestrelWheel", "_ctrlKestrel2", "_ctrlHUD1", "_ctrlHUD2", "_ctrlHUD3", "_ctrlHUD4"];

    disableSerialization;
    _dlgKestrel = _this select 0;
    _ctrlKestrel1 = _dlgKestrel displayCtrl 1;
    _ctrlKestrel2 = _dlgKestrel displayCtrl 2;
    _ctrlKestrelWheel = _dlgKestrel displayCtrl 3;
    _ctrlHUD1 = _dlgKestrel displayCtrl 11;
    _ctrlHUD2 = _dlgKestrel displayCtrl 12;
    _ctrlHUD3 = _dlgKestrel displayCtrl 13;
    _ctrlHUD4 = _dlgKestrel displayCtrl 14;

    // don't show the kestrel in gunner view
    private "_show";
    _show = cameraView != "GUNNER";

    _ctrlKestrel1 ctrlShow _show;
    _ctrlKestrel2 ctrlShow _show;
    _ctrlKestrelWheel ctrlShow _show;
    _ctrlHUD1 ctrlShow _show;
    _ctrlHUD2 ctrlShow _show;
    _ctrlHUD3 ctrlShow _show;
    _ctrlHUD4 ctrlShow _show;

    if !(_show) exitWith {};

    // handle shown values
    private ["_position", "_directon", "_windC", "_windD", "_windR", "_windB", "_windA"];

    _position = eyePos ACE_player;
    _directon = direction ACE_player;

    _windC = sqrt ((wind select 0) ^ 2 + (wind select 1) ^ 2);
    _windD = (wind select 0) atan2 (wind select 1);

    _windR = _directon - _windD;

    if (_windR < 0) then {
        _windR = _windR + 360;
    };

    _windB = _windC * sin _windR;
    _windA = sqrt (_windC ^ 2 - _windB ^ 2);

    if (_windR < 90) then {
        _windA = _windA - 2 * _windA;
    };

    if (_windR > 270) then {
        _windA = _windA - 2 * _windA;
    };

    // in building
    _intersects = 0;
    if (lineIntersects [_position, _position vectorAdd [0, 0, 15]]) then {_intersects = _intersects + 1};

    if (lineIntersects [_position, _position vectorAdd [- 15 * sin  windDir,        - 15 * cos  windDir,        0]]) then {_intersects = _intersects + 1};
    if (lineIntersects [_position, _position vectorAdd [- 15 * sin (windDir - 90),  - 15 * cos (windDir - 90),  0]]) then {_intersects = _intersects + 1};
    if (lineIntersects [_position, _position vectorAdd [- 15 * sin (windDir + 90),  - 15 * cos (windDir + 90),  0]]) then {_intersects = _intersects + 1};
    if (lineIntersects [_position, _position vectorAdd [- 15 * sin (windDir + 180), - 15 * cos (windDir + 180), 0]]) then {_intersects = _intersects + 1};

    if (_intersects > 3) then {
        _windA = 99.99;
        _windB = 99.99;
    };

    // in wind direction
    _intersects = 0;
    if (lineIntersects [_position, _position vectorAdd [- 5 * sin  windDir,       - 5 * cos  windDir,       0]]) then {_intersects = _intersects + 1};
    if (lineIntersects [_position, _position vectorAdd [- 5 * sin (windDir - 15), - 5 * cos (windDir - 15), 0]]) then {_intersects = _intersects + 1};
    if (lineIntersects [_position, _position vectorAdd [- 5 * sin (windDir + 15), - 5 * cos (windDir + 15), 0]]) then {_intersects = _intersects + 1};

    if (_intersects > 2) then {
        _windA = 99.99;
        _windB = 99.99;
    };

    if (ACE_player != vehicle ACE_player) then {
        _windA = 99.99;
        _windB = 99.99;
    };

    if (_windA == 99.99) then {

        GVAR(windHead) = 0;

        _windA = "0.00";
        _windB = "0.00";

    } else {

        GVAR(windHead) = _windA;

        if (_windA < 0) then {
            _windA = format ["-%1", [-1 * _windA, 1, 2] call CBA_fnc_formatNumber];
        } else {
            _windA = format [ "%1", [     _windA, 1, 2] call CBA_fnc_formatNumber];
        };

        if (_windB < 0) then {
            _windB = format ["-%1", [-1 * _windB, 1, 2] call CBA_fnc_formatNumber];
        } else {
            _windB = format [ "%1", [     _windB, 1, 2] call CBA_fnc_formatNumber];
        };

    };

    _directon = round _directon;
    if (_directon == 360) then {_directon = 0};

    _ctrlHUD1 ctrlSetText _windA;
    _ctrlHUD2 ctrlSetText _windB;
    _ctrlHUD3 ctrlSetText str _directon;
    _ctrlHUD4 ctrlSetText str ((round (EGVAR(weather,currentTemperature) * 10)) / 10);

    // adjust kestrel picture in the dark
    private "_brightness";
    _brightness = call EFUNC(common,ambientBrightness);

    _ctrlKestrel2 ctrlSetTextColor [0, 0, 0, 1 - _brightness];

    // handle wheel
    private ["_wheelState", "_wheelStateAdd"];

    _wheelState = GVAR(wheelState);
    _wheelStateAdd = ((round GVAR(windHead) * 2) min 5) max -5;

    _wheelState = _wheelState + _wheelStateAdd;

    if (_wheelState < 0) then {_wheelState = _wheelState + 9};
    if (_wheelState > 9) then {_wheelState = _wheelState - 9};

    GVAR(wheelState) = _wheelState;

    if (preloadTitleRsc ["ACE_Kestrel_Preload", "PLAIN"]) then {
        _ctrlKestrelWheel ctrlSetText format [QUOTE(PATHTOF(data\kestrel_%1.paa)), _wheelState];
        _ctrlKestrelWheel ctrlSetTextColor [_brightness, _brightness, _brightness, 1];
    };

}, 0.01, _this select 0] call CBA_fnc_addPerFrameHandler;
