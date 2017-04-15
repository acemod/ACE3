/*
 * Author: Ruthberg, esteldunedain
 * Get the weather data for the current map
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_weather_fnc_getMapData
 *
 * Public: No
 */
#include "script_component.hpp"

private _worldName = toLower worldName;
TRACE_1("getting map data",_worldName);

// Set default values

// Source: https://weatherspark.com/averages/32194/Lemnos-Limnos-North-Aegean-Islands-Greece
GVAR(WindSpeedMax) = [[8.8, 5.5], [8.8, 5], [8.6, 4.8], [7.6, 3.4], [7.0, 3.0], [7.1, 3.0], [7.5, 3.1], [8.0, 3.2], [7.6, 3.5], [7.8, 4.6], [7.9, 5.0], [8.2, 5.5]];
GVAR(WindSpeedMean) = [4.8, 4.9, 4.6, 4.1, 3.5, 3.5, 4.3, 4.4, 4.1, 4.5, 4.5, 5.0];
GVAR(WindSpeedMin) = [[0.2, 5.0], [0.1, 5.0], [0.2, 4.3], [0.0, 3.0], [0.0, 2.1], [0.0, 2.0], [0.1, 3.1], [0.3, 3.1], [0.0, 3.6], [0.0, 4.2], [0.1, 5.0], [0.2, 5.5]];
GVAR(WindDirectionProbabilities) = [
    [0.06, 0.32, 0.05, 0.04, 0.15, 0.06, 0.02, 0.02], // January
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
    [0.06, 0.37, 0.05, 0.03, 0.18, 0.04, 0.02, 0.02]  // December
];

GVAR(TempDay) = [1, 3, 9, 14, 19, 23, 25, 24, 21, 13, 7, 2];
GVAR(TempNight) = [-4, -3, 0, 4, 9, 12, 14, 14, 10, 6, 2, -2];
GVAR(Humidity) = [82, 80, 78, 70, 71, 72, 70, 73, 78, 80, 83, 82];

GVAR(currentTemperature) = 20;
GVAR(currentHumidity) = 0.5;

// Get all non inherited arrays to filter maps that inherit from Stratis/Altis/Tanoa
private _nonInheritedArrays = configProperties [configFile >> "CfgWorlds" >> _worldName, "isArray _x", false];
// And check if any custom non-inherited weather is defined through config and use that if so
if ((configFile >> "CfgWorlds" >> _worldName >> "ACE_TempDay") in _nonInheritedArrays) exitWith {
    if (isArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_TempDay")) then {
        GVAR(TempDay) = getArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_TempDay");
    };
    if (isArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_TempNight")) then {
        GVAR(TempNight) = getArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_TempNight");
    };
    if (isArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_Humidity")) then {
        GVAR(Humidity) = getArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_Humidity");
    };
    if (isArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_WindSpeedMin")) then {
        GVAR(WindSpeedMin) = getArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_WindSpeedMin");
    };
    if (isArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_WindSpeedMean")) then {
        GVAR(WindSpeedMean) = getArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_WindSpeedMean");
    };
    if (isArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_WindSpeedMax")) then {
        GVAR(WindSpeedMax) = getArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_WindSpeedMax");
    };
    if (isArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_WindDirectionProbabilities")) then {
        GVAR(WindDirectionProbabilities) = getArray (configFile >> "CfgWorlds" >> _worldName >> "ACE_WindDirectionProbabilities");
    };
};

