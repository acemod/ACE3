#include "script_component.hpp"
/*
 * Author: GitHawk
 * Show the resupplyable ammunition of all surrounding vehicles.
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 *
 * Return Value:
 * ChildActions <ARRAY>
 *
 * Example:
 * [tank] call ace_rearm_fnc_addRearmActions
 *
 * Public: No
 */

params ["_truck"];

private _vehicles = nearestObjects [_truck, ["AllVehicles"], 20];
_vehicles = _vehicles select {(_x != _truck) && {!(_x isKindOf "CAManBase")} && {!(_x getVariable [QGVAR(disabled), false])}};

if (missionNamespace getVariable [QEGVAR(mk6mortar,useAmmoHandling), false]) then {
    _vehicles = _vehicles select {!(_x isKindOf "Mortar_01_base_F")};
};

private _vehicleActions = [];
{
    private _vehicle = _x;
    
    // Array of magazines that can be rearmed in the vehicle
    private _needRearmMags = ([_vehicle] call FUNC(getNeedRearmMagazines)) apply {_x select 0};
    
    // _needRearmMags without duplicates
    private _magazineHelper = _needRearmMags arrayIntersect _needRearmMags;

    _magazineHelper = _magazineHelper select {[_truck, _x] call FUNC(hasEnoughSupply)};
    TRACE_2("can add",_x,_magazineHelper);
    
    if (!(_magazineHelper isEqualTo [])) then {
        private _icon = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Icon");
        if !((_icon select [0, 1]) == "\") then {
            _icon = "";
        };
        if (GVAR(level) == 0) then {
            // [Level 0] adds a single action to rearm the entire vic
            private _action = [
                _vehicle,
                getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),
                _icon,
                {_this call FUNC(rearmEntireVehicle)},
                {true},
                {},
                _vehicle
            ] call EFUNC(interact_menu,createAction);
            _vehicleActions pushBack [_action, [], _truck];
        } else {
            // [Level 1,2] - Add actions for each magazine
            private _actions = [];
            {
                private _action = [
                    _x,
                    getText(configFile >> "CfgMagazines" >> _x >> "displayName"),
                    getText(configFile >> "CfgMagazines" >> _x >> "picture"),
                    {_this call FUNC(takeAmmo)},
                    {true},
                    {},
                    [_x, _vehicle]
                ] call EFUNC(interact_menu,createAction);

                _actions pushBack [_action, [], _truck];
            } forEach _magazineHelper;

            private _action = [
                _vehicle,
                getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),
                _icon,
                {},
                {true},
                {},
                []
            ] call EFUNC(interact_menu,createAction);
            
            _vehicleActions pushBack [_action, _actions, _truck];
        };
    };
} forEach _vehicles;

_vehicleActions
