#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Gets the laser code of a laser source.
 *
 * Argument:
 * 0: Laser source <OBJECT>
 *
 * Return Value:
 * Laser code <NUMBER>
 *
 * Example:
 * player call ace_laser_fnc_getLaserCode;
 *
 * Public: Yes
 */

params [["_laserSource", objNull, [objNull]]];

if (isNull _laserSource) exitWith {
    -1
};

_laserSource getVariable [QGVAR(code), ACE_DEFAULT_LASER_CODE]