// Check if the map is among the most popular
if (_worldName in ["chernarus", "bootcamp_acr", "woodland_acr", "utes"]) then {
    // Source: http://www.iten-online.ch/klima/europa/tschechien/prag.htm
    GVAR(TempDay) = [1, 3, 9, 14, 19, 23, 25, 24, 21, 13, 7, 2];
    GVAR(TempNight) = [-4, -3, 0, 4, 9, 12, 14, 14, 10, 6, 2, -2];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Prague,Czech-Republic
    GVAR(Humidity) = [82, 80, 78, 70, 71, 72, 70, 73, 78, 80, 83, 82];

    // Source: https://weatherspark.com/averages/32335/Prague-Central-Bohemia-Czech-Republic
    GVAR(WindSpeedMax)  = [[6.7, 2.4], [6.8, 2.2], [7.1, 2.0], [6.7, 1.9], [6.5, 1.8], [6.4, 1.8], [6.4, 1.8], [5.9, 1.9], [5.8, 2.1], [5.9, 2.3], [6.4, 2.8], [7.0, 3.0]];
    GVAR(WindSpeedMean) = [4.5, 4.3, 4.4, 4.1, 3.6, 3.6, 3.6, 3.4, 3.6, 0, 4.1, 4.6];
    GVAR(WindSpeedMin)  = [[1.5, 1.1], [1.5, 1.1], [1.5, 1.0], [1.2, 0.9], [1.1, 0.8], [1.0, 0.8], [1.0, 1.0], [1.0, 0.9], [1.1, 1.0], [1.0, 1.0], [1.3, 1.1], [1.8, 1.2]];
    GVAR(WindDirectionProbabilities) = [
        [0.06, 0.02, 0.06, 0.06, 0.10, 0.23, 0.15, 0.06], // January
        [0.08, 0.03, 0.08, 0.06, 0.08, 0.18, 0.15, 0.08], // February
        [0.08, 0.02, 0.10, 0.06, 0.07, 0.17, 0.15, 0.08], // March
        [0.12, 0.04, 0.10, 0.05, 0.06, 0.12, 0.13, 0.10], // April
        [0.12, 0.05, 0.09, 0.05, 0.05, 0.10, 0.13, 0.10], // May
        [0.12, 0.04, 0.06, 0.03, 0.05, 0.13, 0.16, 0.10], // June
        [0.09, 0.03, 0.07, 0.04, 0.06, 0.16, 0.18, 0.10], // July
        [0.09, 0.03, 0.08, 0.04, 0.06, 0.15, 0.16, 0.09], // August
        [0.07, 0.03, 0.08, 0.06, 0.08, 0.18, 0.15, 0.08], // September
        [0.06, 0.03, 0.10, 0.07, 0.10, 0.19, 0.13, 0.05], // October
        [0.06, 0.02, 0.08, 0.07, 0.10, 0.15, 0.13, 0.05], // November
        [0.06, 0.02, 0.06, 0.06, 0.10, 0.24, 0.15, 0.05]  // December
    ];
};

if (_worldName in ["takistan", "zargabad", "mountains_acr", "shapur_baf", "provinggrounds_pmc"]) exitWith {
    // Source: http://www.iten-online.ch/klima/asien/afghanistan/kabul.htm
    GVAR(TempDay) = [4.5, 5.5, 12.5, 19.2, 24.4, 30.2, 32.1, 32, 28.5, 22.4, 15, 8.3];
    GVAR(TempNight) = [-7.1, -5.7, 0.7, 6, 8.8, 12.4, 15.3, 14.3, 9.4, 3.9, -1.2, -4.7];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Kabul,Afghanistan
    GVAR(Humidity) = [68, 69, 62, 60, 49, 37, 38, 39, 40, 41, 56, 61];

    // Source: https://weatherspark.com/averages/32750/Kabul-Afghanistan
    GVAR(WindSpeedMax)  = [[4.0, 1.0], [4.1, 1.0], [5.1, 1.1], [6.9, 1.2], [8.9, 1.2], [10.0, 1.1], [9.1,1.0], [8.2, 1.0], [6.9, 1.0], [5.2, 1.0], [3.8, 0.9], [3.7, 0.9]];
    GVAR(WindSpeedMean) = [2.2, 2.2, 2.5, 2.8, 3.8, 4.4, 0, 3.3, 2.7, 2.4, 1.8, 1.9];
    GVAR(WindSpeedMin)  = [[0.2, 0.4], [0.2, 0.4], [0.2, 0.4], [0.3, 0.4], [0.6, 0.4], [0.9, 0.4], [0.7, 0.4], [0.5, 0.4], [0.2, 0.5], [0.1, 0.1], [0, 0.1], [0, 0.1]];
    GVAR(WindDirectionProbabilities) = [
        [0.04, 0.02, 0.05, 0.04, 0.05, 0.04, 0.11, 0.29], // January
        [0.08, 0.04, 0.06, 0.04, 0.06, 0.04, 0.10, 0.20], // February
        [0.12, 0.06, 0.08, 0.04, 0.05, 0.04, 0.09, 0.19], // March
        [0.18, 0.07, 0.09, 0.05, 0.05, 0.04, 0.08, 0.16], // April
        [0.27, 0.05, 0.05, 0.03, 0.04, 0.03, 0.08, 0.16], // May
        [0.35, 0.04, 0.04, 0.02, 0.02, 0.02, 0.07, 0.13], // June
        [0.30, 0.07, 0.09, 0.04, 0.02, 0.02, 0.05, 0.10], // July
        [0.23, 0.07, 0.08, 0.06, 0.03, 0.02, 0.05, 0.10], // August
        [0.15, 0.06, 0.10, 0.06, 0.04, 0.02, 0.07, 0.13], // September
        [0.12, 0.04, 0.07, 0.06, 0.04, 0.03, 0.10, 0.17], // October
        [0.07, 0.03, 0.06, 0.05, 0.06, 0.02, 0.10, 0.20], // November
        [0.05, 0.03, 0.06, 0.05, 0.06, 0.04, 0.11, 0.26]  // December
    ];
};

