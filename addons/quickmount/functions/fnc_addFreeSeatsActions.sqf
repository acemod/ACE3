#include "script_component.hpp"
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

#define TO_COMPARTMENT_STRING(var) if !(var isEqualType "") then {var = format [ARR_2("Compartment%1",var)]}

// this will check UAV vehicle like Stomper (with cargo seat)
#define IS_CREW_UAV(vehicleConfig) ("UAVPilot" == getText (configFile >> "CfgVehicles" >> getText (vehicleConfig >> "crew") >> "simulation"))

// workaround getting damage when moveout while vehicle is moving
#define MOVEOUT_AND_BLOCK_DAMAGE \
    if (isDamageAllowed _player) then { \
        _player allowDamage false; \
        SETVAR(_player,GVAR(damageBlocked),true); \
    }; \
    moveOut _player;

// this is used in statements when move from driver
#define MOVEOUT_AND_BLOCK_DAMAGE_AND_CHECK_ENGINE_ON \
    private _preserveEngineOn = _player == driver _target && {isEngineOn _target}; \
    MOVEOUT_AND_BLOCK_DAMAGE; \
    if (_preserveEngineOn) then {_target engineOn true};

// moveIn right after moveOut doesn't work in MP for non-local vehicles, player just stays out
// we have to wait some time (e.g. until player is out)
// usually it takes 1 frame in SP and 3 frames in MP, so in MP looks a little lagging
// also if unit isn't moved to new seat in 0.5 seconds, we move him back to his seat
#define MOVE_IN(command) \
    [ARR_3( \
        {isNull objectParent (_this select 0)}, \
        { \
            params [ARR_2("_player","_moveInParams")]; \
            _player command _moveInParams; \
            [ARR_5( \
                {!isNull objectParent _this}, \
                { \
                    if (GETVAR(_this,GVAR(damageBlocked),false)) then { \
                        _this allowDamage true; \
                        SETVAR(_this,GVAR(damageBlocked),nil); \
                    }; \
                }, \
                _player, \
                0.5, \
                { \
                    (_this getVariable QGVAR(moveBackParams)) call (_this getVariable QGVAR(moveBackCode)); \
                    if (GETVAR(_this,GVAR(damageBlocked),false)) then { \
                        _this allowDamage true; \
                        SETVAR(_this,GVAR(damageBlocked),nil); \
                    }; \
                } \
            )] call CBA_fnc_waitUntilAndExecute; \
        }, \
        [ARR_2(_player,_this select 2)] \
    )] call CBA_fnc_waitUntilAndExecute;

#define ICON_DRIVER    "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa"
#define ICON_PILOT     "A3\ui_f\data\IGUI\Cfg\Actions\getinpilot_ca.paa"
#define ICON_CARGO     "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa"
#define ICON_GUNNER    "A3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa"
#define ICON_COMMANDER "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_commander_ca.paa"
#define ICON_TURRET    "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa"
#define ICON_FFV       "A3\ui_f\data\IGUI\Cfg\CrewAimIndicator\gunnerAuto_ca.paa"

scopeName "main";

params ["_vehicle", "_player"];

private _vehicleConfig = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _isInVehicle = _player in _vehicle;
private _fullCrew = fullCrew [_vehicle, "", true];

private ["_driverCompartments", "_isDriverIsolated", "_cargoCompartments", "_cargoCompartmentsLast", "_compartment"];

