#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2
 * Handles deafness due to large-caliber weapons going off near the player.
 *
 * Arguments:
 * 0: Object the event handler is assigned to <OBJECT> (unused)
 * 1: Object which fires a weapon near the unit <OBJECT>
 * 2: Distance in meters between the unit and firer <NUMBER>
 * 3: Weapon <STRING>
 * 4: Muzzle <STRING>
 * 5: Current mode of the fired weapon <STRING>
 * 6: Ammo <STRING>
 * 7: Unit that fired the weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player, 10, "arifle_MX_ACO_pointer_F", "arifle_MX_ACO_pointer_F", "single", "B_65x39_Caseless", player] call ace_hearing_fnc_firedNear
 *
 * Public: No
 */

params ["", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];

if (_weapon in ["Throw", "Put"]) exitWith {};
if (_distance > 50) exitWith {};

_distance = 1 max _distance;
private _audibleFireCoef = 1;

// Unit that fired is on foot
private _magazine = if (_gunner == _firer) then {
    // Check if the unit has a suppressor
    private _suppressor = (_firer weaponAccessories _weapon) select 0;

    if (_suppressor != "") then {
        _audibleFireCoef = getNumber (configFile >> "CfgWeapons" >> _suppressor >> "ItemInfo" >> "AmmoCoef" >> "audibleFire");
    };

    (_firer weaponState _muzzle) select 3
} else {
    // Unit that fired is in a vehicle
    (weaponState [_firer, _firer unitTurret _gunner, _weapon, _muzzle, _mode]) select 3
};

if (_magazine == "") exitWith {
    TRACE_5("No mag for weapon/ammo??",_weapon,_muzzle,_ammo,_firer,_gunner);
};

TRACE_6("mag",_magazine,_weapon,_muzzle,_ammo,_firer,_gunner);

private _vehAttenuation = [EGVAR(common,playerVehAttenuation), 1] select (isNull objectParent ACE_player || {isTurnedOut ACE_player});
private _loudness = _magazine call FUNC(getAmmoLoudness);

_loudness = _loudness * _audibleFireCoef;
private _strength = _vehAttenuation * (_loudness - (_loudness / 50 * _distance)); // linear drop off

TRACE_1("result",_strength);

// Call immediately, as it will get picked up later by the update thread anyway
_strength call FUNC(earRinging);
