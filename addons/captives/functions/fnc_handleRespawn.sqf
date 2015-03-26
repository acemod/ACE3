/*
 * Author: commy2 PabstMirror
 * Fix, because captiveNum doesn't reset properly on respawn
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Corpse <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [alive, body] call ACE_captives_fnc_handleRespawn;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_dead);

if (!local _unit) exitWith {};

[_unit, QGVAR(Handcuffed), false] call EFUNC(common,setCaptivityStatus);
[_unit, QGVAR(Surrendered), false] call EFUNC(common,setCaptivityStatus);

