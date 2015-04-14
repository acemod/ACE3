/*
 * Author: Ruthberg
 * Handles incoming data packets from the Vectronix Vector LRF
 *
 * Arguments:
 * 0: Slope distance (Meters) <NUMBER>
 * 1: Azimuth (Degrees) <NUMBER>
 * 2: Inclination (Degrees) <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [1000, 45, 1] call ace_microdagr_fnc_recieveRangefinderData
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_slopeDistance", "_azimuth", "_inclination"];
_slopeDistance = _this select 0;
_azimuth       = _this select 1;
_inclination   = _this select 2;

//_inclination = asin((ACE_player weaponDirection currentWeapon ACE_player) select 2);
GVAR(inclinationAngle) set [GVAR(currentTarget), _inclination];
GVAR(targetRange) set [GVAR(currentTarget), _slopeDistance];
