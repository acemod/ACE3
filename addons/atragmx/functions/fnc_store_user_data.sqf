#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Saves user data into profileNamespace
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_store_user_data
 *
 * Public: No
 */

profileNamespace setVariable ["ACE_ATragMX_profileNamespaceVersion", ATRAGMX_PROFILE_NAMESPACE_VERSION];

profileNamespace setVariable ["ACE_ATragMX_currentUnit", GVAR(currentUnit)];
profileNamespace setVariable ["ACE_ATragMX_currentGun", GVAR(currentGun)];
profileNamespace setVariable ["ACE_ATragMX_currentTarget", GVAR(currentTarget)];

profileNamespace setVariable ["ACE_ATragMX_atmosphereModeTBH", GVAR(atmosphereModeTBH)];
profileNamespace setVariable ["ACE_ATragMX_altitude", GVAR(altitude)];
profileNamespace setVariable ["ACE_ATragMX_temperature", GVAR(temperature)];
profileNamespace setVariable ["ACE_ATragMX_barometricPressure", GVAR(barometricPressure)];
profileNamespace setVariable ["ACE_ATragMX_relativeHumidity", GVAR(relativeHumidity)];

profileNamespace setVariable ["ACE_ATragMX_showWind2", GVAR(showWind2)];
profileNamespace setVariable ["ACE_ATragMX_showCoriolis", GVAR(showCoriolis)];
profileNamespace setVariable ["ACE_ATragMX_latitude", GVAR(latitude)];
profileNamespace setVariable ["ACE_ATragMX_directionOfFire", GVAR(directionOfFire)];
profileNamespace setVariable ["ACE_ATragMX_windSpeed1", GVAR(windSpeed1)];
profileNamespace setVariable ["ACE_ATragMX_windSpeed2", GVAR(windSpeed2)];
profileNamespace setVariable ["ACE_ATragMX_windDirection", GVAR(windDirection)];
profileNamespace setVariable ["ACE_ATragMX_inclinationAngle", GVAR(inclinationAngle)];
profileNamespace setVariable ["ACE_ATragMX_targetSpeed", GVAR(targetSpeed)];
profileNamespace setVariable ["ACE_ATragMX_targetSpeedDirection", GVAR(targetSpeedDirection)];
profileNamespace setVariable ["ACE_ATragMX_targetRange", GVAR(targetRange)];

profileNamespace setVariable ["ACE_ATragMX_rangeCardStartRange", GVAR(rangeCardStartRange)];
profileNamespace setVariable ["ACE_ATragMX_rangeCardEndRange", GVAR(rangeCardEndRange)];
profileNamespace setVariable ["ACE_ATragMX_rangeCardIncrement", GVAR(rangeCardIncrement)];
profileNamespace setVariable ["ACE_ATragMX_rangeCardCurrentColumn", GVAR(rangeCardCurrentColumn)];
