#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Initializes weapon to disable weapon disassembling
 *
 * Arguments:
 * 0: Weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [weapon] call ace_csw_fnc_ai_handleFired
 *
 * Public: No
 */

params ["_staticWeapon", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
TRACE_8("firedEH:",_staticWeapon, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _gunner);

if ((!local _gunner) || {[_gunner] call EFUNC(common,isPlayer)}) exitWith {};
if (someAmmo _staticWeapon) exitWith {};

TRACE_2("need ammo",someAmmo _staticWeapon,magazinesAllTurrets _staticWeapon);

private _turretPath = [_gunner] call EFUNC(common,getTurretIndex);
private _reloadSource = objNull;
private _reloadMag = "";
private _reloadNeededAmmo = -1;

// Find if there is anything we can reload with
{
    scopeName "findSource";
    private _xSource = _x;

    private _cswMagazines  = [];
    {
        if (isClass (configFile >> QGVAR(groups) >> _x)) then { _cswMagazines pushBackUnique _x; };
    } forEach (if (_xSource isKindOf "CaManBase") then {magazines _x} else {magazineCargo _x});
    TRACE_2("",_xSource,_cswMagazines);

    private _compatibleMags = [_magazine] + ([_weapon] call CBA_fnc_compatibleMagazines); // Check current mag first

    {
        private _xWeaponMag = _x;
        {
            if ((getNumber (configFile >> QGVAR(groups) >> _x >> _xWeaponMag)) == 1) then {
                private _loadInfo = [_staticWeapon, _turretPath, _reloadMag, objNull] call FUNC(reload_canLoadMagazine);
                if (_loadInfo select 0) then {
                    _reloadMag = _x;
                    _reloadSource = _xSource;
                    _reloadNeededAmmo = _loadInfo select 2;
                    TRACE_3("found mag",_reloadMag,_reloadSource,_x);
                    breakOut "findSource";
                };
            };
        } forEach _cswMagazines;
    } forEach _compatibleMags;
} forEach ([_gunner] + (_staticWeapon nearEntities [["groundWeaponHolder", "ReammoBox_F"], 10]));
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
} forEach (if (_reloadSource isKindOf "CaManBase") then {magazinesAmmo _reloadSource} else {magazinesAmmoCargo _reloadSource});
TRACE_4("",_reloadSource,_reloadMag,_reloadNeededAmmo,_bestAmmoToSend);
if (_bestAmmoToSend == -1) exitWith {ERROR("No ammo");};

// Remove the mag from the source
if (_reloadSource isKindOf "CaManBase") then {
    [_reloadSource, _reloadMag, _bestAmmoToSend] call EFUNC(common,removeSpecificMagazine);
} else {
    [_reloadSource, _reloadMag, 1, _bestAmmoToSend] call CBA_fnc_removeMagazineCargo;
};

private _timeToLoad = 1;
if (!isNull(configFile >> "CfgVehicles" >> (typeOf _staticWeapon) >> QUOTE(ADDON) >> "ammoLoadTime")) then {
    _timeToLoad = getNumber(configFile >> "CfgVehicles" >> (typeOf _staticWeapon) >> QUOTE(ADDON) >> "ammoLoadTime");
};

TRACE_1("Reloading in progress",_timeToLoad);
[{
    params ["_staticWeapon", "_turretPath", "_gunner", "_reloadMag", "_bestAmmoToSend"];
    if ((!alive _staticWeapon) || {!alive _gunner} || {(_staticWeapon distance _gunner) > 10}) exitWith {TRACE_1("invalid state",_this);};

    // Reload the static weapon
    TRACE_5("calling addTurretMag event",_staticWeapon, _turretPath, _gunner, _reloadMag, _bestAmmoToSend);
    [QGVAR(addTurretMag), _this] call CBA_fnc_globalEvent;
}, [_staticWeapon, _turretPath, _gunner, _reloadMag, _bestAmmoToSend], _timeToLoad] call CBA_fnc_waitAndExecute;
