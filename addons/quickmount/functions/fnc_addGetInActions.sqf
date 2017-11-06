/*
 * Author: Dystopian
 * Create actions for nearest vehicles with cargo.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Child actions <ARRAY>
 *
 * Example:
 * [cursorObject] call ace_quickmount_fnc_addGetInActions
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_vehicle", "_player"];
TRACE_2("params",_vehicle,_player);

private _vehicleConfig = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _isInVehicle = _player != vehicle _player;
private _statement = {if (_player != vehicle _player) then {moveOut (_this select 1)}; (_this select 1) action (_this select 2)};

private _actions = [];
{
    scopeName "crewLoop";
    _x params ["_unit", "_role", "_cargoIndex", "_turretPath", "_isPersonTurret"];
    if (isNull _unit || {!alive _unit}) then {
        private ["_name", "_icon", "_statement", "_params"];
        if (!(_turretPath isEqualTo [])) then { // all turrets including FFV
            if (_vehicle lockedTurret _turretPath) exitWith {};
            switch (_role) do {
                case "gunner": {
                    if ("UAVPilot" == getText (configFile >> "CfgVehicles" >> (getText (_vehicleConfig >> "crew")) >> "simulation")) then {breakTo "crewLoop"};
                    _icon = "A3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa";
                };
                case "commander": {
                    _icon = "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_commander_ca.paa";
                };
                default {
                    if (_isPersonTurret) then {
                        _icon = "A3\ui_f\data\IGUI\Cfg\CrewAimIndicator\gunnerAuto_ca.paa";
                    } else {
                        _icon = "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa";
                    };
                };
            };
            _name = getText ([_vehicleConfig, _turretPath] call CBA_fnc_getTurret >> "gunnerName");
            if (_isInVehicle) then {
                _params = [_vehicle, _turretPath];
                _statement = {moveOut _player; _player moveInTurret (_this select 2)};
            } else {
                _params = ["GetInTurret", _vehicle, _turretPath];
                _statement = {_player action (_this select 2)};
            };
        } else { // cargo, no FFV
            if (_cargoIndex > -1) then {
                if (_vehicle lockedCargo _cargoIndex) exitWith {};
                _name = format ["%1 %2", localize "str_getin_pos_passenger", _cargoIndex];
                _icon = "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa";
                if (_isInVehicle) then {
                    _params = [_vehicle, _cargoIndex];
                    _statement = {moveOut _player; _player moveInCargo (_this select 2)};
                } else {
                    _params = ["GetInCargo", _vehicle, _cargoIndex];
                    _statement = {_player action (_this select 2)};
                };
            } else { // driver
                if (lockedDriver _vehicle) exitWith {};
                if ("UAVPilot" == getText (configFile >> "CfgVehicles" >> (getText (_vehicleConfig >> "crew")) >> "simulation")) then {breakTo "crewLoop"};
                if (_vehicle isKindOf "Air") then {
                    _name = localize "str_getin_pos_pilot";
                    _icon = "A3\ui_f\data\IGUI\Cfg\Actions\getinpilot_ca.paa";
                } else {
                    _name = localize "str_driver";
                    _icon = "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa";
                };
                if (_isInVehicle) then {
                    _params = _vehicle;
                    _statement = {moveOut _player; _player moveInDriver (_this select 2)};
                } else {
                    _params = ["GetInDriver", _vehicle];
                    _statement = {_player action (_this select 2)};
                };
            };
        };
        private _action = [
            format ["%1%2%3", _role, _cargoIndex, _turretPath],
            _name, _icon, _statement, {true}, {}, _params
        ] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _vehicle];
    };
} forEach fullCrew [_vehicle, "", true];

_actions
