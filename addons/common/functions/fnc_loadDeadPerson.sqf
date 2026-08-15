#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Loads dead person into most suitable seat in vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, vehicle player] call ace_common_fnc_loadDeadPerson
 *
 * Public: No
 */

params ["_unit", "_vehicle"];
TRACE_4("loadDeadPerson",_unit,_vehicle,typeOf _vehicle,local _unit);

if (!local _vehicle) exitWith {ERROR_4("loadDeadPerson vehicle not local; unit=%1[%2] vehicle=%3[%4]",_unit,typeOf _unit,_vehicle,typeOf _vehicle)};

#define PRIORITY_NONE         -1
#define PRIORITY_DRIVER        0
#define PRIORITY_GUNNER        1
#define PRIORITY_COMMANDER     2
#define PRIORITY_TURRET_NO_FFV 3
#define PRIORITY_TURRET_FFV    4
#define PRIORITY_TURRET_EMPTY  5
#define PRIORITY_CARGO         6

// Determine highest-priority available seats
private _emptySeats = fullCrew [_vehicle, "", true] select {isNull (_x select 0)};
private _vehicleConfig = configOf _vehicle;
private _bestSeatsPriority = PRIORITY_NONE;
private _bestSeatsRole = "";
private _bestSeatsParams = [];
{
    _x params ["", "_role", "_cargoIndex", "_turretPath", "_isPersonTurret"];
    private _priority = PRIORITY_NONE;
    switch (_role) do {
        case "driver": {
            if (
                lockedDriver _vehicle
                || {unitIsUAV _vehicle}
                || {getNumber (_vehicleConfig >> "hasDriver") < 1}
                || {getNumber (_vehicleConfig >> "ejectDeadDriver") > 0}
            ) then {continue};
            _priority = PRIORITY_DRIVER;
        };
        case "cargo": {
            if (
                _vehicle lockedCargo _cargoIndex
                || {getNumber (_vehicleConfig >> "ejectDeadCargo") > 0}
            ) then {continue};
            _priority = PRIORITY_CARGO;
        };
        default {
            private _turretConfig = [_vehicleConfig, _turretPath] call CBA_fnc_getTurret;
            if (
                _vehicle lockedTurret _turretPath
                || {getNumber (_turretConfig >> "ejectDeadGunner") > 0}
                || {_role == "gunner" && {unitIsUAV _vehicle}}
            ) then {continue};
            _priority = switch (_role) do {
                case "gunner": {PRIORITY_GUNNER};
                case "commander": {PRIORITY_COMMANDER};
                case "turret": {
                    if (_isPersonTurret) then {PRIORITY_TURRET_FFV}
                    else {[PRIORITY_TURRET_NO_FFV, PRIORITY_TURRET_EMPTY] select (getText (_turretConfig >> "gun") == "")}
                };
            };
        };
    };
    TRACE_2("emptySeat",_x,_priority);
    if (_priority > _bestSeatsPriority) then {
        _bestSeatsPriority = _priority;
        _bestSeatsRole = _role;
        _bestSeatsParams = [[_cargoIndex, _turretPath]];
        continue;
    };
    if (_priority == _bestSeatsPriority) then {
        if (_priority == PRIORITY_CARGO) then {
            _bestSeatsParams = [[_cargoIndex, _turretPath]]; // use only the last cargo seat
        } else {
            _bestSeatsParams pushBack [_cargoIndex, _turretPath];
        };
    };
} forEach _emptySeats;

if (_bestSeatsPriority == PRIORITY_NONE) exitWith {
    TRACE_2("No seats found",_emptySeats apply {_x select [ARR_2(1,3)]},fullCrew _vehicle apply {_x select [ARR_2(0,4)]});
};

private _moveInAnyPosition = toUpper _bestSeatsRole;
private _emptyPositions = _vehicle emptyPositions [_moveInAnyPosition];
TRACE_4("emptySeats",_bestSeatsPriority,_bestSeatsRole,_bestSeatsParams,_emptyPositions);

// Probe seat positions using temporary units to identify exact seat
private _seatHolders = [];

while {_emptyPositions > 1} do {
    private _seatHolder = createVehicleLocal [QGVAR(seatHolder), [0,0,0], [], 0, "CAN_COLLIDE"];
    private _seatHolderMoveSuccess = _seatHolder moveInAny [_vehicle, [_moveInAnyPosition]];
    private _seatHolderSeat = fullCrew _vehicle select {_x select 0 == _seatHolder};
    if (!_seatHolderMoveSuccess || {_seatHolderSeat isEqualTo []}) then {
        ERROR_8("moveInAny holder failed unit=%1[%2] vehicle=%3[%4] pos=%5 seatHolder=%6 success=%7 fullCrew=%8",_unit,typeOf _unit,_vehicle,typeOf _vehicle,_moveInAnyPosition,_seatHolder,_seatHolderMoveSuccess,fullCrew _vehicle apply {_x select [ARR_2(0,4)]});
        _vehicle deleteVehicleCrew _seatHolder;
        if (!isNull _seatHolder) then { // failsafe
            moveOut _seatHolder;
            deleteVehicle _seatHolder;
        };
        break;
    };
    _seatHolderSeat select 0 params ["", "", "_cargoIndex", "_turretPath"];
    TRACE_3("seatHolder",_emptyPositions,_cargoIndex,_turretPath);
    if ([_cargoIndex, _turretPath] in _bestSeatsParams) then {
        _vehicle deleteVehicleCrew _seatHolder;
        _emptyPositions = 1;
        break;
    };
    _seatHolders pushBack _seatHolder;
    DEC(_emptyPositions);
};

if (_emptyPositions == 1) then { // need this check in case of seatHolder moveInAny fail
    private _unitMoveSuccess = _unit moveInAny [_vehicle, [_moveInAnyPosition]];
    if (_unitMoveSuccess) then {
        [QGVAR(deadPersonLoaded), _unit] call CBA_fnc_globalEvent; // Ensure dead unit stays unconscious on all clients
    } else {
        ERROR_8("moveInAny unit failed unit=%1[%2] vehicle=%3[%4] pos=%5 local=%6 seatHolders=%7 fullCrew=%8",_unit,typeOf _unit,_vehicle,typeOf _vehicle,_moveInAnyPosition,local _unit,_seatHolders,fullCrew _vehicle apply {_x select [ARR_2(0,4)]});
    };
};

{
    _vehicle deleteVehicleCrew _x;
} forEach _seatHolders;
