/*
 * Author: Ruthberg
 * Removes all user data from the profileNamespace
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_clear_user_data
 *
 * Public: No
 */
#include "script_component.hpp"

{
    profileNamespace setVariable [format [QGVAR(%1), _x],nil];
} forEach ["gunList","currentUnit","currentGun","currentTarget","currentScopeUnit",
    "atmosphereModeTBH","altitude","temperature","barometricPressure",
    "relativeHumidity","showWind2","latitude","directionOfFire","windSpeed1","windSpeed2",
    "windDirection","inclinationAngle","targetSpeed","targetSpeedDirection","targetRange",
    "rangeCardStartRange","rangeCardEndRange","rangeCardCurrentColumn"];
