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

private["_emitter", "_owner", "_gunnerInfo", "_turretInfo", "_povPos", "_povDir"];

_emmiter = _this select 0;
_owner = _this select 1;

// Not in a vehicle....
// @TODO: handle lasering from turrets
if( (vehicle _owner) == _owner && alive _owner ) exitWith {
    [(eyePos _owner), (eyeDirection _owner)]
};

[-1,-1]