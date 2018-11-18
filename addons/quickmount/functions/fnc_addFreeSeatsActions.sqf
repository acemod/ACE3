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

#define TAKEN_SEAT_TIMEOUT 0.5

#define ICON_DRIVER    "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa"
#define ICON_PILOT     "A3\ui_f\data\IGUI\Cfg\Actions\getinpilot_ca.paa"
#define ICON_CARGO     "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa"
#define ICON_GUNNER    "A3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa"
#define ICON_COMMANDER "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_commander_ca.paa"
#define ICON_TURRET    "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa"
#define ICON_FFV       "A3\ui_f\data\IGUI\Cfg\CrewAimIndicator\gunnerAuto_ca.paa"

#define TO_COMPARTMENT_STRING(var) if !(var isEqualType "") then {var = format [ARR_2("Compartment%1",var)]}

// if unit isn't moved to new seat in TAKEN_SEAT_TIMEOUT, we move him back to his seat
#define WAIT_IN_OR_MOVE_BACK \
    [ARR_5( \
        {!isNull objectParent (_this select 0)}, \
        { \
            params [ARR_2("_player","_damageBlocked")]; \
            if (_damageBlocked) then {_player allowDamage true}; \
            LOG_1("moved in in %1 frames",diag_frameno-GVAR(frame)); \
        }, \
        [ARR_4(_player,_damageBlocked,_moveBackCode,_moveBackParams)], \
        TAKEN_SEAT_TIMEOUT, \
        { \
            params [ARR_4("_player","_damageBlocked","_moveBackCode","_moveBackParams")]; \
            [ARR_2(_player,_moveBackParams)] call _moveBackCode; \
            if (_damageBlocked) then {_player allowDamage true}; \
            localize "str_mis_state_failed" call EFUNC(common,displayTextStructured); \
        } \
    )] call CBA_fnc_waitUntilAndExecute;

#define IS_MOVED_OUT \
( \
    isNull objectParent _player \
    && { \
        [] isEqualTo _currentTurret \
        || {local _target isEqualTo (_target turretLocal _currentTurret)} \
    } \
)

#define MOVE_IN_CODE(command) (_this select 0) command (_this select 1)

private _fnc_move = {
    (_this select 2) params ["_moveInCode", "_moveInParams", "_currentTurret", "_moveBackCode", "_moveBackParams", ["_enabledByAnimationSource", ""]];
    TRACE_7("fnc_move params",_moveInCode,_moveInParams,_currentTurret,_moveBackCode,_moveBackParams,_enabledByAnimationSource,call {GVAR(frame)=diag_frameno});

    // check bugged FFV
    if (
        !("" isEqualTo _enabledByAnimationSource)
        && {1 > _target doorPhase _enabledByAnimationSource}
    ) exitWith {};

    // workaround getting damage when moveOut while vehicle is moving
    private _damageBlocked = false;
    if (isDamageAllowed _player) then {
        _player allowDamage false;
        _damageBlocked = true;
    };
    private _preserveEngineOn = _player == driver _target && {isEngineOn _target};
    moveOut _player;
    if (_preserveEngineOn) then {_target engineOn true};

    // moveIn right after moveOut doesn't work in MP for non-local vehicles, player just stays out
    // so we have to wait some time (e.g. until player is out and turret locality become vehicle locality)
    // usually it's done in the same frame for local vehicles/turrets and takes 3-7 frames for non-local, so in MP can look a little lagging
    if (IS_MOVED_OUT) exitWith {
        LOG("moved out in current frame");
        [_player, _moveInParams] call _moveInCode;
        WAIT_IN_OR_MOVE_BACK;
    };
    [
        {params ["_target", "_player", "_currentTurret"]; IS_MOVED_OUT},
        {
            params ["", "_player", "", "_moveInCode", "_moveInParams", "_moveBackCode", "_moveBackParams", "_damageBlocked"];
            LOG_2("moved out in %1 frames",diag_frameno-GVAR(frame),call {GVAR(frame)=diag_frameno; 0});
            [_player, _moveInParams] call _moveInCode;
            WAIT_IN_OR_MOVE_BACK;
        },
        [_target, _player, _currentTurret, _moveInCode, _moveInParams, _moveBackCode, _moveBackParams, _damageBlocked]
    ] call CBA_fnc_waitUntilAndExecute;
};

scopeName "main";

params ["_vehicle", "_player"];

private _vehicleConfig = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _isInVehicle = _player in _vehicle;
private _fullCrew = fullCrew [_vehicle, "", true];

