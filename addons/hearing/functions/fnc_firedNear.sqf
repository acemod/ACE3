/*
 * Author: KoffeinFlummi, commy2
 * Handles deafness due to large-caliber weapons going off near the player.
 *
 * Arguments:
 * 0: Unit - Object the event handler is assigned to <OBJECT>
 * 1: Firer: Object - Object which fires a weapon near the unit <OBJECT>
 * 2: Distance - Distance in meters between the unit and firer <NUMBER>
 * 3: weapon - Fired weapon <STRING>
 * 4: muzzle - Muzzle that was used <STRING>
 * 5: mod - Current mode of the fired weapon <STRING>
 * 6: ammo - Ammo used <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientFiredNearEvent] call ace_hearing_fnc_firedNear
 *
 * Public: No
 */
#include "script_component.hpp"

//Only run if deafness or ear ringing is enabled:
if ((!GVAR(enableCombatDeafness)) && GVAR(DisableEarRinging)) exitWith {};

params ["_object", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo"];

//Only run if firedNear object is player or player's vehicle:
if ((ACE_player != _object) && {(vehicle ACE_player) != _object}) exitWith {};
if (_weapon in ["Throw", "Put"]) exitWith {};
if (_distance > 50) exitWith {};

private ["_silencer", "_audibleFireCoef", "_loudness", "_strength", "_vehAttenuation", "_magazine", "_muzzles", "_weaponMagazines", "_muzzleMagazines", "_ammoType", "_initSpeed", "_ammoConfig", "_caliber", "_parentClasses"];

_vehAttenuation = if ((ACE_player == (vehicle ACE_player)) || {isTurnedOut ACE_player}) then {1} else {GVAR(playerVehAttenuation)};

_distance = 1 max _distance;

_silencer = call {
    if (primaryWeapon _firer) exitWith {(primaryWeaponItems _firer) select 0};
    if (secondaryWeapon _firer) exitWith {(secondaryWeaponItems _firer) select 0};
    if (handgunWeapon _firer) exitWith {(handgunItems _firer) select 0};
    ""
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
    params ["_magazineType", "_ammoType"];
    if (_ammoType == _ammo) exitWith {
        _magazine = _magazineType;
    };
} count _weaponMagazines;

if (_magazine == "") exitWith {};

_initSpeed = getNumber(configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
_ammoConfig = (configFile >> "CfgAmmo" >> _ammo);
_parentClasses = [_ammoConfig, true] call BIS_fnc_returnParents;
_caliber = getNumber(_ammoConfig >> "ACE_caliber");
_caliber = call {
    if ("ShellBase" in _parentClasses) exitWith { 80 };
    if ("RocketBase" in _parentClasses) exitWith { 200 };
    if ("MissileBase" in _parentClasses) exitWith { 600 };
    if ("SubmunitionBase" in _parentClasses) exitWith { 80 };
    if (_caliber <= 0) then { 6.5 } else { _caliber };
};
_loudness = (_caliber ^ 1.25 / 10) * (_initspeed / 1000) * _audibleFireCoef / 5;
_strength = _vehAttenuation * (_loudness - (_loudness / 50 * _distance)); // linear drop off

//systemChat format["%1 : %2 : %3", _strength, _initSpeed, _parentClasses];
//systemChat format["%1 : %2 : %3", _weapon, _magazine, _initSpeed];

if (_strength < 0.01) exitWith {};

[{_this call FUNC(earRinging)}, [ACE_player, _strength], 0.2, 0] call EFUNC(common,waitAndExecute);
