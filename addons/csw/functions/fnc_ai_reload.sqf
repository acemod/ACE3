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

private _turretPath = [_gunner] call EFUNC(common,getTurretIndex);
private _reloadSource = objNull;
private _reloadMag = "";
private _reloadNeededAmmo = -1;

private _cfgMagGroups = configFile >> QGVAR(groups);

private _sources = [_gunner] call FUNC(getNearbySources);

// Find if there is anything we can reload with
// see fnc_reload_getLoadableMagazines, though we don't care about AI pulling from the best ammo possible
{
    scopeName "findSource";
    private _xSource = _x;

    private _cswMagazines = (magazineCargo _xSource) select {isClass (_cfgMagGroups >> _x)};
    TRACE_2("",_xSource,_cswMagazines);

    {
        private _xWeaponMag = _x;
        {
            if ((getNumber (_cfgMagGroups >> _x >> _xWeaponMag)) == 1) then {
                private _loadInfo = [_staticWeapon, _turretPath, _x, _xSource] call FUNC(reload_canLoadMagazine);
                if (_loadInfo select 0) then {
                    _reloadMag = _x;
                    _reloadSource = _xSource;
                    _reloadNeededAmmo = _loadInfo select 2;
                    TRACE_3("found mag",_reloadMag,_reloadSource,_x);
                    breakOut "findSource";
                };
            };
        } forEach _cswMagazines;
    } forEach (compatibleMagazines _weapon);
} forEach _sources;
if (_reloadMag == "") exitWith {TRACE_1("could not find mag",_reloadMag);};

// Figure out what we can add from the magazines we have
private _bestAmmoToSend = -1;
{
    _x params ["_xMag", "_xAmmo"];
    TRACE_2("",_xMag,_xAmmo);
    if (_xMag == _reloadMag) then {
        if ((_bestAmmoToSend == -1) || {(_xAmmo > _bestAmmoToSend) && {_xAmmo <= _reloadNeededAmmo}}) then {
            _bestAmmoToSend = _xAmmo;
        };
    };
} forEach (if (_reloadSource isKindOf "CAManBase") then {magazinesAmmo _reloadSource} else {magazinesAmmoCargo _reloadSource});
TRACE_4("",_reloadSource,_reloadMag,_reloadNeededAmmo,_bestAmmoToSend);
if (_bestAmmoToSend == -1) exitWith {ERROR("No ammo");};

// Remove the mag from the source
[_reloadSource, _reloadMag, _bestAmmoToSend] call EFUNC(common,removeSpecificMagazine);

// see fnc_reload_loadMagazine #L54
// AI never returns ammo and removes the magazine before reloading, so we can skip distance and weaponHolder checks
private _eventParams = [_staticWeapon, _turretPath, objNull, _reloadMag, _bestAmmoToSend, _gunner];

private _timeToLoad = 1;
if !(isNull (configOf _staticWeapon >> QUOTE(ADDON) >> "ammoLoadTime")) then {
    _timeToLoad = getNumber (configOf _staticWeapon >> QUOTE(ADDON) >> "ammoLoadTime");
};

TRACE_1("Reloading in progress",_timeToLoad);
[{
    params ["_staticWeapon", "", "", "", "", "_gunner"];
    if !(alive _staticWeapon && {alive _gunner}) exitWith {TRACE_2("invalid state",alive _staticWeapon,alive _gunner);};

    // Reload the static weapon
    TRACE_5("calling addTurretMag event: AI reload",_staticWeapon,_turretPath,_gunner,_reloadMag,_bestAmmoToSend);
    [QGVAR(addTurretMag), _this] call CBA_fnc_globalEvent;
}, _eventParams, _timeToLoad] call CBA_fnc_waitAndExecute;
