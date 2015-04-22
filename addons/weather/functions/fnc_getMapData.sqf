/*
 * Author: Ruthberg, esteldunedain
 *
 * Get the weather data for the current map
 *
 * Argument:
 * None
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

GVAR(Altitude) = getNumber(configFile >> "CfgWorlds" >> worldName >> "elevationOffset");
GVAR(Latitude) = getNumber(configFile >> "CfgWorlds" >> worldName >> "latitude");

if (worldName in ["Chernarus", "Bootcamp_ACR", "Woodland_ACR", "utes"]) then { GVAR(Latitude) = 50; GVAR(Altitude) = 0; };
if (worldName in ["Altis", "Stratis"]) then { GVAR(Latitude) = 40; GVAR(Altitude) = 0; };
if (worldName in ["Takistan", "Zargabad", "Mountains_ACR"]) then { GVAR(Latitude) = 35; GVAR(Altitude) = 2000; };
if (worldName in ["Shapur_BAF", "ProvingGrounds_PMC"]) then { GVAR(Latitude) = 35; GVAR(Altitude) = 100; };
if (worldName in ["fallujah"]) then { GVAR(Latitude) = 33; GVAR(Altitude) = 0; };
if (worldName in ["fata", "Abbottabad"]) then { GVAR(Latitude) = 30; GVAR(Altitude) = 1000; };
if (worldName in ["sfp_wamako"]) then { GVAR(Latitude) = 14; GVAR(Altitude) = 0; };
if (worldName in ["sfp_sturko"]) then { GVAR(Latitude) = 56; GVAR(Altitude) = 0; };
if (worldName in ["Bornholm"]) then { GVAR(Latitude) = 55; GVAR(Altitude) = 0; };
if (worldName in ["Imrali"]) then { GVAR(Latitude) = 40; GVAR(Altitude) = 0; };
if (worldName in ["Caribou"]) then { GVAR(Latitude) = 68; GVAR(Altitude) = 0; };
if (worldName in ["Namalsk"]) then { GVAR(Latitude) = 65; GVAR(Altitude) = 0; };
if (worldName in ["MCN_Aliabad"]) then { GVAR(Latitude) = 36; GVAR(Altitude) = 0; };
if (worldName in ["Clafghan"]) then { GVAR(Latitude) = 34; GVAR(Altitude) = 640; };
if (worldName in ["Sangin", "hellskitchen"]) then { GVAR(Latitude) = 32; GVAR(Altitude) = 0; };
if (worldName in ["Sara"]) then { GVAR(Latitude) = 40; GVAR(Altitude) = 0; };
if (worldName in ["reshmaan"]) then { GVAR(Latitude) = 35; GVAR(Altitude) = 2000; };
if (worldName in ["Thirsk"]) then { GVAR(Latitude) = 65; GVAR(Altitude) = 0; };
if (worldName in ["lingor"]) then { GVAR(Latitude) = -4; GVAR(Altitude) = 0; };
if (worldName in ["Panthera3"]) then { GVAR(Latitude) = 46; GVAR(Altitude) = 0; };

// Assume default wind values
// Source: https://weatherspark.com/averages/32194/Lemnos-Limnos-North-Aegean-Islands-Greece
GVAR(WindSpeedMax)  = [[8.8, 5.5], [8.8, 5], [8.6, 4.8], [7.6, 3.4], [7.0, 3.0], [7.1, 3.0], [7.5, 3.1], [8.0, 3.2], [7.6, 3.5], [7.8, 4.6], [7.9, 5.0], [8.2, 5.5]];
GVAR(WindSpeedMean) = [4.8, 4.9, 4.6, 4.1, 3.5, 3.5, 4.3, 4.4, 4.1, 4.5, 4.5, 5.0];
GVAR(WindSpeedMin)  = [[0.2, 5.0], [0.1, 5.0], [0.2, 4.3], [0.0, 3.0], [0.0, 2.1], [0.0, 2.0], [0.1, 3.1], [0.3, 3.1], [0.0, 3.6], [0.0, 4.2], [0.1, 5.0], [0.2, 5.5]];
GVAR(WindDirectionProbabilities) = [[0.06, 0.32, 0.05, 0.04, 0.15, 0.06, 0.02, 0.02], // January
                                    [0.08, 0.32, 0.04, 0.04, 0.18, 0.06, 0.02, 0.02], // February
                                    [0.09, 0.30, 0.04, 0.04, 0.20, 0.06, 0.02, 0.03], // March
                                    [0.10, 0.25, 0.03, 0.04, 0.22, 0.06, 0.02, 0.04], // April
                                    [0.18, 0.25, 0.03, 0.04, 0.18, 0.04, 0.01, 0.05], // May
                                    [0.25, 0.25, 0.03, 0.03, 0.15, 0.03, 0.00, 0.08], // June
                                    [0.32, 0.30, 0.02, 0.02, 0.10, 0.01, 0.00, 0.09], // July
                                    [0.28, 0.35, 0.02, 0.01, 0.08, 0.01, 0.00, 0.08], // August
                                    [0.20, 0.37, 0.03, 0.01, 0.11, 0.01, 0.01, 0.05], // September
                                    [0.10, 0.39, 0.04, 0.02, 0.15, 0.02, 0.01, 0.03], // October
                                    [0.08, 0.38, 0.06, 0.04, 0.19, 0.03, 0.02, 0.02], // November
                                    [0.06, 0.37, 0.05, 0.03, 0.18, 0.04, 0.02, 0.02]];// December
                                    
// Check if the wind data is defined in the map config
if (isArray (configFile >> "CfgWorlds" >> worldName >> "ACE_WindSpeedMean")) then {                     
    GVAR(WindSpeedMin)               = getArray (configFile >> "CfgWorlds" >> worldName >> "ACE_WindSpeedMin");
    GVAR(WindSpeedMean)              = getArray (configFile >> "CfgWorlds" >> worldName >> "ACE_WindSpeedMean");
    GVAR(WindSpeedMax)               = getArray (configFile >> "CfgWorlds" >> worldName >> "ACE_WindSpeedMax");
    GVAR(WindDirectionProbabilities) = getArray (configFile >> "CfgWorlds" >> worldName >> "ACE_WindDirectionProbabilities");
};

// Check if the weather data is defined in the map config
if (isArray (configFile >> "CfgWorlds" >> worldName >> "ACE_TempDay")) exitWith {
    GVAR(TempDay)   = getArray (configFile >> "CfgWorlds" >> worldName >> "ACE_TempDay");
    GVAR(TempNight) = getArray (configFile >> "CfgWorlds" >> worldName >> "ACE_TempNight");
    GVAR(Humidity)  = getArray (configFile >> "CfgWorlds" >> worldName >> "ACE_Humidity");
};

// Check if the map is among the most popular
if (toLower worldName in ["chernarus", "bootcamp_acr", "woodland_acr", "utes"]) then {
    // Source: http://www.iten-online.ch/klima/europa/tschechien/prag.htm
    GVAR(TempDay) = [1, 3, 9, 14, 19, 23, 25, 24, 21, 13, 7, 2];
    GVAR(TempNight) = [-4, -3, 0, 4, 9, 12, 14, 14, 10, 6, 2, -2];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Prague,Czech-Republic
    GVAR(Humidity) = [82, 80, 78, 70, 71, 72, 70, 73, 78, 80, 83, 82];
};

if (toLower worldName in ["takistan", "zargabad", "mountains_acr", "shapur_baf", "provinggrounds_pmc"]) exitWith {
    // Source: http://www.iten-online.ch/klima/asien/afghanistan/kabul.htm
    GVAR(TempDay) = [4.5, 5.5, 12.5, 19.2, 24.4, 30.2, 32.1, 32, 28.5, 22.4, 15, 8.3];
    GVAR(TempNight) = [-7.1, -5.7, 0.7, 6, 8.8, 12.4, 15.3, 14.3, 9.4, 3.9, -1.2, -4.7];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Kabul,Afghanistan
    GVAR(Humidity) = [68, 69, 62, 60, 49, 37, 38, 39, 40, 41, 56, 61];
};

if (toLower worldName in ["fallujah"]) exitWith {
    // Source: http://www.iten-online.ch/klima/asien/irak/bagdad.htm
    GVAR(TempDay) = [16, 19, 23, 29, 36, 41, 43, 43, 40, 33, 24, 17];
    GVAR(TempNight) = [4, 6, 10, 15, 20, 23, 25, 25, 21, 16, 10, 5];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Bagdad,Iraq
    GVAR(Humidity) = [69, 60, 55, 50, 36, 23, 21, 22, 29, 38, 58, 68];
};

if (toLower worldName in ["fata", "Abbottabad"]) exitWith {
     // Source: http://www.iten-online.ch/klima/asien/pakistan/zhob.htm
    GVAR(TempDay) = [12.4, 15.8, 20.8, 26.9, 32.8, 37, 36.8, 35.9, 33.8, 28.2, 22.2, 16.2];
    GVAR(TempNight) = [-0.6, 2.4, 7.4, 13.1, 18.2, 22.8, 23.8, 22.9, 19.2, 12, 5.6, 1.2];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Zhob,Pakistan
    GVAR(Humidity) = [50, 40, 42, 40, 30, 30, 50, 49, 40, 32, 38, 41];
};

if (worldName in ["sfp_wamako"]) exitWith {
     // Source: http://www.iten-online.ch/klima/afrika/niger/tahoua.htm
    GVAR(TempDay) = [33.4, 35, 38.4, 41.5, 41.4, 40, 35.6, 32.9, 35.8, 38.2, 36.4, 33.1];
    GVAR(TempNight) = [14.9, 16.3, 20.4, 23.7, 25.8, 24.8, 23.1, 22, 22.6, 21.6, 18.6, 15.3];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Tahoua,Niger
    GVAR(Humidity) = [68, 60, 57, 50, 32, 22, 20, 21, 25, 38, 58, 69];
};

if (worldName in ["sfp_sturko"]) exitWith {
     // Source: http://www.iten-online.ch/klima/afrika/niger/tahoua.htm
    GVAR(TempDay) = [2.2, 2.4, 5.1, 10.2, 16.1, 20.1, 21.1, 20.9, 17.2, 12.7, 7.4, 3.9];
    GVAR(TempNight) = [-2, -2.3, -0.7, 2.6, 7.1, 11.4, 13.1, 12.7, 10, 6.9, 3.1, -0.1];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,karlskrona,Sweden
    GVAR(Humidity) = [86, 85, 80, 72, 68, 69, 74, 77, 79, 81, 86, 88];
};

if (worldName in ["Bornholm"]) exitWith {
     // Source: http://www.iten-online.ch/klima/afrika/niger/tahoua.htm
    GVAR(TempDay) = [1.9, 1.7, 3.8, 8.1, 14, 18.1, 19.6, 19.8, 16.2, 11.9, 7.3, 3.9];
    GVAR(TempNight) = [-1.6, -2.1, -0.7, 1.7, 6.2, 10.7, 13, 13.1, 10.6, 7.2, 3.5, 0.1];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,allinge,Denmark
    GVAR(Humidity) = [85, 84, 80, 76, 69, 69, 76, 77, 79, 81, 86, 86];
};
if (worldName in ["Imrali"]) exitWith {
     // Source: http://www.iten-online.ch/klima/europa/tuerkei/bursa.htm
    GVAR(TempDay) = [9.3, 10.7, 13.6, 18.8, 23.5, 28.2, 30.3, 30.2, 27, 21.4, 16.5, 11.8];
    GVAR(TempNight) = [1.4, 2.4, 3.7, 7.1, 10.9, 14.3, 16.5, 16.3, 13, 9.5, 6, 3.8];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Bursa,Turkey
    GVAR(Humidity) = [78, 75, 70, 70, 71, 61, 58, 59, 63, 69, 77, 76];
};

// Assume default values
GVAR(TempDay) = [1, 3, 9, 14, 19, 23, 25, 24, 21, 13, 7, 2];
GVAR(TempNight) = [-4, -3, 0, 4, 9, 12, 14, 14, 10, 6, 2, -2];
GVAR(Humidity) = [82, 80, 78, 70, 71, 72, 70, 73, 78, 80, 83, 82];

GVAR(currentTemperature) = 20;
GVAR(currentHumidity) = 0.5;