if (_worldName in ["fallujah"]) exitWith {
    // Source: http://www.iten-online.ch/klima/asien/irak/bagdad.htm
    GVAR(TempDay) = [16, 19, 23, 29, 36, 41, 43, 43, 40, 33, 24, 17];
    GVAR(TempNight) = [4, 6, 10, 15, 20, 23, 25, 25, 21, 16, 10, 5];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Bagdad,Iraq
    GVAR(Humidity) = [69, 60, 55, 50, 36, 23, 21, 22, 29, 38, 58, 68];
};

if (_worldName in ["fata", "abbottabad"]) exitWith {
    // Source: http://www.iten-online.ch/klima/asien/pakistan/zhob.htm
    GVAR(TempDay) = [12.4, 15.8, 20.8, 26.9, 32.8, 37, 36.8, 35.9, 33.8, 28.2, 22.2, 16.2];
    GVAR(TempNight) = [-0.6, 2.4, 7.4, 13.1, 18.2, 22.8, 23.8, 22.9, 19.2, 12, 5.6, 1.2];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Zhob,Pakistan
    GVAR(Humidity) = [50, 40, 42, 40, 30, 30, 50, 49, 40, 32, 38, 41];

    // Source: https://weatherspark.com/averages/31382/Shkin-Paktika-Afghanistan
    GVAR(WindSpeedMax)  = [[3.0, 1.0], [3.3, 1.0], [4.0, 1.0], [4.3, 1.4], [4.3, 1.5], [4.6, 1.4], [4.5, 1.3], [4.0, 0.9], [4.0, 1.0], [3.5, 1.0], [3.4, 1.0], [3.1, 1.0]];
    GVAR(WindSpeedMean) = [1.3, 1.5, 1.6, 1.7, 1.7, 1.7, 1.6, 1.5, 1.5, 1.4, 1.4, 1.2];
    GVAR(WindSpeedMin)  = [[0.2, 0.1], [0.2, 0.1], [0.2, 0.1], [0.2, 0.1], [0.1, 0.1], [0.1, 0.1], [0.3, 0.1], [0.2, 0.1], [0.1, 0.1], [0.1, 0.1], [0.1, 0.1], [0.1, 0.1]];
    GVAR(WindDirectionProbabilities) = [
        [0.09, 0.03, 0.02, 0.03, 0.05, 0.07, 0.07, 0.18], // January
        [0.07, 0.02, 0.01, 0.05, 0.10, 0.10, 0.06, 0.12], // February
        [0.07, 0.02, 0.01, 0.07, 0.14, 0.11, 0.08, 0.12], // March
        [0.07, 0.04, 0.03, 0.05, 0.12, 0.08, 0.06, 0.13], // April
        [0.10, 0.03, 0.02, 0.04, 0.10, 0.09, 0.08, 0.18], // May
        [0.12, 0.05, 0.04, 0.05, 0.08, 0.06, 0.06, 0.16], // June
        [0.06, 0.04, 0.02, 0.06, 0.05, 0.01, 0.02, 0.06], // July
        [0.08, 0.03, 0.04, 0.05, 0.09, 0.04, 0.02, 0.06], // August
        [0.10, 0.04, 0.02, 0.06, 0.11, 0.09, 0.06, 0.13], // September
        [0.07, 0.02, 0.01, 0.04, 0.11, 0.08, 0.08, 0.19], // October
        [0.06, 0.01, 0.00, 0.05, 0.11, 0.09, 0.08, 0.13], // November
        [0.07, 0.01, 0.01, 0.03, 0.08, 0.09, 0.09, 0.18]  // December
    ];
};

