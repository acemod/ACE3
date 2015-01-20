//#define DEBUG_MODE_FULL
#include "script_component.hpp"

ADDON = false;
LOG(MSG_INIT);

GVAR(enableRain) = false;

ace_wind_initial_dir = (random 360);

ace_wind_initial_speed = (overcast*15)+(random (overcast*5)) max 1;

ace_wind_overcast_multiplier = 1;

ace_wind_mean_speed = ace_wind_initial_speed;

ace_wind_mean_dir = ace_wind_initial_dir;

ace_wind_current_speed = ace_wind_initial_speed;

ace_wind_current_dir = ace_wind_initial_dir;

ace_wind_current_range_speed = -1+(random 2);

ace_wind_current_range_dir = -1+(random 2);

ace_wind_next_period = -1; //ceil((2+random(5))/(ace_wind_overcast_multiplier/10));

ace_wind_next_major_period = -1;

ace_wind_period_count = 0;

ace_wind_major_period_count = 0;

ace_wind_total_time = 0;

ace_wind_period_start_time = time;

ace_wind_rain_next_period = -1;

ace_wind_rain_period_count = 0;

ace_wind_rain_initial_rain = 0;
if(overcast >= 0.7) then {
	ace_wind_rain_initial_rain = (random ((overcast-0.7)/0.3));
};

ace_wind_current_rain = ace_wind_rain_initial_rain;

ace_wind_rain_current_range = -1+(random 2);

PREP(serverController);
PREP(getWind);

ADDON = true;
