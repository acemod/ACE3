/*
 * Author: ?
 * ?
 *
 * Arguments:
 * 0: ? <?>
 *
 * Return Value:
 * ? <ß>
 *
 * Example:
 * [ß] call ace_laser_fnc_handleLaserOff
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_uudi"];
if(HASH_HASKEY(GVAR(laserEmitters), _uuid)) then {
    HASH_REM(GVAR(laserEmitters), _uuid);
};