private ["_driverCompartments", "_isDriverIsolated", "_cargoCompartments", "_cargoCompartmentsLast", "_compartment", "_currentTurret", "_moveBackCode", "_moveBackParams"];

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

    // find current compartment
    (
        _fullCrew select (_fullCrew findIf {_player == _x select 0})
    ) params ["", "_role", "_cargoIndex", "_turretPath"];

    _currentTurret = _turretPath;

    switch (_role) do {
        case "driver": {
            if (_isDriverIsolated) then {
                [] breakOut "main";
            };
            _compartment = _driverCompartments;
            _moveBackCode = {MOVE_IN_CODE(moveInDriver)};
            _moveBackParams = _vehicle;
        };
        case "cargo": {
            private _cargoNumber = fullCrew [_vehicle, "cargo", true] findIf {_player == _x select 0};
            _compartment = _cargoCompartments select (_cargoNumber min _cargoCompartmentsLast);
            _moveBackCode = {MOVE_IN_CODE(moveInCargo)};
            _moveBackParams = [_vehicle, _cargoIndex];
        };
        default {
            private _turretConfig = [_vehicleConfig, _turretPath] call CBA_fnc_getTurret;
            _compartment = (_turretConfig >> "gunnerCompartments") call BIS_fnc_getCfgData;
            TO_COMPARTMENT_STRING(_compartment);
            _moveBackCode = {MOVE_IN_CODE(moveInTurret)};
            _moveBackParams = [_vehicle, _turretPath];
        };
    };
    TRACE_6("current",_role,_cargoIndex,_turretPath,_compartment,_driverCompartments,_cargoCompartments);
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
                    || {unitIsUAV _vehicle}
                    || {0 == getNumber (_vehicleConfig >> "hasDriver")}
                ) then {
                    breakTo "crewLoop";
                };
                if (_isInVehicle) then {
                    if (_compartment != _driverCompartments || {_isDriverIsolated}) then {breakTo "crewLoop"};
                    _params = [{MOVE_IN_CODE(moveInDriver)}, _vehicle, _currentTurret, _moveBackCode, _moveBackParams];
                    _statement = _fnc_move;
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
                    _params = [{MOVE_IN_CODE(moveInCargo)}, [_vehicle, _cargoIndex], _currentTurret, _moveBackCode, _moveBackParams];
                    _statement = _fnc_move;
                } else {
                    _params = ["GetInCargo", _vehicle, _cargoNumber];
                    _statement = {_player action (_this select 2)};
                };
                _name = format ["%1 %2", localize "str_getin_pos_passenger", _cargoNumber + 1];
                _icon = ICON_CARGO;
            };
            default { // all turrets including FFV
                if (_vehicle lockedTurret _turretPath) then {breakTo "crewLoop"};
                if (_role == "gunner" && {unitIsUAV _vehicle}) then {breakTo "crewLoop"};
                private _turretConfig = [_vehicleConfig, _turretPath] call CBA_fnc_getTurret;
                if (!_isInVehicle) then {
                    _params = ["GetInTurret", _vehicle, _turretPath];
                    _statement = {_player action (_this select 2)};
                } else {
                    private _gunnerCompartments = (_turretConfig >> "gunnerCompartments") call BIS_fnc_getCfgData;
                    TO_COMPARTMENT_STRING(_gunnerCompartments);
                    if (_compartment != _gunnerCompartments) then {breakTo "crewLoop"};
                    // due to arma bug the unit is stuck in wrong anim when move in turret with configured enabledByAnimationSource
                    private _enabledByAnimationSource = getText (_turretConfig >> "enabledByAnimationSource");
                    if (
                        !("" isEqualTo _enabledByAnimationSource)
                        && {1 > _vehicle doorPhase _enabledByAnimationSource}
                    ) then {breakTo "crewLoop"};
                    _params = [{MOVE_IN_CODE(moveInTurret)}, [_vehicle, _turretPath], _currentTurret, _moveBackCode, _moveBackParams, _enabledByAnimationSource];
                    _statement = _fnc_move;
                };
                _name = getText (_turretConfig >> "gunnerName");
                _icon = switch true do {
                    case (0 < getNumber (_turretConfig >> "isCopilot")): {ICON_PILOT};
                    case (_role == "gunner"): {ICON_GUNNER};
                    case (_role == "commander"): {ICON_COMMANDER};
                    case (_isPersonTurret): {ICON_FFV};
                    case ("" isEqualTo getText (_turretConfig >> "gun")): {ICON_CARGO};
                    default {ICON_TURRET};
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
