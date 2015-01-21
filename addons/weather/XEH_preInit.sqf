//#define DEBUG_MODE_FULL
#include "script_component.hpp"

ADDON = false;
LOG(MSG_INIT);

PREP(serverController);
PREP(getWind);



// Rain variables
GVAR(enableRain) = true;
GVAR(rain_next_period) = -1;
GVAR(rain_period_count) = 0;
GVAR(rain_initial_rain) = 0;
if(overcast >= 0.7) then {
    GVAR(rain_initial_rain) = (random ((overcast-0.7)/0.3));
};
GVAR(current_rain) = GVAR(rain_initial_rain);
GVAR(rain_current_range) = -1+(random 2);
GVAR(overcast_multiplier) = 1;

// Wind Variables
ACE_wind = [0, 0, 0];
GVAR(wind_initial_dir) = (random 360);
GVAR(wind_initial_speed) = (overcast*5)+(random (overcast*5)) max 1;
GVAR(wind_mean_speed) = GVAR(wind_initial_speed);
GVAR(wind_mean_dir) = GVAR(wind_initial_dir);
GVAR(wind_current_speed) = GVAR(wind_initial_speed);
GVAR(wind_current_dir) = GVAR(wind_initial_dir);
GVAR(wind_current_range_speed) = -1+(random 2);
GVAR(wind_current_range_dir) = -1+(random 2);
GVAR(wind_next_period) = -1; //ceil((2+random(5))/(GVAR(overcast_multiplier)/10));
GVAR(wind_next_major_period) = -1;
GVAR(wind_period_count) = 0;
GVAR(wind_major_period_count) = 0;
GVAR(wind_total_time) = 0;
GVAR(wind_period_start_time) = time;

// Temperature variables
if (isNumber (configFile >> "CfgWorlds" >> worldName >> "AGM_TempMeanJan")) then {
    GVAR(TempMeanJan) = getNumber (configFile >> "CfgWorlds" >> worldName >> "ACE_TempMeanJan");
    GVAR(TempMeanJul) = getNumber (configFile >> "CfgWorlds" >> worldName >> "ACE_TempMeanJul");
    GVAR(TempAmplitudeJan) = getNumber (configFile >> "CfgWorlds" >> worldName >> "ACE_TempAmplitudeJan");
    GVAR(TempAmplitudeJul) = getNumber (configFile >> "CfgWorlds" >> worldName >> "ACE_TempAmplitudeJul");
} else {
    _lat = - getNumber (configFile >> "CfgWorlds" >> worldName >> "latitude");
    if (_lat == 0) then {_lat = 0.1;};
    _yearlyTempMean = 28 min (28 - (abs(_lat) - 23.5) * (3.14159/180) * 6371 / 145);
    GVAR(TempMeanJan) = _yearlyTempMean - _lat / abs(_lat) * ((abs(_lat) max 25) - 25) * 30 / 65;
    GVAR(TempMeanJul) = _yearlyTempMean + _lat / abs(_lat) * ((abs(_lat) max 25) - 25) * 30 / 65;
    GVAR(TempAmplitudeJan) = 10;
    GVAR(TempAmplitudeJul) = 10;
};

ADDON = true;
