/*
 * Author: Dystopian
 * Creates actions for vehicle free seats.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Child actions <ARRAY>
 *
 * Example:
 * [cursorObject, player] call ace_quickmount_fnc_addFreeSeatsActions
 *
 * Public: No
 */
#include "script_component.hpp"

#define TO_STRING(arg) if !(arg isEqualType "") then {arg = "Compartment" + str arg}

// this will check UAV vehicle like Stomper (with cargo seat)
#define IS_CREW_UAV(vehicleConfig) ("UAVPilot" == getText (configFile >> "CfgVehicles" >> (getText (vehicleConfig >> "crew")) >> "simulation"))

// this is used in statements when move from driver
#define MOVEOUT_AND_CHECK_ENGINE_ON \
    private _preserveEngineOn = _player == driver _target && {isEngineOn _target}; \
    moveOut _player; \
    if (_preserveEngineOn) then {_target engineOn true};

// moveIn right after moveOut doesn't work in MP for non-local vehicles, player just stays out
// we have to wait some time (e.g. until player is out)
// usually it takes 1 frame in SP and 3 frames in MP, so in MP looks a little lagging
#define MOVE_IN(command) [ARR_3( \
    {isNull objectParent (_this select 0)}, \
    {(_this select 0) command (_this select 1)}, \
    [ARR_2(_player,_this select 2)] \
)] call CBA_fnc_waitUntilAndExecute;

scopeName "main";

params ["_vehicle", "_player"];

private _vehicleConfig = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _isInVehicle = _player in _vehicle;

private ["_driverCompartments", "_isPilotAndIsolated", "_cargoCompartments", "_cargoCompartmentsLast", "_compartment"];

if (_isInVehicle) then {
    _driverCompartments = (_vehicleConfig >> "driverCompartments") call BIS_fnc_getCfgData;
    // Air class by default has driverCompartments=0 and cargoCompartments[]={0}, so we have to disable them
    _isPilotAndIsolated = _driverCompartments isEqualTo 0 && {_vehicle isKindOf "Air"};
    TO_STRING(_driverCompartments);

    _cargoCompartments = getArray (_vehicleConfig >> "cargoCompartments");
    _cargoCompartments = _cargoCompartments apply {
        if (_x isEqualType "") then {
            _x
        } else {
            "Compartment" + str _x
        };
    };
    _cargoCompartmentsLast = count _cargoCompartments - 1;

    TRACE_2("",_driverCompartments,_cargoCompartments);

    // find current compartment
    private ["_role", "_turretPath"];
    private _cargoNumber = 0;
    {
        _role = _x select 1;
        if (_player == _x select 0) exitWith {
            _turretPath = _x select 3;
        };
        if (_role == "cargo") then {
            INC(_cargoNumber);
        };
    } forEach fullCrew [_vehicle, "", true];

    switch (_role) do {
        case "driver": {
            if (_isPilotAndIsolated) then {
                [] breakOut "main";
            };
            _compartment = _driverCompartments;
        };
        case "cargo": {
            _compartment = _cargoCompartments select (_cargoNumber min _cargoCompartmentsLast);
        };
        default {
            private _turretConfig = [_vehicleConfig, _turretPath] call CBA_fnc_getTurret;
            _compartment = (_turretConfig >> "gunnerCompartments") call BIS_fnc_getCfgData;
            TO_STRING(_compartment);
        };
    };
    TRACE_4("",_role,_turretPath,_cargoNumber,_compartment);
};

private _actions = [];
private _cargoNumber = -1;
{
    scopeName "crewLoop";
    _x params ["_unit", "_role", "_cargoIndex", "_turretPath", "_isPersonTurret"];
    if (!isNull _unit && {alive _unit}) then {
        if (_role == "cargo") then {
            INC(_cargoNumber);
        };
    } else {
        private ["_name", "_icon", "_statement", "_params"];
        if (!(_turretPath isEqualTo [])) then { // all turrets including FFV
            if (_vehicle lockedTurret _turretPath) then {breakTo "crewLoop"};
            private _turretConfig = [_vehicleConfig, _turretPath] call CBA_fnc_getTurret;
            if (_isInVehicle) then {
                private _gunnerCompartments = (_turretConfig >> "gunnerCompartments") call BIS_fnc_getCfgData;
                TO_STRING(_gunnerCompartments);
                if (_compartment != _gunnerCompartments) then {breakTo "crewLoop"};
                _params = [_vehicle, _turretPath];
                _statement = {MOVEOUT_AND_CHECK_ENGINE_ON; MOVE_IN(moveInTurret)};
            } else {
                _params = ["GetInTurret", _vehicle, _turretPath];
                _statement = {_player action (_this select 2)};
            };
            _name = getText (_turretConfig >> "gunnerName");
            switch (_role) do {
                case "gunner": {
                    if (IS_CREW_UAV(_vehicleConfig)) then {breakTo "crewLoop"};
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
        } else { // cargo, no FFV
            if (_cargoIndex > -1) then {
                INC(_cargoNumber);
                if (_vehicle lockedCargo _cargoIndex) then {breakTo "crewLoop"};
                if (_isInVehicle) then {
                    if (_compartment != (_cargoCompartments select (_cargoNumber min _cargoCompartmentsLast))) then {breakTo "crewLoop"};
                    _params = [_vehicle, _cargoIndex];
                    _statement = {MOVEOUT_AND_CHECK_ENGINE_ON; MOVE_IN(moveInCargo)};
                } else {
                    _params = ["GetInCargo", _vehicle, _cargoNumber];
                    _statement = {_player action (_this select 2)};
                };
                _name = format ["%1 %2", localize "str_getin_pos_passenger", _cargoNumber + 1];
                _icon = "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa";
            } else { // driver
                if (
                    lockedDriver _vehicle
                    || {IS_CREW_UAV(_vehicleConfig)}
                    || {0 == getNumber (_vehicleConfig >> "hasDriver")}
                ) then {
                    breakTo "crewLoop";
                };
                if (_isInVehicle) then {
                    if (_compartment != _driverCompartments || {_isPilotAndIsolated}) then {breakTo "crewLoop"};
                    _params = _vehicle;
                    _statement = {moveOut _player; MOVE_IN(moveInDriver)};
                } else {
                    _params = ["GetInDriver", _vehicle];
                    _statement = {_player action (_this select 2)};
                };
                if (_vehicle isKindOf "Air") then {
                    _name = localize "str_getin_pos_pilot";
                    _icon = "A3\ui_f\data\IGUI\Cfg\Actions\getinpilot_ca.paa";
                } else {
                    _name = localize "str_driver";
                    _icon = "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa";
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
