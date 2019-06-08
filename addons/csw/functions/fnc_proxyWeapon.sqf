#include "script_component.hpp"
/*
 * Author: Brandon (TCVM), PabstMirror
 * Handles the use of proxy weapons to fix engine-reload times
 *
 * Arguments:
 * 0: Weapon <OBJECT>
 * 1: Turret <ARRAY>
 * 2: Proxy weapon needed <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [weapon, [0], true] call ace_csw_fnc_proxyWeapon
 *
 * Public: No
 */

params ["_staticWeapon", "_turret", "_needed"];

if (_staticWeapon getVariable [format [QGVAR(proxyHandled_%1), _turret], false]) exitWith { TRACE_1("proxy weapon already handled",_staticWeapon); };

private _typeOf = typeOf _staticWeapon;
private _proxyWeapon = getText(configFile >> "CfgVehicles" >> _typeOf >> "ace_csw" >> "proxyWeapon");
TRACE_5("proxyWeapon",_staticWeapon,_turret,_needed,_typeOf,_proxyWeapon);

if (_proxyWeapon == "") exitWith { TRACE_1("proxyWeapon not defined",_proxyWeapon); };

private _currentWeapon = (_staticWeapon weaponsTurret [0]) param [0, "#none"];
if ((missionNamespace getVariable [_proxyWeapon, objNull]) isEqualType {}) then { // check if string is a function
    TRACE_1("Calling proxyWeapon function",_proxyWeapon);
    _proxyWeapon = [_staticWeapon, _turret, _currentWeapon, _needed] call (missionNamespace getVariable _proxyWeapon);
    _needed = _proxyWeapon != "";
};
if (!_needed) exitWith { TRACE_2("not needed",_needed,_proxyWeapon); };

TRACE_2("swapping to proxy weapon",_currentWeapon,_proxyWeapon);
_staticWeapon removeWeaponTurret [_currentWeapon, _turret];
_staticWeapon addWeaponTurret [_proxyWeapon, _turret];
_staticWeapon setVariable [format [QGVAR(proxyHandled_%1), _turret], true, true];
