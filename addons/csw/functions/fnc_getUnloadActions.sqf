#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Gets sub actions for what can be unloaded from the CSW
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * cursorObject call ace_csw_fnc_getUnloadActions
 *
 * Public: No
 */

params ["_vehicle"];

private _statement = {
    params ["_target", "_player", "_args"];
    _args params ["_vehMag", "_turretPath", "_carryMag"];
    TRACE_5("starting unload",_target,_turretPath,_player,_carryMag,_vehMag);

    private _timeToUnload = 1;
    private _config = configOf _target >> QUOTE(ADDON) >> "ammoUnloadTime";
    if (!isNull _config) then {
        _timeToUnload = getNumber _config;
    };

    [
        TIME_PROGRESSBAR(_timeToUnload),
        [_target, _turretPath, _player, _carryMag, _vehMag],
        {
            (_this select 0) params ["_target", "_turretPath", "_player", "_carryMag", "_vehMag"];
            TRACE_5("unload progressBar finish",_target,_turretPath,_carryMag,_vehMag,_player);
            [QGVAR(removeTurretMag), [_target, _turretPath, _carryMag, _vehMag, _player]] call CBA_fnc_globalEvent;
        },
        {TRACE_1("unload progressBar fail",_this);},
        format [LLSTRING(unloadX), getText (configFile >> "CfgMagazines" >> _carryMag >> "displayName")],
        {(_this select 0) call FUNC(reload_canUnloadMagazine)},
        ["isNotInside"]
    ] call EFUNC(common,progressBar);
};

private _condition = {
    params ["_target", "_player", "_args"];
    _args params ["_vehMag", "_turretPath", "_carryMag"];

    [_player, _target] call EFUNC(interaction,canInteractWithVehicleCrew) &&
    {[_target, _turretPath, _player, _carryMag, _vehMag] call FUNC(reload_canUnloadMagazine)}
};

private _actions = [];
private _handledMagTypes = [];

private _cfgMagazines = configFile >> "CfgMagazines";

// Go through magazines on static weapon and check if any are unloadable
{
    _x params ["_xMag", "_xTurret", "_xAmmo"];

    if ((_xAmmo > 0) && {!(_xMag in _handledMagTypes)}) then {
        _handledMagTypes pushBack _xMag;
        private _carryMag = _xMag call FUNC(getCarryMagazine);
        if (_carryMag == "") exitWith {};

        private _displayName = getText (_cfgMagazines >> _carryMag >> "displayName");
        private _text = format [LLSTRING(unloadX), _displayName];
        private _picture = getText (_cfgMagazines >> _carryMag >> "picture");
        private _action = [format ["unload_%1", _forEachIndex], _text, _picture, _statement, _condition, {}, [_xMag, _xTurret, _carryMag]] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _vehicle];
    };
} forEach (magazinesAllTurrets _vehicle);

TRACE_1("unloadActions",count _actions);
_actions
