#include "..\script_component.hpp"
/*
 * Author: PabstMirror, LinkIsGrim
 * Handles AI reloading.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Gunner <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, gunner cursorObject] call ace_csw_fnc_ai_reload
 *
 * Public: No
 */

params ["_vehicle", "_gunner"];
TRACE_2("AI reload",_vehicle,_gunner);

// Proxy gunners are scripted, they do not carry or load anything
if (_gunner getVariable [QGVAR(autofire_isProxy), false]) exitWith {TRACE_1("proxy gunner",_gunner)};

// The turret is derived from the gunner rather than from a weapon argument. What weapon the CSW has
// selected is not an answerable question on GetIn: nothing has been fired yet, and FUNC(proxyWeapon)
// has just swapped the turret's weapon out from under it
private _loadableMagazines = [_vehicle, _gunner, true] call FUNC(reload_getLoadableMagazines);
if (_loadableMagazines isEqualTo []) exitWith {TRACE_1("no loadable mag",_vehicle)};

private _bestAmmo = -1;
private _magazineInfo = [];

{
    if ((_x select 4) > _bestAmmo) then {
        _bestAmmo = _x select 4;
        _magazineInfo = _x;
    };
} forEach _loadableMagazines;

_magazineInfo params ["_carryMag", "_turretPath", "", "_magSource", "_ammo"];

// Remove the mag from the source
[_magSource, _carryMag, _ammo] call EFUNC(common,removeSpecificMagazine);

// Leftover ammo goes back to the gunner
private _eventParams = [_vehicle, _turretPath, _carryMag, _ammo, _gunner];

private _timeToLoad = GET_NUMBER(configOf _vehicle >> QUOTE(ADDON) >> "ammoLoadTime",1);
TRACE_1("Reloading in progress",_timeToLoad);

[{
    params ["_vehicle", "_turretPath", "", "", "_gunner"];
    if !(alive _vehicle && {alive _gunner}) exitWith {TRACE_2("invalid state",alive _vehicle,alive _gunner)};

    TRACE_1("calling addTurretMag event",_this);
    [QGVAR(addTurretMag), _this, _vehicle, _turretPath] call CBA_fnc_turretEvent;
}, _eventParams, _timeToLoad] call CBA_fnc_waitAndExecute;
