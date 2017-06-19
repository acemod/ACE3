/*
 * Author: PabstMirror
 * Cycles fire mode for any missileGuidance enabled ammo that has multiple attack profiles
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_cycleAttackProfileKeyDown
 *
 * Public: No
 */

// #define DEBUG_MODE_FULL
#include "script_component.hpp"

TRACE_1("cycle fire mode",_this);

if (!alive ACE_player) exitWith {};
if (!([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith))) exitWith {};


private ["_currentShooter", "_currentMagazine"];
if (((vehicle ACE_player) == ACE_player) || {ACE_player call CBA_fnc_canUseWeapon}) then {
    _currentShooter = ACE_player;
    _currentMagazine = currentMagazine ACE_player;
} else {
    _currentShooter = vehicle ACE_player;
    private _turretPath = if (ACE_player == (driver _currentShooter)) then {[-1]} else {ACE_player call CBA_fnc_turretPath};
    _currentMagazine = _currentShooter currentMagazineTurret _turretPath;
};
if (_currentMagazine == "") exitWith {TRACE_1("no magazine",_currentMagazine)};

private _ammo = getText (configFile >> "CfgMagazines" >> _currentMagazine >> "ammo");

TRACE_3("",_currentShooter,_currentMagazine,_ammo);

// Bail if guidance is disabled for this ammo
if ((getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "enabled")) != 1) exitWith {TRACE_1("not enabled",_ammo)};

// Verify ammo has explicity added guidance config (ignore inheritances)
private _configs = configProperties [(configFile >> "CfgAmmo" >> _ammo), QUOTE(configName _x == QUOTE(QUOTE(ADDON))), false];
if ((count _configs) < 1) exitWith {TRACE_2("not explicity enabled",_ammo,_configs)};

private _attackProfiles = getArray (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "attackProfiles");
if ((count _attackProfiles) <= 1) exitWith {TRACE_1("no choices for attack profile",_attackProfiles)};

private _currentFireMode = _currentShooter getVariable [QGVAR(attackProfile), "#undefined"];

// Just like onFired, this is case sensitive!
private _index = _attackProfiles find _currentFireMode;
if (_index == -1) then {
    _index = _attackProfiles find (getText (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "defaultAttackProfile"));
};
_index = (_index + 1) % (count _attackProfiles);
private _nextFireMode = _attackProfiles select _index;
TRACE_4("",_currentFireMode,_nextFireMode,_index,_attackProfiles);

_currentShooter setVariable [QGVAR(attackProfile), _nextFireMode, false];

playSound "ACE_Sound_Click";

if ((getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "showHintOnCycle")) == 1) then {
    private _localizedName = getText (configFile >> QGVAR(AttackProfiles) >> _nextFireMode >> "name");
    [_localizedName] call EFUNC(common,displayTextStructured);
};
