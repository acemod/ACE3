#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Measures the wind speed, stores the information in GVAR(MeasuredWindSpeed) and updates GVAR(ImpellerState)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * wind speed <NUMBER>
 *
 * Example:
 * call ace_kestrel4500_fnc_measureWindSpeed
 *
 * Public: No
 */

private _playerDir = getDir ACE_player;
private _windSpeed = vectorMagnitude wind;
private _windDir = (wind select 0) atan2 (wind select 1);
if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    // With wind gradient
    _windSpeed = [eyePos ACE_player, true, true, true] call EFUNC(weather,calculateWindSpeed);
    _windSpeed = abs(cos(_playerDir - _windDir)) * _windSpeed;
} else {
    // Without wind gradient
    _windSpeed = [eyePos ACE_player, false, true, true] call EFUNC(weather,calculateWindSpeed);
};

if (_windSpeed > 0.3 || {GVAR(MeasuredWindSpeed) > 0.1 && _windSpeed > 0.125}) then {
   GVAR(MeasuredWindSpeed) = _windSpeed;
} else {
    GVAR(MeasuredWindSpeed) = GVAR(MeasuredWindSpeed) * 0.99;
    if (GVAR(MeasuredWindSpeed) < 0.05) then {
        GVAR(MeasuredWindSpeed) = 0;
    };
};

GVAR(MeasuredWindSpeed)
