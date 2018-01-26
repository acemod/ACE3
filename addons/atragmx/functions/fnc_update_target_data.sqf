/*
 * Author: Ruthberg
 * Updates all target column input fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_target
 *
 * Public: No
 */
#include "script_component.hpp"

ctrlSetText [140000, Str(Round((GVAR(latitude) select GVAR(currentTarget)) * 100) / 100)];
ctrlSetText [140010, Str(Round((GVAR(directionOfFire) select GVAR(currentTarget)) * 100) / 100)];
if (GVAR(currentUnit) != 2) then {
    ctrlSetText [140020, Str(Round((GVAR(windSpeed1) select GVAR(currentTarget)) * 2.23693629 * 100) / 100)];
    ctrlSetText [140021, Str(Round((GVAR(windSpeed2) select GVAR(currentTarget)) * 2.23693629 * 100) / 100)];
} else {
    ctrlSetText [140020, Str(Round((GVAR(windSpeed1) select GVAR(currentTarget)) * 100) / 100)];
    ctrlSetText [140021, Str(Round((GVAR(windSpeed2) select GVAR(currentTarget)) * 100) / 100)];
};
ctrlSetText [140030, Str(Round((GVAR(windDirection) select GVAR(currentTarget))))];
ctrlSetText [140040, Str(Round((GVAR(inclinationAngle) select GVAR(currentTarget))))];
ctrlSetText [140041, Str(Round(cos(GVAR(inclinationAngle) select GVAR(currentTarget)) * 100) / 100)];
if (GVAR(currentUnit) != 2) then {
    ctrlSetText [140050, Str(Round((GVAR(targetSpeed) select GVAR(currentTarget)) * 2.23693629 * 100) / 100)];
} else {
    ctrlSetText [140050, Str(Round((GVAR(targetSpeed) select GVAR(currentTarget)) * 100) / 100)];
};
if ((GVAR(targetSpeedDirection) select GVAR(currentTarget)) == 1) then {
    ctrlSetText [140051, ">"];
} else {
    ctrlSetText [140051, "<"];
};
if (GVAR(currentUnit) == 1) then {
    ctrlSetText [140060, Str(Round((GVAR(targetRange) select GVAR(currentTarget)) * 1.0936133))];
} else {
    ctrlSetText [140060, Str(Round((GVAR(targetRange) select GVAR(currentTarget))))];
};
if (GVAR(currentUnit) == 0) then {
    ctrlSetText [140061, "*"];
} else {
    ctrlSetText [140061, ""];
};

if (GVAR(currentUnit) == 2) then {
    ctrlSetText [14002, "Wind Speed (m/s)"];
    ctrlSetText [14005, "Target Speed (m/s)"];
} else {
    ctrlSetText [14002, "Wind Speed (mph)"];
    ctrlSetText [14005, "Target Speed (mph)"];
};

if (GVAR(currentUnit) == 1) then {
    ctrlSetText [14006, "Target Range (yards)"];
} else {
    ctrlSetText [14006, "Target Range (meters)"];
};
