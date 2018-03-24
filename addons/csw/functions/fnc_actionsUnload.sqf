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
    _params params ["_vehMag", "_turretPath", "_carryMag", "_vehicle"];
    TRACE_5("Starting unload mag progres bar",_target,_turretPath,_player,_carryMag,_vehMag);

    /*if (!isNull (_target turretUnit _turretPath)) exitWith {
        [LSTRING(gunnerInWeapon)] call EFUNC(common,displayTextStructured);
    };*/
    
    private _weapon = (_vehicle weaponsTurret _turretPath) select 0;
    
    private _timeToUnload = 1;
    if (!isNull(configFile >> "CfgWeapons" >> _weapon >> QGVAR(options))) then {
        _timeToUnload = getNumber(configFile >> "CfgWeapons" >> _weapon >> QGVAR(options) >> "ammoUnloadTime");
    };
    
    [
    _timeToUnload,
    [_target, _turretPath, _player, _carryMag, _vehMag, _ammoHolder],
    {
        TRACE_1("unload progressBar finish",_this);
        params["_args"];
        _args params ["_target", "_turretPath", "", "_carryMag", "_vehMag", "_ammoHolder"];
        // Create magazine holder and spawn the ammo that was in the weapon
        private _weaponRelPos = _target getRelPos RELATIVE_DIRECTION(270);
        private _ammoHolder = createVehicle["groundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
        _ammoHolder setPosATL _weaponRelPos;
        _ammoHolder setVectorUp (surfaceNormal _weaponRelPos);
        _ammoHolder setDir random[0, 180, 360];
        [QGVAR(removeTurretMag), [_target, _turretPath, _carryMag, _vehMag, _ammoHolder]] call CBA_fnc_globalEvent;
    },
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
        private _action = [format ["unload_%1", _forEachIndex], format ["Unload %1", _displayName], _picture, _statement, _condition, {}, [_xMag, _xTurret, _carryMag, _vehicle]] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _target];
    };
} forEach (magazinesAllTurrets _vehicle);

TRACE_1("unloadActions",count _actions);
_actions

