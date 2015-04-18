/*
 * Author: Ruthberg
 * Updates the Kestrel 4500 Impeller state
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_windSpeed"];

_windSpeed = call FUNC(measureWindSpeed);

GVAR(ImpellerState) = GVAR(ImpellerState) + (ceil(_windSpeed) min 1) max _windSpeed;
if (GVAR(ImpellerState) > 1000) then { GVAR(ImpellerState) = 0 };
