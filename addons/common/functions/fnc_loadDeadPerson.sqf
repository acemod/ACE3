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
TRACE_6("loadDeadPerson",_unit,_vehicle,typeOf _vehicle,local _unit,local _vehicle,isDedicated);

if (!local _vehicle) exitWith {ERROR_4("loadDeadPerson vehicle not local _unit=%1[%2] _vehicle=%3[%4]",_unit,typeOf _unit,_vehicle,typeOf _vehicle)};

#define PRIORITY_NONE         -1
#define PRIORITY_DRIVER        0
#define PRIORITY_GUNNER        1
#define PRIORITY_COMMANDER     2
#define PRIORITY_TURRET_NO_FFV 3
#define PRIORITY_TURRET_FFV    4
#define PRIORITY_TURRET_EMPTY  5
#define PRIORITY_CARGO         6

#define SEATHOLDER_CLASS "VirtualMan_F"

private _vehicleConfig = configOf _vehicle;

/*
  When moveInAny assigns a unit to a cargo seat,
  it uses a slot with Position Number = count fullCrew [_vehicle, "cargo"],
  even if the seat is locked or occupied.
  https://feedback.bistudio.com/T198758
  Locked seats can be bypassed with moveInAny of a temporary unit.
  Occupied seats can be bypassed with moveInCargo of a temporary unit to another empty seat.
  When the whole second half of cargo is occupied,
  moveInAny can not be used for cargo at all.
  Cargo example:
  2  3  4  5  6  8  9 10 11 12 14 15 16    _cargoIndex (fullCrew, moveInCargo, lockedCargo)
  0  1  2  3  4  5  6  7  8  9 10 11 12    _cargoPositionNumber (action GetInCargo)
  L  o  _  o  L  o  L  o  _  o  _  L  L    seats: _ empty, o unit, L empty locked
        S        P  A     T     S
                 |___________| <--- moveInAny can fill (5(o) + A + T + S + S = 9)
    P _cargoCurrentPositionNumber
    A locked but can fill with moveInAny
    T _cargoTargetPositionNumber
    S _cargoSpareIndexes
*/

// Pre-scan cargo seats to determine moveInAny target position and remapping data
private _cargoCurrentPositionNumber = count fullCrew [_vehicle, "cargo"];
private _cargoTargetPositionNumber = -1;
private _cargoSpareIndexes = [];
private _cargoIndexes = [];
private _cargoAvailable = 0 == getNumber (_vehicleConfig >> "ejectDeadCargo");
if (_cargoAvailable) then {
    {
        _x params ["_crewUnit", "", "_cargoIndex"];
        _cargoIndexes pushBack _cargoIndex;
        if (!isNull _crewUnit || {_vehicle lockedCargo _cargoIndex}) then {continue};
        private _cargoPositionNumber = _forEachIndex;
        if (_cargoTargetPositionNumber == -1 && {_cargoPositionNumber >= _cargoCurrentPositionNumber}) then {
            _cargoTargetPositionNumber = _cargoPositionNumber;
        } else {
            _cargoSpareIndexes pushBack _cargoIndex;
        };
    } forEach fullCrew [_vehicle, "cargo", true];
    _cargoAvailable = _cargoTargetPositionNumber > -1;
};
TRACE_5("cargo pre-scan",_cargoAvailable,_cargoCurrentPositionNumber,_cargoTargetPositionNumber,_cargoSpareIndexes,_cargoIndexes);
private _cargoRemap = createHashMap;

