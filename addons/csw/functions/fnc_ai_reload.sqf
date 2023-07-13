#include "script_component.hpp"
/*
 * Author: PabstMirror, LinkIsGrim
 * Handles AI reloading
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Gunner <OBJECT>
 * 2: Skip reload time <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_vehicle", "_gunner", ["_instantReload", false]];
TRACE_3("AI reload",_vehicle,_gunner,_instantReload);

private _loadableMagazines = [_vehicle, _gunner, true] call FUNC(reload_getLoadableMagazines);
if (_loadableMagazines isEqualTo []) exitWith {TRACE_1("could not find reloadable mag",_vehicle)};

// API, to be used by artillerytables
private _forcedMag = _vehicle getVariable [QGVAR(forcedMag), ""];

// If this is called while CSW has ammo, unload mags in gunner's turret
if (someAmmo _vehicle) then {[_vehicle, _gunner, [_gunner] call EFUNC(common,getTurretIndex)] call FUNC(ai_unloadMagazine)};

private _bestAmmo = 0;
private _magazineInfo = [];
{
    _x params ["_xMag", "", "", "", "", "_ammo"];
    if (_forcedMag isNotEqualTo "" && {_xMag != _forcedMag}) then {continue};
    if (_ammo > _bestAmmo) then {
        _bestAmmo = _ammo;
        _magazineInfo = _x;
    };
} forEach _loadableMagazines;

if (_magazineInfo isEqualTo []) exitWith {};
_magazineInfo params ["_carryMag", "_turretPath", "_loadInfo", "_magSource", "", "_ammo"];

// Remove the mag from the source
[_magSource, _carryMag, _ammo] call EFUNC(common,removeSpecificMagazine);

// AI never returns ammo and removes the magazine before reloading, so we can skip distance and weaponHolder checks
private _eventParams = [_vehicle, _turretPath, objNull, _carryMag, _ammo, _gunner];

if (_instantReload) exitWith {
    TRACE_1("calling addTurretMag event: instant AI reload",_this);
    [QGVAR(addTurretMag), _eventParams] call CBA_fnc_globalEvent;
};

private _timeToLoad = GET_NUMBER(configOf _vehicle >> QUOTE(ADDON) >> "ammoLoadTime", 1);

TRACE_1("Reloading in progress",_timeToLoad);
[{
    params ["_vehicle", "", "", "", "", "_gunner"];
    if !(alive _vehicle && {alive _gunner}) exitWith {TRACE_2("invalid state",alive _vehicle,alive _gunner);};

    // Reload the static weapon
    TRACE_1("calling addTurretMag event: AI reload",_this);
    [QGVAR(addTurretMag), _this] call CBA_fnc_globalEvent;
}, _eventParams, _timeToLoad] call CBA_fnc_waitAndExecute;
