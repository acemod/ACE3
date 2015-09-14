/*
 * Author: ?
 * ?
 *
 * Arguments:
 * 0: ? <?>
 *
 * Return Value:
 * ? <?>
 *
 * Example:
 * [?] call ace_laser_fnc_handleLaserOn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_uuid", "_args"];
HASH_SET(GVAR(laserEmitters), _uuid, _args);
