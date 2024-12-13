#include "..\script_component.hpp"
/*
 * Author: Timi007. Cplhardcore
 * Pass launcher to another unit.
 *
 * Arguments:
 * 0: Unit that passes the launcher <OBJECT>
 * 1: Unit to pass the launcher to <OBJECT>
 * 2: launcher classname <STRING>
 * 3: Play passing animation <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _target, "launch_NLAW_F"] call ace_interaction_fnc_passLauncher
 *
 * Public: No
 */

params ["_player", "_target", "_launcher", ["_animate", true, [true]]];
TRACE_4("Pass launcher params",_player,_target,_launcher,_animate);

if (_launcher isEqualTo "") exitWith {ERROR("No launcher specified.")};
private _hasLauncher = secondaryWeapon _player;
if (_hasLauncher == "") exitWith {ERROR("Cannot add launcher to target due to lack of inventory space.")};

private _CfgWeapons = configFile >> "CfgWeapons" >> _launcher;
private _attachments = _target weaponAccessories _launcher;
private _launcherAmmo = (currentMagazine _unit) select {
    _x in getArray (configFile >> "CfgWeapons" >> _launcherClassname >> "magazines")
};
_target removeWeapon _launcher;
{
        _unit removeMagazine _x;
    } forEach _launcherAmmo;

_player addWeapon _launcher;
{_player addSecondaryWeaponItem _x;} forEach _attachments;
{_unit addMagazine _x;} forEach _launcherAmmo;

if (_animate) then {[_player, "PutDown"] call EFUNC(common,doGesture)};

private _playerName = [_player] call EFUNC(common,getName);
private _displayName = getText (_cfgWeapons >> "displayName");
[QEGVAR(common,displayTextStructured), [[LSTRING(PassLauncherHint), _playerName, _displayName], 1.5, _target], [_target]] call CBA_fnc_targetEvent;