if (_worldName in ["sfp_wamako"]) exitWith {
    // Source: http://www.iten-online.ch/klima/afrika/niger/tahoua.htm
    GVAR(TempDay) = [33.4, 35, 38.4, 41.5, 41.4, 40, 35.6, 32.9, 35.8, 38.2, 36.4, 33.1];
    GVAR(TempNight) = [14.9, 16.3, 20.4, 23.7, 25.8, 24.8, 23.1, 22, 22.6, 21.6, 18.6, 15.3];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Tahoua,Niger
    GVAR(Humidity) = [68, 60, 57, 50, 32, 22, 20, 21, 25, 38, 58, 69];
};

if (_worldName in ["sfp_sturko"]) exitWith {
    // Source: http://www.iten-online.ch/klima/afrika/niger/tahoua.htm
    GVAR(TempDay) = [2.2, 2.4, 5.1, 10.2, 16.1, 20.1, 21.1, 20.9, 17.2, 12.7, 7.4, 3.9];
    GVAR(TempNight) = [-2, -2.3, -0.7, 2.6, 7.1, 11.4, 13.1, 12.7, 10, 6.9, 3.1, -0.1];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,karlskrona,Sweden
    GVAR(Humidity) = [86, 85, 80, 72, 68, 69, 74, 77, 79, 81, 86, 88];
};

