/*
 * Author: KoffeinFlummi, commy2
 * Handles deafness due to large-caliber weapons going off near the player.
 *
 * Arguments:
 * 0: Unit - Object the event handler is assigned to <OBJECT>
 * 1: Firer: Object - Object which fires a weapon near the unit <OBJECT>
 * 2: Distance - Distance in meters between the unit and firer <NUMBER>
 * 3: weapon - Fired weapon <STRING>
 * 4: muzzle - Muzzle that was used (not used) <STRING>
 * 5: mode - Current mode of the fired weapon (not used) <STRING>
 * 6: ammo - Ammo used <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientFiredNearEvent] call ace_hearing_fnc_firedNear
 * [player, player, 10, "arifle_MX_ACO_pointer_F", "arifle_MX_ACO_pointer_F", "single", "B_65x39_Caseless"] call ace_hearing_fnc_firedNear
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object", "_firer", "_distance", "_weapon", "", "", "_ammo"];

if (_weapon in ["Throw", "Put"]) exitWith {};
if (_distance > 50) exitWith {};

private _vehAttenuation = if ((ACE_player == (vehicle ACE_player)) || {isTurnedOut ACE_player}) then {1} else {GVAR(playerVehAttenuation)};
private _distance = 1 max _distance;

private _silencer = switch (_weapon) do {
    case (primaryWeapon _firer) : {(primaryWeaponItems _firer) select 0};
    case (secondaryWeapon _firer) : {(secondaryWeaponItems _firer) select 0};
    case (handgunWeapon _firer) : {(handgunItems _firer) select 0};
    default {""};
};

private _audibleFireCoef = 1;
if (_silencer != "") then {
    _audibleFireCoef = getNumber (configFile >> "CfgWeapons" >> _silencer >> "ItemInfo" >> "AmmoCoef" >> "audibleFire");
};

private _loudness = GVAR(cacheAmmoLoudness) getVariable (format ["%1%2",_weapon,_ammo]);
if (isNil "_loudness") then {
    private _muzzles = getArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles");
    private _weaponMagazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
    {
        if (_x != "this") then {
            private _muzzleMagazines = getArray (configFile >> "CfgWeapons" >> _weapon >> _x >> "magazines");
            _weaponMagazines append _muzzleMagazines;
        };
    } count _muzzles;
    {
        private _ammoType = getText(configFile >> "CfgMagazines" >> _x >> "ammo");
        _weaponMagazines set [_forEachIndex, [_x, _ammoType]];
    } forEach _weaponMagazines;

    private _magazine = "";
    {
        _x params ["_magazineType", "_ammoType"];
        if (_ammoType == _ammo) exitWith {
            _magazine = _magazineType;
        };
    } count _weaponMagazines;

    if (_magazine == "") then {
        _loudness = 0;
        TRACE_2("No mag for Weapon/Ammo??",_weapon,_ammo);
    } else {
        private _initSpeed = getNumber(configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
        private _caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_caliber");
        _caliber = call {
            // If explicilty defined, use ACE_caliber
            if ((count configProperties [(configFile >> "CfgAmmo" >> _ammo), "configName _x == 'ACE_caliber'", false]) == 1) exitWith {_caliber};
            if (_ammo isKindOf ["ShellBase", (configFile >> "CfgAmmo")]) exitWith { 80 };
            if (_ammo isKindOf ["RocketBase", (configFile >> "CfgAmmo")]) exitWith { 200 };
            if (_ammo isKindOf ["MissileBase", (configFile >> "CfgAmmo")]) exitWith { 600 };
            if (_ammo isKindOf ["SubmunitionBase", (configFile >> "CfgAmmo")]) exitWith { 80 };
            if (_caliber <= 0) then { 6.5 } else { _caliber };
        };

        _loudness = (_caliber ^ 1.25 / 10) * (_initspeed / 1000) / 5;
        TRACE_6("building cache",_weapon,_ammo,_magazine,_initSpeed,_caliber,_loudness);
    };
    GVAR(cacheAmmoLoudness) setVariable [(format ["%1%2",_weapon,_ammo]), _loudness];
};

_loudness = _loudness * _audibleFireCoef;
private _strength = _vehAttenuation * (_loudness - (_loudness / 50 * _distance)); // linear drop off

TRACE_1("result",_strength);

if (_strength < 0.01) exitWith {};

// Call inmediately, as it will get pick up later anyway by the update thread
[_strength] call FUNC(earRinging);
