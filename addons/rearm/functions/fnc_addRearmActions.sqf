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

params [
    ["_truck", objNull, [objNull]]
];

private _vehicles = nearestObjects [_truck, ["AllVehicles"], 20];
if (count _vehicles < 2) exitWith {false}; // Rearming needs at least 2 vehicles

private _vehicleActions = [];
{
    private _actions = [];
    private _vehicle = _x;
    private _needToAdd = false;
    private _action = [];
    if !((_vehicle == _truck) || (_vehicle isKindOf "CAManBase")) then {
        private _magazineHelper = [];
        {
            private _turretPath = _x;
            private _magazines = [_vehicle, _turretPath] call FUNC(getVehicleMagazines);
            {
                private _magazine = _x;
                private _currentMagazines = { _x == _magazine } count (_vehicle magazinesTurret _turretPath);
                if ((_currentMagazines < ([_vehicle, _turretPath, _magazine] call FUNC(getMaxMagazines))) && !(_magazine in _magazineHelper)) then {
                    _action = [_magazine,
                        getText(configFile >> "CfgMagazines" >> _magazine >> "displayName"),
                        getText(configFile >> "CfgMagazines" >> _magazine >> "picture"),
                        {_this call FUNC(takeAmmo)},
                        {true},
                        {},
                        [_magazine, _vehicle]] call EFUNC(interact_menu,createAction);
                    if (GVAR(supply) == 0 || {(GVAR(supply) == 1) && ([_truck, _magazine] call FUNC(hasEnoughSupply))} || {(GVAR(supply) == 2) && ([_truck, _magazine] call FUNC(magazineInSupply))}) then {
                        _actions pushBack [_action, [], _truck];
                        _magazineHelper pushBack _magazine;
                        _needToAdd = true;
                    };
                } else {
                    if (((_vehicle magazineTurretAmmo [_magazine, _turretPath]) < getNumber (configFile >> "CfgMagazines" >> _magazine >> "count")) && !(_magazine in _magazineHelper)) then {
                        _action = [_magazine,
                            getText(configFile >> "CfgMagazines" >> _magazine >> "displayName"),
                            getText(configFile >> "CfgMagazines" >> _magazine >> "picture"),
                            {_this call FUNC(takeAmmo)},
                            {true},
                            {},
                            [_magazine, _vehicle]] call EFUNC(interact_menu,createAction);
                        if (GVAR(supply) == 0 || {(GVAR(supply) == 1) && ([_truck, _magazine] call FUNC(hasEnoughSupply))} || {(GVAR(supply) == 2) && ([_truck, _magazine] call FUNC(magazineInSupply))}) then {
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
    };
    if (_needToAdd && !(_vehicle getVariable [QGVAR(disabled), false])) then {
        private _icon = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Icon");
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
            _vehicleActions pushBack [_action, [], _truck];
        } else {
            _action = [_vehicle,
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
