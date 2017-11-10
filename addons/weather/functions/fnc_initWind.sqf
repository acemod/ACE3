/*
 * Author: Ruthberg
 * Inits the wind variables on the server (on mission start)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_weather_fnc_initWind
 *
 * Public: No
 */
#include "script_component.hpp"

private _month = date select 1;
private _windDirectionProbabilities = GVAR(WindDirectionProbabilities) select (_month - 1);

GVAR(wind_direction_reference) = random 360;
private _sum = 0;
for "_i" from 0 to 7 do {
    _sum = _sum + (_windDirectionProbabilities select _i);
};
private _rand = random _sum;
private _csum = [0, 0, 0, 0, 0, 0, 0, 0];
for "_i" from 0 to 7 do {
    for "_j" from 0 to _i do {
        _csum set [_i, (_csum select _i) + (_windDirectionProbabilities select _j)];
    };
};
private _index = 0;
for "_i" from 0 to 7 do {
    if (_rand > (_csum select _i)) then {
        _index = _index + 1;
    };
};
GVAR(wind_direction_reference) = 45 * _index;

GVAR(wind_mean_dir) = GVAR(wind_direction_reference);
GVAR(wind_direction_reference) = GVAR(wind_direction_reference) + (random 22.5) - (random 22.5);
GVAR(wind_direction_reference) = (360 + GVAR(wind_direction_reference)) % 360;

GVAR(min_wind_speed) = GVAR(WindSpeedMin) select (_month - 1);
GVAR(min_wind_speed) = (GVAR(min_wind_speed) select 0) + (random (GVAR(min_wind_speed) select 1)) - (random (GVAR(min_wind_speed) select 1));
GVAR(min_wind_speed) = 0 max GVAR(min_wind_speed);
GVAR(mean_wind_speed) = GVAR(WindSpeedMean) select (_month - 1);
GVAR(max_wind_speed) = GVAR(WindSpeedMax) select (_month - 1);
GVAR(max_wind_speed) = (GVAR(max_wind_speed) select 0) + (random (GVAR(max_wind_speed) select 1)) - (random (GVAR(max_wind_speed) select 1));
GVAR(max_wind_speed) = 0 max GVAR(max_wind_speed);

GVAR(wind_upper_span) = GVAR(max_wind_speed) - GVAR(mean_wind_speed);
GVAR(wind_lower_span) = GVAR(min_wind_speed) - GVAR(mean_wind_speed);

GVAR(current_wind_direction) = GVAR(wind_direction_reference);
GVAR(next_wind_direction) = GVAR(current_wind_direction);

GVAR(current_wind_speed) = GVAR(min_wind_speed) + (GVAR(max_wind_speed) - GVAR(min_wind_speed)) * (random 1);
GVAR(next_wind_speed) = GVAR(current_wind_speed);

GVAR(last_wind_update) = 0;
GVAR(next_wind_udpate) = 0;
