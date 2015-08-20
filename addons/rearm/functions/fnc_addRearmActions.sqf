/*
 * Author: GitHawk
 * Show the resupplyable ammunition of all surrounding vehicles.
 *
 * Argument:
 * 0: Target <OBJECT>
 *
 * Return value:
 * ChildActions <ARRAY>
 *
 * Example:
 * [tank] call ace_rearm_fnc_addRearmActions
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_vehicleActions", "_actions", "_action", "_vehicles", "_vehicle", "_needToAdd", "_magazineHelper", "_turretPath", "_magazines", "_magazine", "_icon", "_cnt"];
params ["_target"];

_vehicles = nearestObjects [_target, ["AllVehicles"], 20];
if (count _vehicles < 2) exitWith {false}; // Rearming needs at least 2 vehicles

_vehicleActions = [];
{
    _actions = [];
    _vehicle = _x;
    _needToAdd = false;
    _action = [];
    if !((_vehicle == _target) || (_vehicle isKindOf "CAManBase")) then {
        _magazineHelper = [];
        {
            _turretPath = _x;
            _magazines = [];
            if (_turretPath isEqualTo [-1]) then {
                _magazines = [_vehicle, _turretPath] call FUNC(getConfigMagazines);
            } else {
                _magazines = _vehicle magazinesTurret _turretPath;
            };
            {
                _magazine = _x;
                _cnt = { _x == _magazine } count (_vehicle magazinesTurret _turretPath);
                if ((_cnt < ([_vehicle, _turretPath, _magazine] call FUNC(getMaxMagazines))) && !(_magazine in _magazineHelper)) then {
                    _action = [_magazine,
                        getText(configFile >> "CfgMagazines" >> _magazine >> "displayName"),
                        getText(configFile >> "CfgMagazines" >> _magazine >> "picture"),
                        {_this call FUNC(takeAmmo)},
                        {true},
                        {},
                        [_magazine, _vehicle]] call EFUNC(interact_menu,createAction);
                    _actions pushBack [_action, [], _target];
                    _magazineHelper pushBack _magazine;
                    _needToAdd = true;
                } else {
                    if (((_vehicle magazineTurretAmmo [_magazine, _turretPath]) < getNumber (configFile >> "CfgMagazines" >> _magazine >> "count")) && !(_magazine in _magazineHelper)) then {
                        _action = [_magazine,
                            getText(configFile >> "CfgMagazines" >> _magazine >> "displayName"),
                            getText(configFile >> "CfgMagazines" >> _magazine >> "picture"),
                            {_this call FUNC(takeAmmo)},
                            {true},
                            {},
                            [_magazine, _vehicle]] call EFUNC(interact_menu,createAction);
                        _actions pushBack [_action, [], _target];
                        _magazineHelper pushBack _magazine;
                        _needToAdd = true;
                    };
                };
            } forEach _magazines;
        } forEach REARM_TURRET_PATHS;
    };
    if (_needToAdd) then {
        _icon = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Icon");
        if !((_icon select [0, 1]) == "\") then {
            _icon = "";
        };
        if (GVAR(level) == 0) then {
            _action = [_vehicle,
                getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),
                _icon,
                {_this call FUNC(rearmEntireVehicle)},
                {true},
                {},
                _vehicle] call EFUNC(interact_menu,createAction);
            _vehicleActions pushBack [_action, [], _target];
        } else {
            _action = [_vehicle,
                getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),
                _icon,
                {},
                {true},
                {},
                []] call EFUNC(interact_menu,createAction);
            _vehicleActions pushBack [_action, _actions, _target];
        };
    };
} forEach _vehicles;

_vehicleActions
