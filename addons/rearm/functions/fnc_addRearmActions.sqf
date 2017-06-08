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
                    _magazineHelper pushBack _magazine;
                };
            };
            false
        } count _magazines;
        false
    } count REARM_TURRET_PATHS;

    // 1.70 pylons
    private _pylonConfigs = configProperties [configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"];
    {
        private _pylonName = configName _x;
        private _pylonAmmo = _vehicle ammoOnPylon _pylonName;
        private _pylonMagazine = (getPylonMagazines _vehicle) select _forEachIndex;
        TRACE_3("",_pylonName,_pylonAmmo,_pylonMagazine);

        if (_pylonAmmo > 0) then {
            // Try to refill current pylon:
            private _magAmmo = getNumber (configFile >> "CfgMagazines" >> _pylonMagazine >> "count");
            if ((!(_pylonMagazine in _magazineHelper)) && {_pylonAmmo < _magAmmo}) then {
                _magazineHelper pushBack _pylonMagazine;
            };
        } else {
            // See what we magazines can add to the empty pylon:
            private _hardpointMags = [_x] call FUNC(getHardpointMagazines);
            {
                if (!(_x in _magazineHelper)) then {
                    _magazineHelper pushBack _x;
                };
            } forEach _hardpointMags;
        };
    } forEach _pylonConfigs;

    _magazineHelper = _magazineHelper select {[_truck, _x] call FUNC(hasEnoughSupply)};
    TRACE_2("can add",_x,_magazineHelper);
    
    if (!(_magazineHelper isEqualTo [])) then {
        private _icon = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Icon");
        if !((_icon select [0, 1]) == "\") then {
            _icon = "";
        };
        if (GVAR(level) == 0) then {
            // [Level 0] adds a single action to rearm the entire vic
            private _action = [_vehicle,
            getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),
            _icon,
            {_this call FUNC(rearmEntireVehicle)},
            {true},
            {},
            _vehicle] call EFUNC(interact_menu,createAction);
            _vehicleActions pushBack [_action, [], _truck];
        } else {
            // [Level 1,2] - Add actions for each magazine
            private _actions = [];
            {
                private _action = [_x,
                getText(configFile >> "CfgMagazines" >> _x >> "displayName"),
                getText(configFile >> "CfgMagazines" >> _x >> "picture"),
                {_this call FUNC(takeAmmo)},
                {true},
                {},
                [_x, _vehicle]] call EFUNC(interact_menu,createAction);

                _actions pushBack [_action, [], _truck];
            } forEach _magazineHelper;

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
