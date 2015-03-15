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

private ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_silencer", "_audibleFireCoef", "_loudness", "_strength"];

_unit = _this select 0;
_firer = _this select 1;
_distance = (_this select 2) max 1;
_weapon = _this select 3;
_muzzle = _this select 4;
_mode = _this select 5;
_ammo = _this select 6;

if (_weapon in ["Throw", "Put"]) exitWith {};
if (_unit != vehicle _unit && {!([_unit] call EFUNC(common,isTurnedOut))}) exitWith {};

_silencer = switch (_weapon) do {
    case (primaryWeapon _firer) : {(primaryWeaponItems _firer) select 0};
    case (secondaryWeapon _firer) : {(secondaryWeaponItems _firer) select 0};
    case (handgunWeapon _firer) : {(handgunItems _firer) select 0};
    default {""};
};

_audibleFireCoef = 1;
//_audibleFireTimeCoef = 1;
if (_silencer != "") then {
    _audibleFireCoef = getNumber (configFile >> "CfgWeapons" >> _silencer >> "ItemInfo" >> "AmmoCoef" >> "audibleFire");
    //_audibleFireTimeCoef = getNumber (configFile >> "CfgWeapons" >> _silencer >> "ItemInfo" >> "AmmoCoef" >> "audibleFireTime");
};

_audibleFire = getNumber (configFile >> "CfgAmmo" >> _ammo >> "audibleFire");
//_audibleFireTime = getNumber (configFile >> "CfgAmmo" >> _ammo >> "audibleFireTime");

_loudness = _audibleFireCoef * _audibleFire / 64;
_strength = _loudness - (_loudness/50 * _distance); // linear drop off

if (_strength < 0.01) exitWith {};

[{_this call FUNC(earRinging)}, [_unit, _strength], 0.2, 0] call EFUNC(common,waitAndExecute);
