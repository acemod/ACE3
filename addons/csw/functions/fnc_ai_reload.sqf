#include "..\script_component.hpp"
/*
 * Author: PabstMirror, LinkIsGrim
 * Handles AI reloading.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Gunner <OBJECT>
 * 2: Weapon <STRING>
 * 3: Magazine <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_vehicle", "_gunner", "_weapon", ["_magazine", ""]];

private _isProxy = _gunner getVariable [QGVAR(autofire_isProxy), false];
TRACE_2("checking for proxy",_gunner,_isProxy);
if (_isProxy) exitWith {};

private _turretPath = [_gunner] call EFUNC(common,getTurretIndex);
private _reloadSource = objNull;
private _reloadMag = "";
private _reloadNeededAmmo = -1;

private _cfgMagGroups = configFile >> QGVAR(groups);

private _nearSupplies = [_gunner] + ((_vehicle nearSupplies 10) select {
    isNull (group _x) ||
    {!([_x] call EFUNC(common,isPlayer)) && {[side group _gunner, side group _x] call BIS_fnc_sideIsFriendly}}
});

// Find if there is anything we can reload with
{
    scopeName "findSource";
    private _xSource = _x;

    private _cswMagazines  = [];
    {
        _cswMagazines pushBackUnique _x;
    } forEach ((magazineCargo _xSource) select {isClass (_cfgMagGroups >> _x)});
    TRACE_2("",_xSource,_cswMagazines);

    private _compatibleMags = compatibleMagazines _weapon;
    if (_magazine != "") then {
        _compatibleMags insert [0, [_magazine]];
    };

    {
        private _xWeaponMag = _x;
        {
            if ((getNumber (_cfgMagGroups >> _x >> _xWeaponMag)) == 1) then {
                private _loadInfo = [_vehicle, _turretPath, _x, _xSource] call FUNC(reload_canLoadMagazine);
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
} forEach _nearSupplies;
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

private _timeToLoad = 1;
if (!isNull(configOf _vehicle >> QUOTE(ADDON) >> "ammoLoadTime")) then {
    _timeToLoad = getNumber(configOf _vehicle >> QUOTE(ADDON) >> "ammoLoadTime");
};

TRACE_1("Reloading in progress",_timeToLoad);
[{
    params ["_vehicle", "_turretPath", "_gunner", "_reloadMag", "_bestAmmoToSend"];
    if ((!alive _vehicle) || {!alive _gunner} || {(_vehicle distance _gunner) > 10}) exitWith {TRACE_1("invalid state",_this);};

    // Reload the static weapon
    TRACE_5("calling addTurretMag event",_vehicle,_turretPath,_gunner,_reloadMag,_bestAmmoToSend);
    [QGVAR(addTurretMag), _this] call CBA_fnc_globalEvent;
}, [_vehicle, _turretPath, _gunner, _reloadMag, _bestAmmoToSend], _timeToLoad] call CBA_fnc_waitAndExecute;
