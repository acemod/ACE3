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

{
    profileNamespace setVariable [format ["ACE_ATragMX_%1",_x],nil];
} forEach ["gunList","currentUnit","currentGun","currentTarget","currentScopeUnit",
    "atmosphereModeTBH","altitude","temperature","barometricPressure",
    "relativeHumidity","showWind2","latitude","directionOfFire","windSpeed1","windSpeed2",
    "windDirection","inclinationAngle","targetSpeed","targetSpeedDirection","targetRange",
    "rangeCardStartRange","rangeCardEndRange","rangeCardCurrentColumn"];