if (_isInVehicle) then {
    _driverCompartments = (_vehicleConfig >> "driverCompartments") call BIS_fnc_getCfgData;
    // Air class by default has driverCompartments=0 and cargoCompartments[]={0}, so we have to disable them
    _isDriverIsolated = _driverCompartments isEqualTo 0 && {_vehicle isKindOf "Air"};
    TO_COMPARTMENT_STRING(_driverCompartments);

    _cargoCompartments = getArray (_vehicleConfig >> "cargoCompartments");
    {
        if !(_x isEqualType "") then {
            _cargoCompartments set [_forEachIndex, format ["Compartment%1", _x]];
        };
    } forEach _cargoCompartments;
    _cargoCompartmentsLast = count _cargoCompartments - 1;

    TRACE_2("",_driverCompartments,_cargoCompartments);

    // find current compartment
    (
        _fullCrew select (_fullCrew findIf {_player == _x select 0})
    ) params ["", "_role", "_cargoIndex", "_turretPath"];

    switch (_role) do {
        case "driver": {
            if (_isDriverIsolated) then {
                [] breakOut "main";
            };
            _compartment = _driverCompartments;
            _player setVariable [QGVAR(moveBackCode), {(_this select 0) moveInDriver (_this select 1)}];
            _player setVariable [QGVAR(moveBackParams), [_player, _vehicle]];
        };
        case "cargo": {
            private _cargoNumber = fullCrew [_vehicle, "cargo", true] findIf {_player == _x select 0};
            _compartment = _cargoCompartments select (_cargoNumber min _cargoCompartmentsLast);
            _player setVariable [QGVAR(moveBackCode), {(_this select 0) moveInCargo (_this select 1)}];
            _player setVariable [QGVAR(moveBackParams), [_player, [_vehicle, _cargoIndex]]];
        };
        default {
            private _turretConfig = [_vehicleConfig, _turretPath] call CBA_fnc_getTurret;
            _compartment = (_turretConfig >> "gunnerCompartments") call BIS_fnc_getCfgData;
            TO_COMPARTMENT_STRING(_compartment);
            _player setVariable [QGVAR(moveBackCode), {(_this select 0) moveInTurret (_this select 1)}];
            _player setVariable [QGVAR(moveBackParams), [_player, [_vehicle, _turretPath]]];
        };
    };
    TRACE_4("",_role,_cargoIndex,_turretPath,_compartment);
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
        switch (toLower _role) do {
            case "driver": {
                if (
                    lockedDriver _vehicle
                    || {IS_CREW_UAV(_vehicleConfig)}
                    || {0 == getNumber (_vehicleConfig >> "hasDriver")}
                ) then {
                    breakTo "crewLoop";
                };
                if (_isInVehicle) then {
                    if (_compartment != _driverCompartments || {_isDriverIsolated}) then {breakTo "crewLoop"};
                    _params = _vehicle;
                    _statement = {MOVEOUT_AND_BLOCK_DAMAGE; MOVE_IN(moveInDriver)};
                } else {
                    _params = ["GetInDriver", _vehicle];
                    _statement = {_player action (_this select 2)};
                };
                if (_vehicle isKindOf "Air") then {
                    _name = localize "str_getin_pos_pilot";
                    _icon = ICON_PILOT;
                } else {
                    _name = localize "str_driver";
                    _icon = ICON_DRIVER;
                };
            };
            case "cargo": {
                INC(_cargoNumber);
                if (_vehicle lockedCargo _cargoIndex) then {breakTo "crewLoop"};
                if (_isInVehicle) then {
                    if (_compartment != (_cargoCompartments select (_cargoNumber min _cargoCompartmentsLast))) then {breakTo "crewLoop"};
                    _params = [_vehicle, _cargoIndex];
                    _statement = {MOVEOUT_AND_BLOCK_DAMAGE_AND_CHECK_ENGINE_ON; MOVE_IN(moveInCargo)};
                } else {
                    _params = ["GetInCargo", _vehicle, _cargoNumber];
                    _statement = {_player action (_this select 2)};
                };
                _name = format ["%1 %2", localize "str_getin_pos_passenger", _cargoNumber + 1];
                _icon = ICON_CARGO;
            };
            default { // all turrets including FFV
                if (_vehicle lockedTurret _turretPath) then {breakTo "crewLoop"};
                private _turretConfig = [_vehicleConfig, _turretPath] call CBA_fnc_getTurret;
                if (_isInVehicle) then {
                    private _gunnerCompartments = (_turretConfig >> "gunnerCompartments") call BIS_fnc_getCfgData;
                    TO_COMPARTMENT_STRING(_gunnerCompartments);
                    if (_compartment != _gunnerCompartments) then {breakTo "crewLoop"};
                    _params = [_vehicle, _turretPath];
                    _statement = {MOVEOUT_AND_BLOCK_DAMAGE_AND_CHECK_ENGINE_ON; MOVE_IN(moveInTurret)};
                } else {
                    _params = ["GetInTurret", _vehicle, _turretPath];
                    _statement = {_player action (_this select 2)};
                };
                _name = getText (_turretConfig >> "gunnerName");
                switch (toLower _role) do {
                    case "gunner": {
                        if (IS_CREW_UAV(_vehicleConfig)) then {breakTo "crewLoop"};
                        _icon = ICON_GUNNER;
                    };
                    case "commander": {
                        _icon = ICON_COMMANDER;
                    };
                    default {
                        if ("" isEqualTo getText (_turretConfig >> "gun")) exitWith {
                            _icon = ICON_CARGO;
                        };
                        _icon = [ICON_TURRET,ICON_FFV] select _isPersonTurret;
                    };
                };
                if (0 < getNumber (_turretConfig >> "isCopilot")) then {
                    _icon = ICON_PILOT;
                };
            };
        };
        private _action = [
            format ["%1%2%3", _role, _cargoIndex, _turretPath],
            _name, _icon, _statement, {true}, {}, _params
        ] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _vehicle];
    };
} forEach _fullCrew;

_actions
