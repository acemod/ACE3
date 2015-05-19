/*
 * Author: Ruthberg
 *
 * Displays a wind info (colored arrow) in the top left corner of the screen
 *
 * Argument:
 * None
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

#define __dsp (uiNamespace getVariable "RscWindIntuitive")
#define __ctrl (__dsp displayCtrl 132948)

if (GVAR(WindInfo)) exitWith {
    GVAR(WindInfo) = false;
    0 cutText ["", "PLAIN"];
    true
};
if (underwater ACE_player) exitWith { false };
if (vehicle ACE_player != ACE_player) exitWith { false };

2 cutText ["", "PLAIN"];
EGVAR(advanced_ballistics,Protractor) = false;
1 cutText ["", "PLAIN"];
GVAR(WindInfo) = true;

[{
    private ["_windSpeed", "_windDir", "_playerDir", "_windIndex", "_windColor", "_windScale"];

    if !(GVAR(WindInfo) && !(underwater ACE_player) && vehicle ACE_player == ACE_player) exitWith {
        GVAR(WindInfo) = false;
        0 cutText ["", "PLAIN"];
        [_this select 1] call cba_fnc_removePerFrameHandler;
    };

    _windIndex = 12;
    _windScale = 0.75;
    _windColor = [1, 1, 1, 1];
    _windSpeed = if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
        // With wind gradient
        [eyePos ACE_player, true, true, true] call FUNC(calculateWindSpeed);
    } else {
        // Without wind gradient
        [eyePos ACE_player, false, true, true] call FUNC(calculateWindSpeed);
    };
    
    if (_windSpeed > 0.2) then {
        _playerDir = getDir ACE_player;
        _windDir = (ACE_wind select 0) atan2 (ACE_wind select 1);
        _windIndex = round(((_playerDir - _windDir + 360) % 360) / 30);
        _windIndex = _windIndex % 12;
    };

    // Color Codes from https://en.wikipedia.org/wiki/Beaufort_scale#Modern_scale
    if (_windSpeed > 0.3) then { _windColor = [0.796, 1, 1, 1]; };
    if (_windSpeed > 1.5) then { _windColor = [0.596, 0.996, 0.796, 1]; };
    if (_windSpeed > 3.3) then { _windColor = [0.596, 0.996, 0.596, 1]; };
    if (_windSpeed > 5.4) then { _windColor = [0.6, 0.996, 0.4, 1]; };
    if (_windSpeed > 7.9) then { _windColor = [0.6, 0.996, 0.047, 1]; };
    if (_windSpeed > 10.7) then { _windColor = [0.8, 0.996, 0.059, 1]; };
    if (_windSpeed > 13.8) then { _windColor = [1, 0.996, 0.067, 1]; };
    if (_windSpeed > 17.1) then { _windColor = [1, 0.796, 0.051, 1]; };
    if (_windSpeed > 20.7) then { _windColor = [1, 0.596, 0.039, 1]; };
    if (_windSpeed > 24.4) then { _windColor = [1, 0.404, 0.031, 1]; };
    if (_windSpeed > 28.4) then { _windColor = [1, 0.22, 0.027, 1]; };
    if (_windSpeed > 32.6) then { _windColor = [1, 0.078, 0.027, 1]; };
    
    if (GVAR(scaleWindArrow)) then {
        if (_windSpeed > 0.3) then { _windScale = 0.75; };
        if (_windSpeed > 1.5) then { _windScale = 0.80; };
        if (_windSpeed > 3.3) then { _windScale = 0.85; };
        if (_windSpeed > 5.4) then { _windScale = 0.90; };
        if (_windSpeed > 7.9) then { _windScale = 0.95; };
        if (_windSpeed > 10.7) then { _windScale = 1.00; };
        if (_windSpeed > 13.8) then { _windScale = 1.05; };
        if (_windSpeed > 17.1) then { _windScale = 1.10; };
        if (_windSpeed > 20.7) then { _windScale = 1.15; };
        if (_windSpeed > 24.4) then { _windScale = 1.20; };
        if (_windSpeed > 28.4) then { _windScale = 1.25; };
        if (_windSpeed > 32.6) then { _windScale = 1.30; };
    };
    
    0 cutRsc ["RscWindIntuitive", "PLAIN", 1, false];

    __ctrl ctrlSetScale _windScale;
    __ctrl ctrlCommit 0;

    __ctrl ctrlSetText format[QUOTE(PATHTOF(UI\wind%1.paa)), _windIndex];
    __ctrl ctrlSetTextColor _windColor;

}, 0.5, []] call CBA_fnc_addPerFrameHandler;

true
