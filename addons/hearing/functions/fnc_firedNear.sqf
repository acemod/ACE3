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

private ["_silencer", "_audibleFireCoef", "_audibleFire", "_loudness", "_strength", "_vehAttenuation"];

PARAMS_7(_object,_firer,_distance,_weapon,_muzzle,_mode,_ammo);

//Only run if combatDeafness enabled:
if (!GVAR(enableCombatDeafness)) exitWith {};
//Only run if firedNear object is player or player's vehicle:
if ((ACE_player != _object) && {(vehicle ACE_player) != _object}) exitWith {};
if (_weapon in ["Throw", "Put"]) exitWith {};

_vehAttenuation = if ((ACE_player == (vehicle ACE_player)) || {isTurnedOut ACE_player}) then {1} else {GVAR(playerVehAttenuation)};

if (_distance < 1) then {_distance = 1;};

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

_magazine = (getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0;
_initSpeed = getNumber(configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
_caliber = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_caliber");
if (_caliber <= 0) then { _caliber = 6.5; };
_loudness = (_caliber ^ 1.25 / 10) * (_initspeed / 1000) * _audibleFireCoef / 5;
_strength = _vehAttenuation * (_loudness - (_loudness / 50 * _distance)); // linear drop off

if (_strength < 0.01) exitWith {};

[{_this call FUNC(earRinging)}, [ACE_player, _strength], 0.2, 0] call EFUNC(common,waitAndExecute);
