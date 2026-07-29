#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Points a gunner at the proxy weapon that just replaced the one they had selected.
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

if (isNull _gunner) exitWith {};

// selectWeaponTurret has no documented locality, but weapon selection follows the gunner rather than
// the turret, and FUNC(proxyWeapon) already ran on whichever machine owns the turret
if !(local _gunner) exitWith {TRACE_2("gunner not local",_vehicle,_gunner)};

// Only step in when the selection no longer exists, which is what the swap just did to it. A gunner
// who still has a valid weapon picked it deliberately, including a player cycling turret weapons
private _selected = _vehicle currentWeaponTurret _turret;
if (_selected in (_vehicle weaponsTurret _turret)) exitWith {TRACE_1("selection still valid",_selected)};

TRACE_4("selecting proxy weapon",_vehicle,_turret,_selected,_proxyWeapon);
_vehicle selectWeaponTurret [_proxyWeapon, _turret];
