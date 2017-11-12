/*
 * Author: ACE2 Team, Ruthberg
 * Smoothly updates wind on the server (based on time of year and map data)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_weather_fnc_updateWind
 *
 * Public: No
 */
#include "script_component.hpp"

private _speed = linearConversion [GVAR(last_wind_update), GVAR(next_wind_udpate), CBA_missionTime, GVAR(current_wind_speed), GVAR(next_wind_speed), true];
private _direction = linearConversion [GVAR(last_wind_update), GVAR(next_wind_udpate), CBA_missionTime, GVAR(current_wind_direction), GVAR(next_wind_direction), true];

setWind [-_speed * sin(_direction), -_speed * cos(_direction), true];
