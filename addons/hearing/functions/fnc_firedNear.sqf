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
 * 5: Current mode of the fired weapon <STRING> (unused)
 * 6: Ammo <STRING>
 * 7: Unit that fired the weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player, 10, "arifle_MX_ACO_pointer_F", "arifle_MX_ACO_pointer_F", "single", "B_65x39_Caseless", player] call ace_hearing_fnc_firedNear
 *
 * Public: No
 */

params ["", "_firer", "_distance", "_weapon", "_muzzle", "", "_ammo", "_gunner"];

if (_weapon in ["Throw", "Put"]) exitWith {};
if (_distance > 50) exitWith {};

private _vehAttenuation = [GVAR(playerVehAttenuation), 1] select (
    (ACE_player == (vehicle ACE_player)) || {isTurnedOut ACE_player}
);
private _distance = 1 max _distance;
private _audibleFireCoef = 1;

private _magazine = if (_gunner == _firer) then {
    // Unit that is firing is on foot
    private _weaponItems = weaponsItems [_firer, true];
    private _index = _weaponItems findIf {(_x select 0) == _weapon};

    if (_index == -1) exitWith {""};

    _weaponItems = _weaponItems select _index;

    // Check if the unit has a suppressor
    private _suppressor = _weaponItems select 1;

    if (_suppressor != "") then {
        _audibleFireCoef = getNumber (configFile >> "CfgWeapons" >> _suppressor >> "ItemInfo" >> "AmmoCoef" >> "audibleFire");
    };

    // Check if the secondary muzzle was fired; If not, assume it's the primary muzzle
    if (_weaponItems select 5 param [2, ""] == _muzzle) then {
        _weaponItems select 5 param [0, ""]
    } else {
        _weaponItems select 4 param [0, ""]
    };
} else {
    // Unit that is firing is in a vehicle
    _firer currentMagazineTurret (_firer unitTurret _gunner)
};

if (_magazine == "") exitWith {
    TRACE_5("No mag for weapon/ammo??",_weapon,_muzzle,_ammo,_firer,_gunner);
};

private _loudness = [_magazine, _ammo] call FUNC(getAmmoLoudness);

_loudness = _loudness * _audibleFireCoef;
private _strength = _vehAttenuation * (_loudness - (_loudness / 50 * _distance)); // linear drop off

TRACE_1("result",_strength);

if (_strength < 0.01) exitWith {};

// Call inmediately, as it will get pick up later anyway by the update thread
[_strength] call FUNC(earRinging);