// Determine highest-priority available seats
private _bestSeatsPriority = PRIORITY_NONE;
private _bestSeatsRole = "";
private _bestSeatsParams = [];
private _allSeats = fullCrew [_vehicle, "", true];
{
    _x params ["_crewUnit", "_role", "_cargoIndex", "_turretPath", "_isPersonTurret"];
    private _priority = PRIORITY_NONE;
    switch (_role) do {
        case "driver": {
            if (
                !isNull _crewUnit
                || {lockedDriver _vehicle}
                || {unitIsUAV _vehicle}
                || {getNumber (_vehicleConfig >> "hasDriver") < 1}
                || {getNumber (_vehicleConfig >> "ejectDeadDriver") > 0}
            ) then {continue};
            _priority = PRIORITY_DRIVER;
        };
        case "cargo": {
            if (!_cargoAvailable) then {continue};
            private _cargoPositionNumber = _cargoIndexes find _cargoIndex;
            if (_cargoPositionNumber > _cargoTargetPositionNumber) then {break};
            if (_cargoPositionNumber == _cargoTargetPositionNumber) then {
                _priority = PRIORITY_CARGO;
            } else {
                if (
                    _cargoPositionNumber < _cargoCurrentPositionNumber // unavailable for moveInAny
                    || {isNull _crewUnit} // locked empty seat before _cargoTargetPositionNumber
                ) then {
                    TRACE_4("cargo skip",_cargoIndex,_cargoPositionNumber,_crewUnit,_vehicle lockedCargo _cargoIndex);
                    continue;
                };
                // try to skip occupied seat
                if (_cargoSpareIndexes isEqualTo []) then {
                    _cargoAvailable = false; // cannot advance moveInAny cargo position
                    _cargoRemap = createHashMap;
                } else {
                    _cargoRemap set [_cargoPositionNumber, _cargoSpareIndexes deleteAt 0];
                };
                TRACE_4("cargo seat",_cargoIndex,_cargoPositionNumber,_crewUnit,_cargoAvailable);
                continue;
            };
        };
        default {
            private _turretConfig = [_vehicleConfig, _turretPath] call CBA_fnc_getTurret;
            if (
                !isNull _crewUnit
                || {_vehicle lockedTurret _turretPath}
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
        _bestSeatsParams pushBack [_cargoIndex, _turretPath];
    };
} forEach _allSeats;

if (_bestSeatsPriority == PRIORITY_NONE) exitWith {
    TRACE_1("No seats found",_allSeats apply {_x select [ARR_2(0,5)]});
};

TRACE_4("bestSeats",_bestSeatsPriority,_bestSeatsRole,_bestSeatsParams,_cargoRemap);

// createVehicle(Local) + moveInAny crashes dedicated server https://feedback.bistudio.com/T198846, use createAgent instead
private _createSeatHolder = if (isDedicated) then {
    {createAgent [SEATHOLDER_CLASS, [0,0,0], [], 0, "CAN_COLLIDE"]}
} else {
    {createVehicleLocal [SEATHOLDER_CLASS, [0,0,0], [], 0, "CAN_COLLIDE"]}
};

// Probe seat positions using temporary units to identify exact seat
private _seatHolders = [];
private _remainingEmptyPositions = _vehicle emptyPositions ""; // Guard against infinite loop
while {_remainingEmptyPositions > 0} do {
    // advance moveInAny cargo position
    if (_cargoCurrentPositionNumber in _cargoRemap) then {
        // moveInCargo does not support createVehicleLocal units
        private _seatHolder = createAgent [SEATHOLDER_CLASS, [0,0,0], [], 0, "CAN_COLLIDE"];
        private _moveInCargoIndex = _cargoRemap get _cargoCurrentPositionNumber;
        _seatHolder moveInCargo [_vehicle, _moveInCargoIndex]; // cannot use "false" 3rd argument here https://feedback.bistudio.com/T198984
        private _seatHolderSeat = fullCrew _vehicle select {_x select 0 == _seatHolder};
        if (_seatHolderSeat isEqualTo [] || {_seatHolderSeat select 0 select 2 != _moveInCargoIndex}) then {
            ERROR_8("moveInCargo holder failed _unit=%1[%2] _vehicle=%3[%4] _seatHolder=%5 _moveInCargoIndex=%6 fullCrew=%7 %8",_unit,typeOf _unit,_vehicle,typeOf _vehicle,_seatHolder,_moveInCargoIndex,fullCrew _vehicle apply {_x select [ARR_2(0,5)]},__FILE__);
            _vehicle deleteVehicleCrew _seatHolder;
            if (!isNull _seatHolder) then { // failsafe
                moveOut _seatHolder;
                deleteVehicle _seatHolder;
            };
            break;
        };
        TRACE_4("cargo move",_remainingEmptyPositions,_cargoCurrentPositionNumber,_moveInCargoIndex,_seatHolderSeat);
        _seatHolders pushBack _seatHolder;
        INC(_cargoCurrentPositionNumber);
        DEC(_remainingEmptyPositions);
        continue;
    };

    private _seatHolder = call _createSeatHolder;
    private _seatHolderMoveSuccess = _seatHolder moveInAny _vehicle;
    private _seatHolderSeat = fullCrew _vehicle select {_x select 0 == _seatHolder};
    if (!_seatHolderMoveSuccess || {_seatHolderSeat isEqualTo []}) then {
        ERROR_8("moveInAny holder failed _unit=%1[%2] _vehicle=%3[%4] _seatHolder=%5 _seatHolderMoveSuccess=%6 fullCrew=%7 %8",_unit,typeOf _unit,_vehicle,typeOf _vehicle,_seatHolder,_seatHolderMoveSuccess,fullCrew _vehicle apply {_x select [ARR_2(0,5)]},__FILE__);
        _vehicle deleteVehicleCrew _seatHolder;
        if (!isNull _seatHolder) then { // failsafe
            moveOut _seatHolder;
            deleteVehicle _seatHolder;
        };
        break;
    };
    _seatHolderSeat select 0 params ["", "_role", "_cargoIndex", "_turretPath"];
    if (_role == _bestSeatsRole && {[_cargoIndex, _turretPath] in _bestSeatsParams}) then {
        _vehicle deleteVehicleCrew _seatHolder;
        private _unitMoveSuccess = _unit moveInAny _vehicle;
        if (_unitMoveSuccess) then {
            [QGVAR(deadPersonLoaded), _unit] call CBA_fnc_globalEvent; // Ensure dead unit stays unconscious on all clients
        } else {
            ERROR_8("moveInAny unit failed _unit=%1[%2] _vehicle=%3[%4] _seatHolder=%5 _seatHolderSeat=%6 fullCrew=%7 %8",_unit,typeOf _unit,_vehicle,typeOf _vehicle,_seatHolder,_seatHolderSeat,fullCrew _vehicle apply {_x select [ARR_2(0,5)]},__FILE__);
        };
        TRACE_4("seat",_remainingEmptyPositions,_role,_cargoIndex,_turretPath);
        break;
    };
    TRACE_5("seatHolder",_remainingEmptyPositions,_role,_cargoIndex,_turretPath,_cargoCurrentPositionNumber);
    _seatHolders pushBack _seatHolder;
    if (_role == "cargo") then {INC(_cargoCurrentPositionNumber)};
    DEC(_remainingEmptyPositions);
};

// Cleanup all temporary seat holders
{
    _vehicle deleteVehicleCrew _x;
} forEach _seatHolders;
