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
#include "script_component.hpp"

{
    _x params ["_name","_var"];
    profileNamespace setVariable [format [QGVAR(%1),_name],_var];
} forEach [
    ["profileNamespaceVersion", ATRAGMX_PROFILE_NAMESPACE_VERSION],
    ["currentUnit", GVAR(currentUnit)],
    ["currentGun", GVAR(currentGun)],
    ["currentTarget", GVAR(currentTarget)],
    ["atmosphereModeTBH", GVAR(atmosphereModeTBH)],
    ["altitude", GVAR(altitude)],
    ["temperature", GVAR(temperature)],
    ["barometricPressure", GVAR(barometricPressure)],
    ["relativeHumidity", GVAR(relativeHumidity)],
    ["showWind2", GVAR(showWind2)],
    ["latitude", GVAR(latitude)],
    ["directionOfFire", GVAR(directionOfFire)],
    ["windSpeed1", GVAR(windSpeed1)],
    ["windSpeed2", GVAR(windSpeed2)],
    ["windDirection", GVAR(windDirection)],
    ["inclinationAngle", GVAR(inclinationAngle)],
    ["targetSpeed", GVAR(targetSpeed)],
    ["targetSpeedDirection", GVAR(targetSpeedDirection)],
    ["targetRange", GVAR(targetRange)],
    ["rangeCardStartRange", GVAR(rangeCardStartRange)],
    ["rangeCardEndRange", GVAR(rangeCardEndRange)],
    ["rangeCardIncrement", GVAR(rangeCardIncrement)],
    ["rangeCardCurrentColumn", GVAR(rangeCardCurrentColumn)]
];