if (_worldName in ["bornholm"]) exitWith {
    // Source: http://www.iten-online.ch/klima/afrika/niger/tahoua.htm
    GVAR(TempDay) = [1.9, 1.7, 3.8, 8.1, 14, 18.1, 19.6, 19.8, 16.2, 11.9, 7.3, 3.9];
    GVAR(TempNight) = [-1.6, -2.1, -0.7, 1.7, 6.2, 10.7, 13, 13.1, 10.6, 7.2, 3.5, 0.1];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,allinge,Denmark
    GVAR(Humidity) = [85, 84, 80, 76, 69, 69, 76, 77, 79, 81, 86, 86];

    // Source: https://weatherspark.com/averages/28830/R-nne-Capital-Region-of-Denmark
    GVAR(WindSpeedMax)  = [[9.3, 2.2], [8.4, 2.2], [7.9, 2.2], [7.1, 2.1], [7.2, 2.1], [6.8, 2.0], [6.8, 2.0], [7.1, 2.1], [7.7, 2.2], [8.6, 2.2], [8.8, 2.2], [9.3, 2.2]];
    GVAR(WindSpeedMean) = [6.9, 6.0, 5.7, 4.9, 4.8, 4.6, 4.7, 4.9, 5.5, 6.2, 6.5, 6.7];
    GVAR(WindSpeedMin)  = [[3.9, 2.0], [3.0, 2.0], [2.3, 2.0], [1.8, 1.8], [1.7, 1.8], [1.7, 1.7], [1.7, 1.8], [1.9, 1.9], [2.6, 2.0], [2.9, 2.0], [3.3, 2.1], [3.5, 2.0]];
    GVAR(WindDirectionProbabilities) = [
        [0.07, 0.04, 0.07, 0.05, 0.09, 0.12, 0.20, 0.07], // January
        [0.08, 0.06, 0.10, 0.06, 0.06, 0.08, 0.20, 0.08], // February
        [0.05, 0.06, 0.13, 0.08, 0.07, 0.08, 0.19, 0.06], // March
        [0.05, 0.11, 0.16, 0.09, 0.05, 0.06, 0.17, 0.06], // April
        [0.04, 0.10, 0.15, 0.08, 0.05, 0.06, 0.20, 0.05], // May
        [0.03, 0.07, 0.10, 0.07, 0.05, 0.07, 0.28, 0.06], // June
        [0.04, 0.06, 0.11, 0.07, 0.04, 0.07, 0.28, 0.06], // July
        [0.05, 0.06, 0.11, 0.07, 0.06, 0.08, 0.26, 0.06], // August
        [0.06, 0.06, 0.11, 0.07, 0.06, 0.09, 0.21, 0.06], // September
        [0.07, 0.05, 0.09, 0.08, 0.08, 0.12, 0.18, 0.07], // October
        [0.08, 0.06, 0.08, 0.07, 0.10, 0.12, 0.16, 0.07], // November
        [0.08, 0.05, 0.06, 0.04, 0.10, 0.14, 0.19, 0.07]  // December
    ];
};
if (_worldName in ["imrali"]) exitWith {
    // Source: http://www.iten-online.ch/klima/europa/tuerkei/bursa.htm
    GVAR(TempDay) = [9.3, 10.7, 13.6, 18.8, 23.5, 28.2, 30.3, 30.2, 27, 21.4, 16.5, 11.8];
    GVAR(TempNight) = [1.4, 2.4, 3.7, 7.1, 10.9, 14.3, 16.5, 16.3, 13, 9.5, 6, 3.8];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Bursa,Turkey
    GVAR(Humidity) = [78, 75, 70, 70, 71, 61, 58, 59, 63, 69, 77, 76];
};
if (_worldName in ["kunduz"]) exitWith {
    // Source: http://www.iten-online.ch/klima/asien/afghanistan/kunduz.htm
    GVAR(TempDay) = [6.3, 9.5, 15.8, 23, 29.8, 37.3, 39, 36.9, 31.8, 24.5, 16, 9.7];
    GVAR(TempNight) = [-2.4, 0, 5.7, 11.6, 15.7, 20.9, 21.5, 21.5, 16.3, 10.6, 4.1, 0];
    // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Kabul,Afghanistan
    GVAR(Humidity) = [70, 72, 64, 61, 49, 34, 36, 38, 39, 52, 51, 63];

    // Source: https://weatherspark.com/averages/32753/Kunduz-Afghanistan
    GVAR(WindSpeedMax)  = [[3.5, 0.8], [4.0, 0.6], [4.3, 2.0], [4.6, 1.1], [5.1, 1.2], [5.7, 1.0], [4.9, 0.8], [4.5, 0.3], [4.3, 0.3], [3.8, 0.5], [3.0, 1.3], [3.1, 0.8]];
    GVAR(WindSpeedMean) = [1.5, 1.8, 2.1, 2.4, 2.5, 2.8, 2.7, 2.5, 2.3, 2.1, 1.7, 1.6];
    GVAR(WindSpeedMin)  = [[0.2, 0.1], [0.3, 0.3], [0.4, 0.1], [0.8, 0.2], [0.8, 0.1], [1.0, 0.3], [0.9, 0.5], [0.8, 0.2], [0.8, 0.1], [0.7, 0.1], [0.5, 0.1], [0.2, 0.2]];
    GVAR(WindDirectionProbabilities) = [
        [0.04, 0.02, 0.05, 0.11, 0.12, 0.06, 0.09, 0.06], // January
        [0.04, 0.02, 0.05, 0.11, 0.12, 0.06, 0.08, 0.07], // February
        [0.05, 0.04, 0.06, 0.14, 0.12, 0.06, 0.10, 0.08], // March
        [0.09, 0.05, 0.08, 0.13, 0.07, 0.05, 0.07, 0.07], // April
        [0.14, 0.07, 0.13, 0.13, 0.06, 0.05, 0.05, 0.08], // May
        [0.16, 0.06, 0.12, 0.12, 0.05, 0.04, 0.05, 0.10], // June
        [0.17, 0.06, 0.08, 0.12, 0.06, 0.04, 0.05, 0.12], // July
        [0.15, 0.05, 0.06, 0.16, 0.08, 0.05, 0.07, 0.13], // August
        [0.15, 0.04, 0.08, 0.20, 0.13, 0.05, 0.10, 0.14], // September
        [0.08, 0.02, 0.08, 0.22, 0.15, 0.06, 0.13, 0.13], // October
        [0.06, 0.02, 0.05, 0.20, 0.17, 0.06, 0.12, 0.10], // November
        [0.04, 0.02, 0.05, 0.14, 0.19, 0.07, 0.10, 0.07]  // December
    ];
};
