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
[QEGVAR(common,displayTextStructured), [[LSTRING(TakingLauncherHint), _playerName, _displayName], 1.5, _target], _target] call CBA_fnc_targetEvent;

if (_launcher isEqualTo "") exitWith {ERROR("No launcher specified.")};
if (secondaryWeapon _player isNotEqualTo "") exitWith {ERROR("Cannot add launcher to target due to lack of inventory space.")};
[_player, _target, 0] call FUNC(tapShoulder);
[GVAR(launcherTime), 
    [_player, _target, _launcher, _displayName], 
    {
        params ["_args"];
        _args params ["_player", "_target", "_launcher", "_displayName"];
        TRACE_4("launcher params",_player,_target,_launcher,_displayName);
        private _items = (getUnitLoadout _target) select 1;

        private _magazines = _items select [4, 2];
        _items deleteRange [4, 2];

        _target removeWeapon _launcher;

        [_player, _launcher, true, _magazines] call EFUNC(common,addWeapon);

        // Add attachments
        {
            _player addWeaponItem [_launcher, _x, true];
        } forEach (_items select {_x != ""});
        
        [_player, "PutDown"] call EFUNC(common,doGesture);

        private _playerName = [_player] call EFUNC(common,getName);
        private _targetName = [_target] call EFUNC(common,getName);
        [QEGVAR(common,displayTextStructured), [[LSTRING(GaveLauncherHint), _playerName, _displayName], 1.5, _target], _target] call CBA_fnc_targetEvent;
        [QEGVAR(common,displayTextStructured), [[LSTRING(TookLauncherHint), _targetName, _displayName], 1.5, _player], _player] call CBA_fnc_targetEvent;
        [_player, _target, 0] call FUNC(tapShoulder);
    }, 
    {}, LLSTRING(PassingLauncher)] call EFUNC(common,progressBar);
