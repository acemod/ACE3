#include "script_component.hpp"
/*
 * Author: PabstMirror, modified by Grim
 * Handles AI reloading
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Gunner <OBJECT>
 * 2: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_staticWeapon", "_gunner", "_weapon"];
TRACE_3("AI reload",_staticWeapon,_gunner,_weapon);

private _loadableMagazines = [_staticWeapon, _gunner, true] call FUNC(reload_getLoadableMagazines);
if (_loadableMagazines isEqualTo []) exitWith {TRACE_1("could not find reloadable mag",_staticWeapon)};

private _bestAmmo = 0;
private _magazineInfo = [];
{
    _x params ["", "", "", "", "", "_ammo"];
    if (_ammo > _bestAmmo) then {
        _bestAmmo = _ammo;
        _magazineInfo = _x;
    };
} forEach _loadableMagazines;

_magazineInfo params ["_carryMag", "_turretPath", "_loadInfo", "_magSource", "", "_ammo"];

// Remove the mag from the source
[_magSource, _carryMag, _ammo] call EFUNC(common,removeSpecificMagazine);

// see fnc_reload_loadMagazine #L54
// AI never returns ammo and removes the magazine before reloading, so we can skip distance and weaponHolder checks
private _eventParams = [_staticWeapon, _turretPath, objNull, _carryMag, _ammo, _gunner];

private _timeToLoad = GET_NUMBER(configOf _staticWeapon >> QUOTE(ADDON) >> "ammoLoadTime", 1);

TRACE_1("Reloading in progress",_timeToLoad);
[{
    params ["_staticWeapon", "", "", "", "", "_gunner"];
    if !(alive _staticWeapon && {alive _gunner}) exitWith {TRACE_2("invalid state",alive _staticWeapon,alive _gunner);};

    // Reload the static weapon
    TRACE_1("calling addTurretMag event: AI reload",_this);
    [QGVAR(addTurretMag), _this] call CBA_fnc_globalEvent;
}, _eventParams, _timeToLoad] call CBA_fnc_waitAndExecute;
