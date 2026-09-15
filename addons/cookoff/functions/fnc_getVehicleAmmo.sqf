#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Gets all magazines inside of an object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: If the virtual magazine count should be set <BOOL> (default: false)
 *
 * Return Value:
 * 0: Ammo array <ARRAY>
 * - 0: Magazine classname <STRING>
 * - 1: Ammo count <NUMBER>
 * - 2: If a projectile should be spawned upon detonation <BOOL>
 * - 3: Additional info for detonation <ARRAY or BOOL>
 * 1: Total ammo count <NUMBER>
 *
 * Example:
 * cursorObject call ace_cookoff_fnc_getVehicleAmmo
 *
 * Public: No
 */

params ["_object", ["_setVirtualAmmoCount", false]];
TRACE_1("getVehicleAmmo",_object);

private _ammoToDetonate = [];
private _totalAmmo = 0;
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgAmmo = configFile >> "CfgAmmo";
private _ammo = "";

// Get ammo from turrets
{
    // If the turret is an FFV seat, it takes magazines from the soldier
    _x params ["_magazine", "_turretPath", "_count"];

    if (_count > 0 && {!(_magazine call FUNC(isMagazineFlare))}) then {
        _ammo = getText (_cfgMagazines >> _magazine >> "ammo");

        if (getText (_cfgAmmo >> _ammo >> "model") == "\A3\weapons_f\empty") then {
            TRACE_2("skipping",_magazine,_ammo);

            continue;
        };

        _ammoToDetonate pushBack [_magazine, _count, true, _turretPath];
        _totalAmmo = _totalAmmo + _count;
    };
} forEach (magazinesAllTurrets [_object, true]);

// Get ammo from cargo space
{
    _x params ["_magazine", "_count"];

    if (_count > 0 && {!(_magazine call FUNC(isMagazineFlare))}) then {
        _ammoToDetonate pushBack [_magazine, _count, random 1 < 0.5, false];
        _totalAmmo = _totalAmmo + _count;
    };
} forEach (magazinesAmmoCargo _object);

private _virtualAmmo = _object getVariable QGVAR(virtualMagazines);

if (isNil "_virtualAmmo") then {
    // Get ammo from transportAmmo / ace_rearm
    private _configVehicle = configOf _object;
    private _configSupply = (getNumber (_configVehicle >> "transportAmmo")) max (getNumber (_configVehicle >> QEGVAR(rearm,defaultSupply)));

    _virtualAmmo = [];

    if (_object getVariable [QEGVAR(rearm,isSupplyVehicle), _configSupply > 0]) then {
        TRACE_1("transportAmmo vehicle - adding virtual ammo",typeOf _object);

        _virtualAmmo pushBack ["2000Rnd_65x39_belt", 2000, false, true];
        _totalAmmo = _totalAmmo + 2000;

        _virtualAmmo pushBack ["20Rnd_105mm_HEAT_MP", 100, true, true];
        _totalAmmo = _totalAmmo + 100;

        _virtualAmmo pushBack ["SatchelCharge_Remote_Mag", 10, true, true];
        _totalAmmo = _totalAmmo + 10;
    };

    if (_setVirtualAmmoCount) then {
        _object setVariable [QGVAR(virtualMagazines), _virtualAmmo];
    };
} else {
    {
        _totalAmmo = _totalAmmo + (_x select 1);
    } forEach _virtualAmmo;
};

_ammoToDetonate append _virtualAmmo;

[_ammoToDetonate, _totalAmmo]
