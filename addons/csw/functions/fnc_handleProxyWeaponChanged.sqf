#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Points an AI gunner at the proxy weapon that just replaced the one they had selected.
 * Called from a global event, only does anything where the gunner is local.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Weapon that was removed <STRING>
 * 3: Proxy weapon that replaced it <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, [0], "mortar_82mm", "ace_mortar_82mm"] call ace_csw_fnc_handleProxyWeaponChanged
 *
 * Public: No
 */

params ["_vehicle", "_turret", "", "_proxyWeapon"];
TRACE_3("proxyWeaponChanged",_vehicle,_turret,_proxyWeapon);

private _gunner = _vehicle turretUnit _turret;

// Nobody to point anywhere, and players pick their own weapon
if (isNull _gunner || {[_gunner] call EFUNC(common,isPlayer)}) exitWith {};

// selectWeaponTurret has no documented locality, but AI weapon selection follows the gunner rather
// than the turret, and FUNC(proxyWeapon) already ran on whichever machine owns the turret
if !(local _gunner) exitWith {TRACE_2("gunner not local",_vehicle,_gunner)};

if ((_vehicle currentWeaponTurret _turret) isEqualTo _proxyWeapon) exitWith {TRACE_1("already selected",_proxyWeapon)};

TRACE_3("selecting proxy weapon",_vehicle,_turret,_proxyWeapon);
_vehicle selectWeaponTurret [_proxyWeapon, _turret];
