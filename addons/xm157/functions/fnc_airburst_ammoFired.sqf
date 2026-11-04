#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles ammo fired event for airburst ammo. Called from the ammo's fired EH.
 *
 * Arguments:
 * 0: Unit (not used) <OBJECT>
 * 1: Weapon (not used) <STRING>
 * 2: Muzzle (not used) <STRING>
 * 3: Mode (not used) <STRING>
 * 4: Ammo <STRING>
 * 5: Magazine (not used) <STRING>
 * 6: Projectile <OBJECT>
 * 7: Gunner <OBJECT>
 *
 * Return Value:
 * None
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
