/*
 * Author: ACE2 Team
 *
 * Calculate current wind locally from the data broadcasted by the server
 *
 * Argument:
 * None
 *
 * Return value:
 * Wind <ARRAY>
 */
#include "script_component.hpp"

if (isNil "ACE_WIND_PARAMS") exitWith { [0, 0, 0] };

private ["_period", "_periodPosition", "_x", "_ratio", "_windSpeed"];

EXPLODE_8_PVT(ACE_WIND_PARAMS,_windDirection,_min_wind_speed,_max_wind_speed,_c1,_c2,_c3,_c4,_period);

_periodPosition = (time - GVAR(wind_period_start_time)) min _period;
_x = _periodPosition * 57.29577958; // time * (180 / PI)
_ratio = 0.5 + (_c1 * sin(_x/1.5) + _c2 * sin(_x/3) + _c3 * sin(_x/12) + _c4 * sin(_x/18)) / (2 * (_c1 + _c2 + _c3 + _c4));
_windSpeed = _min_wind_speed + (_max_wind_speed - _min_wind_speed) * _ratio;

//GVAR(wind_speed_debug_output) pushBack _windspeed;
//copyToClipboard Str(GVAR(wind_speed_debug_output));
/*
systemChat " ";
systemChat format["(Min/Current/Max) : (%1/%2/%3)", Round(_min_wind_speed * 10) / 10, Round(_windSpeed * 10) / 10, Round(_max_wind_speed * 10) / 10];
systemChat format["Direction: %1", Round(_windDirection)];
systemChat format["(Period/PeriodPosition) : (%1/%2)", Round(_period), Round(_periodPosition)];
systemChat format["Ratio: %1", _ratio];
systemChat " ";
*/
[-1 * sin(_windDirection) * _windSpeed, -1 * cos(_windDirection) * _windSpeed, 0]
