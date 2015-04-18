/*
 * Author: Ruthberg
 * Saves user data into profileNamespace
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_store_user_data
 *
 * Public: No
 */
#include "script_component.hpp"

profileNamespace setVariable ["ACE_ATragMX_currentUnit", GVAR(currentUnit)];
profileNamespace setVariable ["ACE_ATragMX_currentGun", GVAR(currentGun)];
profileNamespace setVariable ["ACE_ATragMX_currentTarget", GVAR(currentTarget)];
profileNamespace setVariable ["ACE_ATragMX_currentScopeUnit", GVAR(currentScopeUnit)];

profileNamespace setVariable ["ACE_ATragMX_atmosphereModeTBH", GVAR(atmosphereModeTBH)];
profileNamespace setVariable ["ACE_ATragMX_altitude", GVAR(altitude)];
profileNamespace setVariable ["ACE_ATragMX_temperature", GVAR(temperature)];
profileNamespace setVariable ["ACE_ATragMX_barometricPressure", GVAR(barometricPressure)];
profileNamespace setVariable ["ACE_ATragMX_relativeHumidity", GVAR(relativeHumidity)];

profileNamespace setVariable ["ACE_ATragMX_showWind2", GVAR(showWind2)];
profileNamespace setVariable ["latitude", GVAR(latitude)];
profileNamespace setVariable ["directionOfFire", GVAR(directionOfFire)];
profileNamespace setVariable ["ACE_ATragMX_windSpeed1", GVAR(windSpeed1)];
profileNamespace setVariable ["ACE_ATragMX_windSpeed2", GVAR(windSpeed2)];
profileNamespace setVariable ["ACE_ATragMX_windDirection", GVAR(windDirection)];
profileNamespace setVariable ["ACE_ATragMX_inclinationAngle", GVAR(inclinationAngle)];
profileNamespace setVariable ["ACE_ATragMX_targetSpeed", GVAR(targetSpeed)];
profileNamespace setVariable ["ACE_ATragMX_targetRange", GVAR(targetRange)];
