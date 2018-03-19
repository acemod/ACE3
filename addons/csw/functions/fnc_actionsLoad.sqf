/*
 * Author: PabstMirror
 * Gets sub actions for what the player can load into the static weapon
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [cursorObject, player] call ace_crewserved_fnc_actionsLoad
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_player"];

private _actions = [];
private _loadableMagazines = [_vehicle, _player] call FUNC(getLoadableMagazines); 

private _statement = {
    params ["_target", "_player", "_params"];
    _params params ["_carryMag", "_weapon", "_turretPath"];
    TRACE_5("Starting load mag progres bar",_target,_turretPath,_player,_carryMag,_weapon);
    
    private _timeToLoad = 1;
    if (!isNull(configFile >> "CfgWeapons" >> _weapon >> QGVAR(options))) then {
        _timeToLoad = getNumber(configFile >> "CfgWeapons" >> _weapon >> QGVAR(options) >> "ammoLoadTime");
    };
        
    [
    _timeToLoad,
    [_target, _turretPath, _player, _carryMag, _weapon],
    {TRACE_1("load progressBar finish",_this); (_this select 0) call FUNC(loadMagazine)},
    {TRACE_1("load progressBar fail",_this);},
    format [localize LSTRING(progressBarLoading), getText (configFile >> "CfgMagazines" >> _carryMag >> "displayName")],
    {(_this select 0) call FUNC(canLoadMagazine)},
    ["isNotInside"]
    ] call EFUNC(common,progressBar);
};

private _condition = {
    params ["_target", "_player", "_params"];
    _params params ["_carryMag", "_weapon", "_turretPath"];

    [_target, _turretPath, _player, _carryMag, _weapon, false] call FUNC(canLoadMagazine)
};

{
    _x params ["_carryMag", "_weapon", "_turretPath"];

    private _displayName = getText (configFile >> "CfgMagazines" >> _carryMag >> "displayName");
    private _picture = getText (configFile >> "CfgMagazines" >> _carryMag >> "picture");

    private _action = [format ["load_%1", _forEachIndex], format ["Load %1", _displayName], _picture, _statement, _condition, {}, _x] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _target];
} forEach _loadableMagazines;

TRACE_1("loadActions",count _actions);
_actions

