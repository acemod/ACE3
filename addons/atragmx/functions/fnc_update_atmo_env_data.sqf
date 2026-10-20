#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Updates the atmospheric data fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_atmo_env_data
 *
 * Public: No
 */

ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 13007);

if (GVAR(currentUnit) == 2) then {
    ctrlSetText [130040, str(round(GVAR(temperature) * 10) / 10)];
} else {
    ctrlSetText [130040, str(round((GVAR(temperature) * 1.8 + 32) * 10) / 10)];
};
if (GVAR(currentUnit) == 2) then {
    ctrlSetText [130050, str(round(GVAR(barometricPressure)))];
} else {
    ctrlSetText [130050, str(round(GVAR(barometricPressure) / 33.8638866667 * 100) / 100)];
};
ctrlSetText [130060, str(round(GVAR(relativeHumidity) * 100 * 10) / 10)];
if (GVAR(currentUnit) == 2) then {
    ctrlSetText [130030, str(round(GVAR(altitude)))];
} else {
    ctrlSetText [130030, str(round(GVAR(altitude) * 3.2808399))];
};

if (GVAR(currentUnit) == 2) then {
    ctrlSetText [13003, "Altitude (m)"];
    ctrlSetText [13004, "temperature (C)"];
    ctrlSetText [13005, "Barom Pres (milibars)"];
} else {
    ctrlSetText [13003, "Altitude (ft)"];
    ctrlSetText [13004, "temperature (F)"];
    ctrlSetText [13005, "Barom Pres (in.merc.)"];
};
