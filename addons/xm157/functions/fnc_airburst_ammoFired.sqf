#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles ammo fired event for airburst ammo. Called from the ammo's fired EH.
 *
 * Arguments:
 * FiredEH
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call ace_xm157_fnc_airburst_ammoFired
 *
 * Public: No
 */

params ["", "", "", "", "_ammo", "", "_projectile", "_gunner"];
if (!local _gunner) exitWith {};
if (isNull _projectile) exitWith {};
TRACE_3("ammoFired local",_ammo,_projectile,_gunner);

private _tof = missionNamespace getVariable [QGVAR(timeOfFlight), -1];
if (_tof < 0.1) exitWith {}; // ~20m safety check

[{
    TRACE_1("triggerAmmo",_this);
    triggerAmmo _this;   
}, _projectile, _tof] call CBA_fnc_waitAndExecute;
