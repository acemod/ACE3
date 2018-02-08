/*
 * Author: PabstMirror
 * Gets sub actions for what the player can load into the static weapon
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [cursorObject, player] call ace_crewserved_fnc_actionsUnload
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_player"];

private _actions = [];
private _handeledMagTypes = [];

private _statement = {
    params ["_target", "_player", "_params"];
    _params params ["_vehMag", "_turretPath", "_carryMag"];
    TRACE_5("Starting unload mag progres bar",_target,_turretPath,_player,_carryMag,_vehMag);

    if (!isNull (_target turretUnit _turretPath)) exitWith {
        [LSTRING(gunnerInWeapon)] call EFUNC(common,displayTextStructured);
    };
    
    [
    1,
    [_target, _turretPath, _player, _carryMag, _vehMag],
    {TRACE_1("unload progressBar finish",_this); [QGVAR(removeTurretMag), (_this select 0)] call CBA_fnc_globalEvent;},
    {TRACE_1("unload progressBar fail",_this);},
    format [localize LSTRING(progressBarUnloading), getText (configFile >> "CfgMagazines" >> _carryMag >> "displayName")],
    {(_this select 0) call FUNC(canUnloadMagazine)},
    ["isNotInside"]
    ] call EFUNC(common,progressBar);
};

private _condition = {
    params ["_target", "_player", "_params"];
    _params params ["_vehMag", "_turretPath", "_carryMag"];

    [_target, _turretPath, _player, _carryMag, _vehMag] call FUNC(canUnloadMagazine)

};

// Go through magazines on static weapon and check if any are unloadable
{
    _x params ["_xMag", "_xTurret", "_xAmmo"];
		
    if ((_xAmmo > 0) && {!(_xMag in _handeledMagTypes)}) then {
        _handeledMagTypes pushBack _xMag;
        private _carryMag = GVAR(vehicleMagCache) getVariable _xMag;

        if (isNil "_carryMag") then {
            private _groups = "getNumber (_x >> _xMag) == 1" configClasses (configFile >> QGVAR(groups));
            _carryMag = configName (_groups param [0, configNull]);
            GVAR(vehicleMagCache) setVariable [_xMag, _carryMag];
            TRACE_2("setting cache",_xMag,_carryMag);
        };
        if (_carryMag == "") exitWith {};

        private _displayName = getText (configFile >> "CfgMagazines" >> _carryMag >> "displayName");
        private _picture = getText (configFile >> "CfgMagazines" >> _carryMag >> "picture");
        private _action = [format ["unload_%1", _forEachIndex], format ["Unload %1", _displayName], _picture, _statement, _condition, {}, [_xMag, _xTurret, _carryMag]] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _target];
    };
} forEach (magazinesAllTurrets _vehicle);

TRACE_1("unloadActions",count _actions);
_actions
