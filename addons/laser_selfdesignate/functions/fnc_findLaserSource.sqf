/*
 * Author: jaynus
 * Handler function for laser network code.
 *
 * Argument:
 * 0: Emitter <OBJECT>
 *
 * Return Value:
 * 0: position <ARRAY>
 * 1: direction <ARRAY>
 *
 * Public: No
 */
#include "script_component.hpp"

private["_gunnerInfo", "_turretInfo"];
params ["_emmiter"];

_gunnerInfo = [_emmiter, (currentWeapon _emmiter)] call CBA_fnc_getFirer;
_turretInfo = [_emmiter, _gunnerInfo select 1] call EFUNC(common,getTurretDirection);
_turretInfo params [["_povPos", -1], ["_povDir", -1]];

[_povPos, _povDir]
