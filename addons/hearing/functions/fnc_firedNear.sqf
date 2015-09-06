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

//Only run if deafness or ear ringing is enabled:
if ((!GVAR(enableCombatDeafness)) && GVAR(DisableEarRinging)) exitWith {};

params ["_object", "_firer", "_distance", "_weapon", "", "", "_ammo"];

//Only run if firedNear object is player or player's vehicle:
if ((ACE_player != _object) && {(vehicle ACE_player) != _object}) exitWith {};
if (_weapon in ["Throw", "Put"]) exitWith {};
if (_distance > 50) exitWith {};
private ["_silencer", "_audibleFireCoef", "_loudness", "_strength", "_vehAttenuation", "_magazine", "_muzzles", "_weaponMagazines", "_muzzleMagazines", "_ammoType", "_initSpeed", "_ammoConfig", "_caliber", "_loudnessCoef"];

_vehAttenuation = if ((ACE_player == (vehicle ACE_player)) || {isTurnedOut ACE_player}) then {1} else {GVAR(playerVehAttenuation)};

_distance = 1 max _distance;

_silencer = switch (_weapon) do {
    case (primaryWeapon _firer) : {(primaryWeaponItems _firer) select 0};
    case (secondaryWeapon _firer) : {(secondaryWeaponItems _firer) select 0};
    case (handgunWeapon _firer) : {(handgunItems _firer) select 0};
    default {""};
};

_audibleFireCoef = 1;
if (_silencer != "") then {
    _audibleFireCoef = getNumber (configFile >> "CfgWeapons" >> _silencer >> "ItemInfo" >> "AmmoCoef" >> "audibleFire");
};

_weaponMagazines = missionNamespace getVariable [format[QEGVAR(common,weaponMagazines_%1),_weapon], []];
if (count _weaponMagazines == 0) then {
    _muzzles = getArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles");
    _weaponMagazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
    {
        if (_x != "this") then {
            _muzzleMagazines = getArray (configFile >> "CfgWeapons" >> _weapon >> _x >> "magazines");
            _weaponMagazines append _muzzleMagazines;
        };
    } count _muzzles;
    {
        _ammoType = getText(configFile >> "CfgMagazines" >> _x >> "ammo");
        _weaponMagazines set [_forEachIndex, [_x, _ammoType]];
    } forEach _weaponMagazines;
    missionNamespace setVariable [format[QEGVAR(common,weaponMagazines_%1),_weapon], _weaponMagazines];
};

_magazine = "";
{
    _x params ["_magazineType", "_ammoType"];
    if (_ammoType == _ammo) exitWith {
        _magazine = _magazineType;
    };
} count _weaponMagazines;

if (_magazine == "") exitWith {};

_initSpeed = getNumber(configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
_ammoConfig = (configFile >> "CfgAmmo" >> _ammo);
_caliber = getNumber(_ammoConfig >> "ACE_caliber");
_caliber = call {
    if (_ammo isKindOf ["ShellBase", (configFile >> "CfgAmmo")]) exitWith { 80 };
    if (_ammo isKindOf ["RocketBase", (configFile >> "CfgAmmo")]) exitWith { 200 };
    if (_ammo isKindOf ["MissileBase", (configFile >> "CfgAmmo")]) exitWith { 600 };
    if (_ammo isKindOf ["SubmunitionBase", (configFile >> "CfgAmmo")]) exitWith { 80 };
    if (_caliber <= 0) then { 6.5 } else { _caliber };
};
_loudness = (_caliber ^ 1.25 / 10) * (_initspeed / 1000) * _audibleFireCoef / 5;

_loudnessCoef = getNumber (_ammoConfig >> QGVAR(loudnessCoef);
if (_loudnessCoef >= 0) then {
    _loudness = _loudness * _loudnessCoef;
};

_strength = _vehAttenuation * (_loudness - (_loudness / 50 * _distance)); // linear drop off


//systemChat format["%1 : %2", _strength, _initSpeed];
//systemChat format["%1 : %2 : %3", _weapon, _magazine, _initSpeed];

if (_strength < 0.01) exitWith {};

[{_this call FUNC(earRinging)}, [ACE_player, _strength], 0.2] call EFUNC(common,waitAndExecute);
