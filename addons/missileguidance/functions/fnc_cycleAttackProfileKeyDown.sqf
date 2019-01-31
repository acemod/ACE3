#include "script_component.hpp"
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

TRACE_1("cycle fire mode",_this);

if (!alive ACE_player) exitWith {};
if (!([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith))) exitWith {};


private _currentShooter = objNull;
private _currentMagazine = "";
private _turretPath = [];
if (isNull (ACE_controlledUAV param [0, objNull])) then {
    if (((vehicle ACE_player) == ACE_player) || {ACE_player call CBA_fnc_canUseWeapon}) then {
        _currentShooter = ACE_player;
        _currentMagazine = currentMagazine ACE_player;
    } else {
        _currentShooter = vehicle ACE_player;
        _turretPath = if (ACE_player == (driver _currentShooter)) then {[-1]} else {ACE_player call CBA_fnc_turretPath};
        _currentMagazine = _currentShooter currentMagazineTurret _turretPath;
    };
} else {
    _currentShooter = ACE_controlledUAV select 0;
    _turretPath = ACE_controlledUAV select 2;
    _currentMagazine = _currentShooter currentMagazineTurret _turretPath;
};

if (_currentMagazine == "") exitWith {TRACE_1("no magazine",_currentMagazine)};

private _ammo = getText (configFile >> "CfgMagazines" >> _currentMagazine >> "ammo");

TRACE_3("",_currentShooter,_currentMagazine,_ammo);

// Bail if guidance is disabled for this ammo
if ((getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "enabled")) != 1) exitWith {TRACE_1("not enabled",_ammo)};

private _useModeForAttackProfile = (getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "useModeForAttackProfile")) == 1;
private _weaponStateToken = if (_currentShooter isEqualTo ACE_player) then { _currentShooter } else { [_currentShooter, _turretPath] };
(weaponState _weaponStateToken) params ["_weapon", "", "_mode"];
TRACE_4("",_useModeForAttackProfile,_weaponStateToken,_weapon,_mode);

// Verify ammo has explicity added guidance config (ignore inheritances)
private _configs = configProperties [(configFile >> "CfgAmmo" >> _ammo), QUOTE(configName _x == QUOTE(QUOTE(ADDON))), false];
if ((count _configs) < 1) exitWith {TRACE_2("not explicity enabled",_ammo,_configs)};

private _attackProfiles = getArray (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "attackProfiles");
if ((count _attackProfiles) <= 1) exitWith {TRACE_1("no choices for attack profile",_attackProfiles)};

private _currentFireMode = if (_useModeForAttackProfile) then {
    getText (configFile >> "CfgWeapons" >> _weapon >> _mode >> QGVAR(attackProfile))
} else {
    _currentShooter getVariable [QGVAR(attackProfile), "#undefined"]
};

// Just like onFired, this is case sensitive!
private _index = _attackProfiles find _currentFireMode;
if (_index == -1) then {
    _index = _attackProfiles find (getText (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "defaultAttackProfile"));
};
_index = (_index + 1) % (count _attackProfiles);
private _nextFireMode = _attackProfiles select _index;
TRACE_4("",_currentFireMode,_nextFireMode,_index,_attackProfiles);


private _currentFireMode = if (_useModeForAttackProfile) then {
    TRACE_2("setting fire mode",_weaponStateToken,_nextFireMode);
    for "_weaponIndex" from 0 to 299 do {
        ACE_player action ["SwitchWeapon", _currentShooter, ACE_player, _weaponIndex];
        (weaponState _weaponStateToken) params ["_xWeapon", "", "_xMode"];
        if ((_xWeapon == _weapon) && {(getText (configFile >> "CfgWeapons" >> _weapon >> _xMode >> QGVAR(attackProfile))) == _nextFireMode}) exitWith {
            TRACE_2("Restoring",_weaponIndex,weaponState _currentShooter);
        };
        if ((weaponState _weaponStateToken) isEqualTo ["","","","",0]) exitWith {ERROR_2("weaponState not found",_weapon,_nextFireMode);};
    };
} else {
    TRACE_2("setVariable attackProfile",_currentShooter,_nextFireMode);
    _currentShooter setVariable [QGVAR(attackProfile), _nextFireMode, false];
};

playSound "ACE_Sound_Click";

if ((getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "showHintOnCycle")) == 1) then {
    private _localizedName = getText (configFile >> QGVAR(AttackProfiles) >> _nextFireMode >> "name");
    [_localizedName] call EFUNC(common,displayTextStructured);
};
