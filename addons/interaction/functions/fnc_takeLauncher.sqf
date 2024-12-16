#include "..\script_component.hpp"
/*
 * Author: Timi007. Cplhardcore
 * Pass launcher to another unit.
 *
 * Arguments:
 * 0: Unit that passes the launcher <OBJECT>
 * 1: Unit to pass the launcher to <OBJECT>
 * 2: Launcher classname <STRING>
 *
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _target, "launch_NLAW_F"] call ace_interaction_fnc_passLauncher
 *
 * Public: No
 */
params ["_player", "_target", "_launcher"];
TRACE_3("Take launcher params",_player,_target,_launcher);

private _playerName = [_player] call EFUNC(common,getName);
private _cfgWeapons = configFile >> "CfgWeapons" >> _launcher;
private _displayName = getText (_cfgWeapons >> "displayName");
[QEGVAR(common,displayTextStructured), [[LSTRING(TakingLauncherHint), _playerName, _displayName], 1.5, _target], [_target]] call CBA_fnc_targetEvent;

if (_launcher isEqualTo "") exitWith {ERROR("No launcher specified.")};
if (secondaryWeapon _player isNotEqualTo "") exitWith {ERROR("Cannot add launcher to target due to lack of inventory space.")};
[_player, _target, 0] call FUNC(tapShoulder);
[GVAR(LauncherTime), 
    [_player, _target, _launcher, _displayName], 
    {
        params ["_args"];
        _args params ["_player", "_target", "_launcher", "_displayName"];
        TRACE_4("launcher params",_player,_target,_launcher,_displayName);
        fn_getWeaponStates =
        {
	        params ["_target", "_launcher"];
	        private _origState = weaponState _target select [0,3];
	        private _muzzles = [_launcher] + (getArray (configFile >> "CfgWeapons" >> _launcher >> "muzzles") select { _x != "this" });
	        private _states = [];

	        {
	        	_target selectWeapon _x;
	        	_states pushBack weaponState _target;
	        } forEach _muzzles;

	        _target selectWeapon _origState;
	        _states;
        };


        private _result = [_target, _launcher] call fn_getWeaponStates;
        private _attachments = _target weaponAccessories _launcher;
        private _launcherAmmo = _result apply { _x select 3 };
        private _launcherAmmoCount = _result apply { _x select 4 };
        private _launcherMuzzle = _result apply { _x select 1 };
        [_player, _launcher] call CBA_fnc_addWeaponWithoutItems;
        {_player addSecondaryWeaponItem _x;} forEach _attachments;
        for "_i" from 0 to (count _launcherMuzzle - 1) do {
            private _muzzle = _launcherMuzzle select _i;
            private _ammo = _launcherAmmo select _i;
            private _count = _launcherAmmoCount select _i;
            _player addWeaponItem [_launcher, [_ammo, _count, _muzzle]];

        };
        
        {_player addWeaponItem [_launcher, [_launcherAmmo, _launcherAmmoCount, _launcherMuzzle], true];} forEach _result;
        _target removeWeapon _launcher;
        [_player, "PutDown"] call EFUNC(common,doGesture);

        private _playerName = [_player] call EFUNC(common,getName);
        private _targetName = [_target] call EFUNC(common,getName);
        [QEGVAR(common,displayTextStructured), [[LSTRING(GaveLauncherHint), _playerName, _displayName], 1.5, _target], [_target]] call CBA_fnc_targetEvent;
        [QEGVAR(common,displayTextStructured), [[LSTRING(TookLauncherHint), _targetName, _displayName], 1.5, _player], [_player]] call CBA_fnc_targetEvent;
        [_player, _target, 0] call FUNC(tapShoulder);
    }, 
    {}, LLSTRING(PassingLauncher)] call EFUNC(common,progressBar);
