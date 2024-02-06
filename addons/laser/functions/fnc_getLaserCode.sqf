#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Gets the laser code of a laser source.
 *
 * Argument:
 * 0: Laser source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_laser_fnc_getLaserCode;
 *
 * Public: Yes
 */

params ["_laserSource"];

_laserSource getVariable [QGVAR(code), ACE_DEFAULT_LASER_CODE]
