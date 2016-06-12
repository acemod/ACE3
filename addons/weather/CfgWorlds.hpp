class CfgWorlds {
    class CAWorld;

    class Stratis: CAWorld {
        // Source: http://www.iten-online.ch/klima/europa/griechenland/limnos.htm
        ACE_TempDay[]   = {10, 10, 12, 16, 21, 26, 29, 28, 25, 20, 15, 11};
        ACE_TempNight[] = {4, 4, 6, 8, 13, 17, 20, 20, 16, 12, 8, 6};
        // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Limnos,Greece
        ACE_Humidity[]  = {78, 77, 78, 74, 71, 60, 59, 61, 65, 72, 79, 80};
        // Source: https://weatherspark.com/averages/32194/Lemnos-Limnos-North-Aegean-Islands-Greece
        ACE_WindSpeedMax[]  = {{8.8, 5.5}, {8.8, 5}, {8.6, 4.8}, {7.6, 3.4}, {7.0, 3.0}, {7.1, 3.0}, {7.5, 3.1}, {8.0, 3.2}, {7.6, 3.5}, {7.8, 4.6}, {7.9, 5.0}, {8.2, 5.5}};
        ACE_WindSpeedMean[] = {4.8, 4.9, 4.6, 4.1, 3.5, 3.5, 4.3, 4.4, 4.1, 4.5, 4.5, 5.0};
        ACE_WindSpeedMin[]  = {{0.2, 5.0}, {0.1, 5.0}, {0.2, 4.3}, {0.0, 3.0}, {0.0, 2.1}, {0.0, 2.0}, {0.1, 3.1}, {0.3, 3.1}, {0.0, 3.6}, {0.0, 4.2}, {0.1, 5.0}, {0.2, 5.5}};
        // using the "Fraction of Time Spent with Various Wind Directions in (month)" graph
        ACE_WindDirectionProbabilities[]  = {{0.06, 0.32, 0.05, 0.04, 0.15, 0.06, 0.02, 0.02}, // January
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
                                             {0.06, 0.37, 0.05, 0.03, 0.18, 0.04, 0.02, 0.02}};// December
                                             // N , NE  , E   , SE  , S   , SW  , W   , NW
    };

    class Altis: CAWorld {
        // Source: http://www.iten-online.ch/klima/europa/griechenland/limnos.htm
        ACE_TempDay[]   = {10, 10, 12, 16, 21, 26, 29, 28, 25, 20, 15, 11};
        ACE_TempNight[] = {4, 4, 6, 8, 13, 17, 20, 20, 16, 12, 8, 6};
        // Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Limnos,Greece
        ACE_Humidity[]  = {78, 77, 78, 74, 71, 60, 59, 61, 65, 72, 79, 80};
        // Source: https://weatherspark.com/averages/32194/Lemnos-Limnos-North-Aegean-Islands-Greece
        ACE_WindSpeedMax[]  = {{8.8, 5.5}, {8.8, 5}, {8.6, 4.8}, {7.6, 3.4}, {7.0, 3.0}, {7.1, 3.0}, {7.5, 3.1}, {8.0, 3.2}, {7.6, 3.5}, {7.8, 4.6}, {7.9, 5.0}, {8.2, 5.5}};
        ACE_WindSpeedMean[] = {4.8, 4.9, 4.6, 4.1, 3.5, 3.5, 4.3, 4.4, 4.1, 4.5, 4.5, 5.0};
        ACE_WindSpeedMin[]  = {{0.2, 5.0}, {0.1, 5.0}, {0.2, 4.3}, {0.0, 3.0}, {0.0, 2.1}, {0.0, 2.0}, {0.1, 3.1}, {0.3, 3.1}, {0.0, 3.6}, {0.0, 4.2}, {0.1, 5.0}, {0.2, 5.5}};
        // using the "Fraction of Time Spent with Various Wind Directions in (month)" graph
        ACE_WindDirectionProbabilities[]  = {{0.06, 0.32, 0.05, 0.04, 0.15, 0.06, 0.02, 0.02}, // January
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
                                             {0.06, 0.37, 0.05, 0.03, 0.18, 0.04, 0.02, 0.02}};// December
                                             // N , NE  , E   , SE  , S   , SW  , W   , NW
    };

    class Tanoa: CAWorld {
        // Source: http://www.iten-online.ch/klima/australien/fidschi/suva.htm
        ACE_TempDay[]   = {31, 31, 31, 30, 28, 28, 27, 27, 28, 20, 29, 30};
        ACE_TempNight[] = {24, 24, 24, 23, 22, 21, 20, 21, 21, 22, 23, 23};
        // Source: https://weather-and-climate.com/average-monthly-Humidity-perc,suva,Fiji
        ACE_Humidity[]  = {81, 83, 85, 84, 80, 80, 78, 76, 77, 78, 79, 80};
        // https://weatherspark.com/averages/32711/Suva-Central-Division-Fiji
        ACE_WindSpeedMax[]  = {{6.9, 4.9}, {6.5, 4.8}, {6.4, 4.5}, {6.5, 4.3}, {6.4, 4.2}, {6.6, 4.5}, {6.5, 4.8}, {7.0, 4.9}, {7.3, 5.1}, {7.3, 5.1}, {7.2, 5.2}, {6.8, 5.1}};
        ACE_WindSpeedMean[] = {2.2, 2, 1.9, 1.6, 1.9, 2, 2.1, 2.3, 2.7, 3, 2.7, 2.4};
        ACE_WindSpeedMin[]  = {{0.0, 0.1}, {0.1, 0.1}, {0.0, 0.0}, {0.0, 0.4}, {0.0, 0.4}, {0.0, 0.2}, {0.0, 0.5}, {0.0, 0.5}, {0.1, 1.0}, {0.2, 1.3}, {0.0, 0.5}, {0.0, 0.5}};
        // using the "Fraction of Time Spent with Various Wind Directions in (month)" graph
        ACE_WindDirectionProbabilities[]  = {{0.05, 0.08, 0.18, 0.13, 0.05, 0.01, 0.02, 0.05}, // January
                                             {0.06, 0.08, 0.14, 0.11, 0.05, 0.01, 0.02, 0.06}, // February
                                             {0.06, 0.08, 0.12, 0.09, 0.04, 0.01, 0.03, 0.06}, // March
                                             {0.05, 0.08, 0.13, 0.13, 0.05, 0.01, 0.02, 0.06}, // April
                                             {0.02, 0.06, 0.15, 0.16, 0.06, 0.01, 0.01, 0.03}, // May
                                             {0.02, 0.07, 0.17, 0.17, 0.06, 0.01, 0.01, 0.03}, // June
                                             {0.02, 0.07, 0.14, 0.18, 0.08, 0.02, 0.01, 0.02}, // July
                                             {0.02, 0.05, 0.18, 0.18, 0.09, 0.03, 0.01, 0.02}, // August
                                             {0.01, 0.04, 0.21, 0.22, 0.08, 0.01, 0.01, 0.01}, // September
                                             {0.01, 0.06, 0.24, 0.24, 0.07, 0.01, 0.01, 0.02}, // October
                                             {0.02, 0.07, 0.25, 0.20, 0.04, 0.01, 0.01, 0.02}, // November
                                             {0.03, 0.08, 0.22, 0.16, 0.05, 0.01, 0.01, 0.03}};// December
                                             // N , NE  , E   , SE  , S   , SW  , W   , NW
        };
};
