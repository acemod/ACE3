/*
 * Author: Ruthberg
 * Reads user data from profileNamespace
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_restore_user_data
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(currentUnit) = 0 max (profileNamespace getVariable ["ACE_ATragMX_currentUnit", 2]) min 2;
[(profileNamespace getVariable ["ACE_ATragMX_currentGun", 0]), true, false] call FUNC(change_gun);
GVAR(currentTarget) = 0 max (profileNamespace getVariable ["ACE_ATragMX_currentTarget", 0]) min 3;

GVAR(atmosphereModeTBH) = profileNamespace getVariable ["ACE_ATragMX_atmosphereModeTBH", true];
GVAR(altitude) = -1000 max (profileNamespace getVariable ["ACE_ATragMX_altitude", 0]) min 20000;
GVAR(temperature) = -50 max (profileNamespace getVariable ["ACE_ATragMX_temperature", 15]) min 160;
GVAR(barometricPressure) = 340 max (profileNamespace getVariable ["ACE_ATragMX_barometricPressure", 1013.25]) min 1350;
GVAR(relativeHumidity) = 0 max (profileNamespace getVariable ["ACE_ATragMX_relativeHumidity", 0.5]) min 1;

GVAR(showWind2) = profileNamespace getVariable ["ACE_ATragMX_showWind2", false];
GVAR(showCoriolis) = profileNamespace getVariable ["ACE_ATragMX_showCoriolis", true];
GVAR(latitude) = profileNamespace getVariable ["ACE_ATragMX_latitude", [38, 38, 38, 38]];
GVAR(directionOfFire) = profileNamespace getVariable ["ACE_ATragMX_directionOfFire", [0, 0, 0, 0]];
GVAR(windSpeed1) = profileNamespace getVariable ["ACE_ATragMX_windSpeed1", [0, 0, 0, 0]];
GVAR(windSpeed2) = profileNamespace getVariable ["ACE_ATragMX_windSpeed2", [0, 0, 0, 0]];
GVAR(windDirection) = profileNamespace getVariable ["ACE_ATragMX_windDirection", [12, 12, 12, 12]];
GVAR(inclinationAngle) = profileNamespace getVariable ["ACE_ATragMX_inclinationAngle", [0, 0, 0, 0]];
GVAR(targetSpeed) = profileNamespace getVariable ["ACE_ATragMX_targetSpeed", [0, 0, 0, 0]];
GVAR(targetSpeedDirection) = profileNamespace getVariable ["ACE_ATragMX_targetSpeedDirection", [1, 1, 1, 1]];
GVAR(targetRange) = profileNamespace getVariable ["ACE_ATragMX_targetRange", [0, 0, 0, 0]];

GVAR(rangeCardStartRange) = 0 max (profileNamespace getVariable ["ACE_ATragMX_rangeCardStartRange", 200]) min 3000;
GVAR(rangeCardEndRange) = 0 max (profileNamespace getVariable ["ACE_ATragMX_rangeCardEndRange", 2000]) min 3000;
GVAR(rangeCardIncrement) = 1 max (profileNamespace getVariable ["ACE_ATragMX_rangeCardIncrement", 50]) min 3000;
GVAR(rangeCardCurrentColumn) = 0 max (profileNamespace getVariable ["ACE_ATragMX_rangeCardCurrentColumn", 3]) min 3;
