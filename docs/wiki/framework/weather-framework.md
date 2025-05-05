---
layout: wiki
title: Weather Framework
description: Explains how to work with ACE3 weather system.
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview

ACE3 Weather extends the existing weather by temperature, humidity and air pressure according to the geographic location, season and time of day.

The additional wind simulation, which is also influenced by the season and the geographical location, can be deactivated if necessary.

Cloud cover, rain and fog can still be set via the mission settings.


## 2. Wind Simulation

## 2.1 Temporarily Pause Wind Simulation

When Wind Simulation is enabled at mission start, it can be temporarily disabled by setting `ace_weather_disableWindSimulation = true`. To reenable wind simulation, the variable must either be set to `false` or `nil`.

## 3. Config Values

### 3.1 Adding ACE weather to maps via config

```cpp
class CfgWorlds {
    class MyWorld {
        // Source: http://www.iten-online.ch/klima/europa/griechenland/limnos.htm
        ACE_TempDay[]   = {10, 10, 12, 16, 21, 26, 29, 28, 25, 20, 15, 11}; // Monthly average daytime temperature in °C, 1 entry per month starting with January
        ACE_TempNight[] = {4, 4, 6, 8, 13, 17, 20, 20, 16, 12, 8, 6}; // Monthly average night-time temperature in °C, 1 entry per month starting with January
        
        // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Limnos,Greece
        ACE_Humidity[]  = {78, 77, 78, 74, 71, 60, 59, 61, 65, 72, 79, 80}; // Monthly average humidity from 0-100, 1 entry per month starting with January
        
        // ACE_WindSpeedMax: Monthly maximum wind speed information in m/s, 1 entry per month starting with January
        // The format of each entry is: {average maximum wind speed, maximum wind speed interval}
        // Example of calculating maximum wind speed in January: max_wind_speed = 8.8 ± 5.5 m/s
        // Source: https://weatherspark.com/averages/32194/Lemnos-Limnos-North-Aegean-Islands-Greece
        ACE_WindSpeedMax[]  = {{8.8, 5.5}, {8.8, 5}, {8.6, 4.8}, {7.6, 3.4}, {7.0, 3.0}, {7.1, 3.0}, {7.5, 3.1}, {8.0, 3.2}, {7.6, 3.5}, {7.8, 4.6}, {7.9, 5.0}, {8.2, 5.5}};
        
        ACE_WindSpeedMean[] = {4.8, 4.9, 4.6, 4.1, 3.5, 3.5, 4.3, 4.4, 4.1, 4.5, 4.5, 5.0}; // Monthly average wind speed in m/s, 1 entry per month starting with January
        
        // ACE_WindSpeedMin: Monthly minimum wind speed information in m/s, 1 entry per month starting with January
        // The format of each entry is: {average minimum wind speed, minimum wind speed interval}
        // Example of calculating minimum wind speed in January: min_wind_speed = 0.2 ± 5.0 m/s (negative minimum wind speeds are forced to 0)
        ACE_WindSpeedMin[]  = {{0.2, 5.0}, {0.1, 5.0}, {0.2, 4.3}, {0.0, 3.0}, {0.0, 2.1}, {0.0, 2.0}, {0.1, 3.1}, {0.3, 3.1}, {0.0, 3.6}, {0.0, 4.2}, {0.1, 5.0}, {0.2, 5.5}}; 
        
        // ACE_WindDirectionProbabilities: Monthly wind direction probabilities, 1 entry per month starting with January
        // the format of each entry is: {probability from N, prob. from NE, prob. from E, prob. from SE, prob. from S, prob. from SW, prob. from W, prob. from NW}
        // using the "Fraction of Time Spent with Various Wind Directions in (month)" graph
        ACE_WindDirectionProbabilities[]  = {
            {0.06, 0.32, 0.05, 0.04, 0.15, 0.06, 0.02, 0.02}, // January
            {0.08, 0.32, 0.04, 0.04, 0.18, 0.06, 0.02, 0.02}, // February
            {0.09, 0.30, 0.04, 0.04, 0.20, 0.06, 0.02, 0.03}, // March
            {0.10, 0.25, 0.03, 0.04, 0.22, 0.06, 0.02, 0.04}, // April
            {0.18, 0.25, 0.03, 0.04, 0.18, 0.04, 0.01, 0.05}, // May
            {0.25, 0.25, 0.03, 0.03, 0.15, 0.03, 0.00, 0.08}, // June
            {0.32, 0.30, 0.02, 0.02, 0.10, 0.01, 0.00, 0.09}, // July
            {0.28, 0.35, 0.02, 0.01, 0.08, 0.01, 0.00, 0.08}, // August
            {0.20, 0.37, 0.03, 0.01, 0.11, 0.01, 0.01, 0.05}, // September
            {0.10, 0.39, 0.04, 0.02, 0.15, 0.02, 0.01, 0.03}, // October
            {0.08, 0.38, 0.06, 0.04, 0.19, 0.03, 0.02, 0.02}, // November
            {0.06, 0.37, 0.05, 0.03, 0.18, 0.04, 0.02, 0.02}  // December
        };  // N , NE  , E   , SE  , S   , SW  , W   , NW
    };
};
```

### 3.2 Adding ACE weather to maps via mission config

You can define/overwrite ACE weather configs via `description.ext`

```cpp
class CfgWorlds {
    class Any {
        // Same content as above
    };
    // Takes precedence over Any
    class MyWorld {
        // Same content as above
    };
};
```

The config hierarchy is as follows:

1. `missionConfigFile >> mapName`
2. `missionConfigFile >> "Any"`
3. `configFile >> mapName`
