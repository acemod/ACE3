#include "..\script_component.hpp"
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

if (GVAR(showWind2)) then {
    if (GVAR(currentUnit) != 2) then {
        ctrlSetText [300, format["%1/%2", round((GVAR(windSpeed1) select GVAR(currentTarget)) * 2.23693629), round((GVAR(windSpeed2) select GVAR(currentTarget)) * 2.23693629)]];
    } else {
        ctrlSetText [300, format["%1/%2", round(GVAR(windSpeed1) select GVAR(currentTarget)), round(GVAR(windSpeed2) select GVAR(currentTarget))]];
    };
} else {
    if (GVAR(currentUnit) != 2) then {
        ctrlSetText [300, str(round((GVAR(windSpeed1) select GVAR(currentTarget)) * 2.23693629 * 100) / 100)];
    } else {
        ctrlSetText [300, str(round((GVAR(windSpeed1) select GVAR(currentTarget)) * 100) / 100)];
    };
};
ctrlSetText [310, str(round((GVAR(windDirection) select GVAR(currentTarget))))];
ctrlSetText [320, str(round((GVAR(inclinationAngle) select GVAR(currentTarget))))];
if (GVAR(currentUnit) != 2) then {
    ctrlSetText [330, str(round((GVAR(targetSpeed) select GVAR(currentTarget)) * 2.23693629 * 100) / 100)];
} else {
    ctrlSetText [330, str(round((GVAR(targetSpeed) select GVAR(currentTarget)) * 100) / 100)];
};
switch (GVAR(currentUnit)) do {
    case 0: {
        ctrlSetText [340, format["*%1", round((GVAR(targetRange) select GVAR(currentTarget)))]];
    };
    case 1: {
        ctrlSetText [340, str(round((GVAR(targetRange) select GVAR(currentTarget)) * 1.0936133))];
    };
    case 2: {
        ctrlSetText [340, str(round((GVAR(targetRange) select GVAR(currentTarget))))];
    };
};
