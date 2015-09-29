/*
 * Author: jaynus
 * Handler function for laser network code.
 *
 * Argument:
 * 0: Emitter
 * 1: Owner
 * 
 * Return value:
 *    [position, direction]
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private["_emmiter", "_owner", "_gunnerInfo", "_turretInfo", "_povPos", "_povDir"];

_emmiter = _this select 0;
_owner = _this select 1;

// Not in a vehicle....
// @TODO: handle lasering from turrets
if( (vehicle _emmiter) == _emmiter && alive _emmiter && (currentWeapon _emmiter) == "LaserDesignator") exitWith {
    [(eyePos _emmiter), (eyeDirection _emmiter)]
};

[-1,-1]