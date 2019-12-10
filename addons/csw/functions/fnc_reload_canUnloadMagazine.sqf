#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Tests if unit can unload a magazine from a static weapon.
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Player <OBJECT>
 * 3: Carryable Magazine <STRING>
 * 4: Vehicle Magazine <STRING>
 *
 * Return Value:
 * <BOOL>
 *
 * Example:
 * [cursorTarget, [0], player, "ACE_csw_100Rnd_127x99_mag_red", "200Rnd_127x99_mag_Tracer_Red"] call ace_csw_fnc_reload_canUnloadMagazine
 *
 * Public: No
 */

params ["_vehicle", "_turretPath", "_unit", "_carryMag", "_vehMag"];

// handle disassembled or deleted
if ((!alive _vehicle) || {(_vehicle distance _unit) > 5}) exitWith {false};

private _return = false;
{
    _x params ["_xMag", "_xTurret", "_xAmmo"];
    if ((_xMag == _vehMag) && {_xTurret isEqualTo _turretPath} && {_xAmmo > 0}) exitWith { _return = true };
} forEach (magazinesAllTurrets _vehicle);

_return
