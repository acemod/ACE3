#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Updates all atmosphere column input fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_atmosphere
 *
 * Public: No
 */

if (GVAR(currentUnit) == 2) then {
    ctrlSetText [200, str(round(GVAR(temperature) * 10) / 10)];
} else {
    ctrlSetText [200, str(round((GVAR(temperature) * 1.8 + 32) * 10) / 10)];
};
if (GVAR(currentUnit) == 2) then {
    ctrlSetText [210, str(round(GVAR(barometricPressure)))];
} else {
    ctrlSetText [210, str(round(GVAR(barometricPressure) / 33.8638866667 * 100) / 100)];
};
ctrlSetText [220, str(round(GVAR(relativeHumidity) * 100 * 10) / 10)];
if (GVAR(currentUnit) == 2) then {
    ctrlSetText [230, str(round(GVAR(altitude)))];
} else {
    ctrlSetText [230, str(round(GVAR(altitude) * 3.2808399))];
};
