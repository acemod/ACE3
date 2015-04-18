/*
 * Author: Ruthberg
 * Removes all user data from the profileNamespace
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_clear_user_data
 *
 * Public: No
 */
#include "script_component.hpp"

profileNamespace setVariable ["ACE_ATragMX_gunList", nil];

profileNamespace setVariable ["ACE_ATragMX_currentUnit", nil];
profileNamespace setVariable ["ACE_ATragMX_currentGun", nil];
profileNamespace setVariable ["ACE_ATragMX_currentTarget", nil];
profileNamespace setVariable ["ACE_ATragMX_currentScopeUnit", nil];

profileNamespace setVariable ["ACE_ATragMX_atmosphereModeTBH", nil];
profileNamespace setVariable ["ACE_ATragMX_altitude", nil];
profileNamespace setVariable ["ACE_ATragMX_temperature", nil];
profileNamespace setVariable ["ACE_ATragMX_barometricPressure", nil];
profileNamespace setVariable ["ACE_ATragMX_relativeHumidity", nil];

profileNamespace setVariable ["ACE_ATragMX_showWind2", nil];
profileNamespace setVariable ["latitude", nil];
profileNamespace setVariable ["directionOfFire", nil];
profileNamespace setVariable ["ACE_ATragMX_windSpeed1", nil];
profileNamespace setVariable ["ACE_ATragMX_windSpeed2", nil];
profileNamespace setVariable ["ACE_ATragMX_windDirection", nil];
profileNamespace setVariable ["ACE_ATragMX_inclinationAngle", nil];
profileNamespace setVariable ["ACE_ATragMX_targetSpeed", nil];
profileNamespace setVariable ["ACE_ATragMX_targetRange", nil];
