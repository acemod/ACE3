#include "..\script_component.hpp"
/*
 * Author: tcvm, PabstMirror
 * Handles the use of proxy weapons to fix engine-reload times.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Turret <ARRAY>
 * 2: Proxy weapon needed <BOOL>
 * 3: Weapon should be emptied <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, [0], true, false] call ace_csw_fnc_proxyWeapon
 *
 * Public: No
 */

params ["_vehicle", "_turret", "_needed", "_emptyWeapon"];
TRACE_4("proxyWeapon",_vehicle,_turret,_needed,_emptyWeapon);

// addWeaponTurret/removeWeaponTurret need to be executed where turret is local
if !(_vehicle turretLocal _turret) exitWith {
    WARNING_2("[%1]'s turret [%2] isn't local, skipping proxy weapon change",_vehicle,_turret);
};

if (_vehicle getVariable [format [QGVAR(proxyHandled_%1), _turret], false]) exitWith { TRACE_1("already handled",typeOf _vehicle); };

private _proxyWeapon = getText (configOf _vehicle >> QUOTE(ADDON) >> "proxyWeapon");

TRACE_2("",typeOf _vehicle,_proxyWeapon);
if (_proxyWeapon == "") exitWith {};

private _currentWeapon = (_vehicle weaponsTurret [0]) param [0, "#none"];
if ((missionNamespace getVariable [_proxyWeapon, objNull]) isEqualType {}) then { // check if string is a function
    TRACE_1("Calling proxyWeapon function",_proxyWeapon);
    // This function may replace magazines or do other things to the static weapon
    _proxyWeapon = [_vehicle, _turret, _currentWeapon, _needed, _emptyWeapon] call (missionNamespace getVariable _proxyWeapon);
    _needed = _proxyWeapon != "";
};
if (!_needed) exitWith { TRACE_2("not needed",_needed,_proxyWeapon); };

// Rearm compatibility, prevent reloading entire static and breaking CSW
_vehicle setVariable [QEGVAR(rearm,scriptedLoadout), true, true];

TRACE_2("swapping to proxy weapon",_currentWeapon,_proxyWeapon);
_vehicle removeWeaponTurret [_currentWeapon, _turret];
_vehicle addWeaponTurret [_proxyWeapon, _turret];
_vehicle setVariable [format [QGVAR(proxyHandled_%1), _turret], true, true];
