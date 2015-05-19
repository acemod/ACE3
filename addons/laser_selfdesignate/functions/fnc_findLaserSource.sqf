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
 //findLaserSource.sqf
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private["_emmiter", "_owner", "_gunnerInfo", "_turretInfo", "_povPos", "_povDir"];

_emmiter = _this select 0;
_owner = _this select 1;

_gunnerInfo = [_emmiter, (currentWeapon _emmiter)] call CBA_fnc_getFirer;
_turretInfo = [_emmiter, _gunnerInfo select 1] call EFUNC(common,getTurretDirection);
_povPos = _turretInfo select 0;
_povDir = _turretInfo select 1;

if(!isNil "_povPos" && !isNil "_povDir") exitWith {
    [_povPos, _povDir]
};

[-1,-1]