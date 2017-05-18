/*
 * Author: GitHawk
 * Show the resupplyable ammunition of all surrounding vehicles.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * ChildActions <ARRAY>
 *
 * Example:
 * [tank] call ace_rearm_fnc_addRearmActions
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_truck", objNull, [objNull]]];

private _vehicles = nearestObjects [_truck, ["AllVehicles"], 20];
_vehicles = _vehicles select {(_x != _truck) && {!(_x isKindOf "CAManBase")} && {!(_x getVariable [QGVAR(disabled), false])}};

private _vehicleActions = [];
{
    private _vehicle = _x;
    private _actions = [];
    private _needToAdd = false;
    private _magazineHelper = [];
    {
        private _turretPath = _x;
        private _magazines = [_vehicle, _turretPath] call FUNC(getVehicleMagazines);
        {
            private _magazine = _x;
            if (!(_magazine in _magazineHelper)) then {
                private _currentMagazines = { _x == _magazine } count (_vehicle magazinesTurret _turretPath);
                private _maxMagazines = [_vehicle, _turretPath, _magazine] call FUNC(getMaxMagazines);

                if ((_currentMagazines < _maxMagazines) || {(_vehicle magazineTurretAmmo [_magazine, _turretPath]) < getNumber (configFile >> "CfgMagazines" >> _magazine >> "count")}) then {
                    if ([_truck, _magazine] call FUNC(hasEnoughSupply)) then {
                        private _action = [_magazine,
                        getText(configFile >> "CfgMagazines" >> _magazine >> "displayName"),
                        getText(configFile >> "CfgMagazines" >> _magazine >> "picture"),
                        {_this call FUNC(takeAmmo)},
                        {true},
                        {},
                        [_magazine, _vehicle]] call EFUNC(interact_menu,createAction);
                        _actions pushBack [_action, [], _truck];
                        _magazineHelper pushBack _magazine;
                        _needToAdd = true;
                    };
                };
            };
            false
        } count _magazines;
        false
    } count REARM_TURRET_PATHS;
    TRACE_2("",_x,_needToAdd);
    if (_needToAdd) then {
        private _icon = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Icon");
        if !((_icon select [0, 1]) == "\") then {
            _icon = "";
        };
        if (GVAR(level) == 0) then {
            private _action = [_vehicle,
                getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),
                _icon,
                {_this call FUNC(rearmEntireVehicle)},
                {true},
                {},
                _vehicle] call EFUNC(interact_menu,createAction);
            _vehicleActions pushBack [_action, [], _truck];
        } else {
            private _action = [_vehicle,
                getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),
                _icon,
                {},
                {true},
                {},
                []] call EFUNC(interact_menu,createAction);
            _vehicleActions pushBack [_action, _actions, _truck];
        };
    };
    false
} count _vehicles;

_vehicleActions
