#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Gets all magazines inside of an object.
 *
 * Arguments:
 * 0: Object <OBJECT>
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

params ["_object"];
TRACE_1("getVehicleAmmo",_object);

private _ammoToDetonate = [];
private _totalAmmo = 0;
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgAmmo = configFile >> "CfgAmmo";
private _ammo = "";

// Get ammo from turrets
{
    // If the turret is an FFV seat, it takes magazines from the soldier
    _x params ["_magazine", "", "_count"];

    if (_count > 0 && {!(_magazine call FUNC(isMagazineFlare))}) then {
        _ammo = getText (_cfgMagazines >> _magazine >> "ammo");

        if (getText (_cfgAmmo >> _ammo >> "model") == "\A3\weapons_f\empty") then {
            TRACE_2("skipping",_magazine,_ammo);

            continue;
        };

        _ammoToDetonate pushBack [_magazine, _count, true];
        _totalAmmo = _totalAmmo + _count;
    };
} forEach (magazinesAllTurrets [_object, true]);

// Get ammo from cargo space
{
    _x params ["_magazine", "_count"];

    if (_count > 0 && {!(_magazine call FUNC(isMagazineFlare))}) then {
        _ammoToDetonate pushBack [_magazine, _count, random 1 < 0.5];
        _totalAmmo = _totalAmmo + _count;
    };
} forEach (magazinesAmmoCargo _object);

// Get ammo from transportAmmo / ace_rearm
private _configVehicle = configOf _object;
private _configSupply = (getNumber (_configVehicle >> "transportAmmo")) max (getNumber (_configVehicle >> QEGVAR(rearm,defaultSupply)));

if (_object getVariable [QEGVAR(rearm,isSupplyVehicle), _configSupply > 0]) then {
    TRACE_1("transportAmmo vehicle - adding virtual ammo",typeOf _object);

    _ammoToDetonate pushBack ["2000Rnd_65x39_belt", 2000, false];
    _totalAmmo = _totalAmmo + 2000;

    _ammoToDetonate pushBack ["20Rnd_105mm_HEAT_MP", 100, true];
    _totalAmmo = _totalAmmo + 100;

    _ammoToDetonate pushBack ["SatchelCharge_Remote_Mag", 10, true];
    _totalAmmo = _totalAmmo + 10;
};

[_ammoToDetonate, _totalAmmo]
