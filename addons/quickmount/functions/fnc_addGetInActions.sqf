#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Adds Get In actions for vehicle seats and Passenger Actions for vehicle crew.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_quickmount_fnc_addGetInActions
 *
 * Public: No
 */

#define ACTION_DISTANCE 4
#define CREW_HEIGHT_ABOVE_SEAT 0.3

params ["_vehicle"];

private _vehicleClass = typeOf _vehicle;
private _vehicleConfig = configOf _vehicle;
private _cargoProxyIndexes = getArray (_vehicleConfig >> "cargoProxyIndexes");
private _seatProxies = _vehicle call FUNC(getSeatProxies);

private _seatPositions = GETVAR(_vehicle,GVAR(seatPositions),[]);
if (_seatPositions isEqualType []) then {
    _seatPositions = createHashMapFromArray _seatPositions;
};
private _seatPositionsConfig = getArray (_vehicleConfig >> QGVAR(seatPositions));
_seatPositionsConfig params [["_model", ""], ["_seatPositionsArray", []]];
// handle inherited classes with different model
if (_model == getText (_vehicleConfig >> "model")) then {
    _seatPositions merge createHashMapFromArray _seatPositionsArray;
};

TRACE_4("addGetInActions",_vehicleClass,_cargoProxyIndexes,_seatPositions,_seatProxies);

private _conditionCrew = {
    call FUNC(canShowFreeSeats)
    && {!isNull ([_target, _actionParams select 0] call FUNC(getSeatUnit))}
};
private _insertChildrenCrew = {
    private _unit = [_target, _actionParams select 0] call FUNC(getSeatUnit);
    [nil, nil, _unit] call EFUNC(interaction,addPassengerActions)
};
private _modifierFunctionCrew = {
    params ["_target", "", "_params", "_actionData"];
    _params params ["_seat"];
    private _unit = [_target, _seat] call FUNC(getSeatUnit);
    if (isNull _unit) exitWith {}; // skip empty seats
    _actionData set [1, [_unit, true] call EFUNC(common,getName)];
    if (["ace_medical_gui"] call EFUNC(common,isModLoaded)) then {
        _this set [0, _unit]; // == _target
        call EFUNC(medical_gui,modifyActionTriageLevel);
    };
};

private _allSeats = fullCrew [_vehicle, "", true];
private _cargoPositionNumber = -1;

{
    _x params ["", "_role", "_cargoIndex", "_turretPath", "_isPersonTurret", "", "_positionName"];
    private _name = if (isLocalized _positionName) then {localize _positionName} else {_positionName};

    private ["_proxyGroup", "_proxyIndex", "_icon", "_condition", "_statement", "_params", "_position", "_positionCrew"];
    switch (_role) do {
        case "driver": {
            if (
                unitIsUAV _vehicle
                || {getNumber (_vehicleConfig >> "hasDriver") == 0}
            ) then {continue};
            _proxyGroup = "driver";
            _proxyIndex = 1;
            _params = [_turretPath];
            _condition = {
                call FUNC(canShowFreeSeats)
                && {!lockedDriver _target}
                && {!alive driver _target}
            };
            _statement = {_player action ["GetInDriver", _target]};
            _icon = [ICON_DRIVER, ICON_PILOT] select (_vehicle isKindOf "Air");
        };
        case "cargo": {
            INC(_cargoPositionNumber);
            _proxyGroup = "cargo";
            _proxyIndex = _cargoProxyIndexes param [_cargoPositionNumber, _cargoPositionNumber + 1];
            _params = [_cargoIndex, _cargoPositionNumber];
            _condition = {
                call FUNC(canShowFreeSeats)
                && {
                    private _cargoIndex = _actionParams select 0;
                    !(_target lockedCargo _cargoIndex)
                    && {!alive ([_target, _cargoIndex] call FUNC(getSeatUnit))}
                }
            };
            _statement = {_player action ["GetInCargo", _target, _actionParams select 1]};
            _name = format ["%1 %2", _name, _cargoPositionNumber + 1];
            _icon = ICON_CARGO;
        };
        default {
            if (_role == "gunner" && {unitIsUAV _vehicle}) then {continue};
            private _turretConfig = [_vehicleConfig, _turretPath] call CBA_fnc_getTurret;
            private _proxyType = getText (_turretConfig >> "proxyType");
            _proxyGroup = switch (_proxyType) do {
                case "CPCommander": {"commander"};
                case "CPGunner": {"gunner"};
                default {"cargo"};
            };
            _proxyIndex = getNumber (_turretConfig >> "proxyIndex");
            _params = [_turretPath];
            _condition = {
                call FUNC(canShowFreeSeats)
                && {
                    private _turretPath = _actionParams select 0;
                    !(_target lockedTurret _turretPath)
                    && {!alive ([_target, _turretPath] call FUNC(getSeatUnit))}
                }
            };
            _statement = {_player action ["GetInTurret", _target, _actionParams select 0]};
            _icon = switch true do {
                case (getNumber (_turretConfig >> "isCopilot") > 0): {ICON_PILOT};
                case (_role == "gunner"): {ICON_GUNNER};
                case (_role == "commander"): {ICON_COMMANDER};
                case (_isPersonTurret): {ICON_FFV};
                case (getText (_turretConfig >> "gun") == ""): {ICON_CARGO};
                default {ICON_TURRET};
            };
        };
    };

    private _positionString = _seatPositions getOrDefault [_params select 0, ""];
    if (_positionString != "") then {
        _position = compile _positionString;
        _positionCrew = compile format ["(%1) vectorAdd [0, 0, %2]", _positionString, CREW_HEIGHT_ABOVE_SEAT];
        TRACE_6("seat position",_role,_cargoIndex,_turretPath,_proxyGroup,_proxyIndex,_position);
    } else {
        private _seatProxy = _seatProxies getOrDefault [_proxyGroup, createHashMap] getOrDefault [_proxyIndex, []];
        TRACE_6("seat proxy",_role,_cargoIndex,_turretPath,_proxyGroup,_proxyIndex,_seatProxy);
        if (_seatProxy isEqualTo []) then {continue};
        // cannot use static position because some proxy positions move with turret rotation
        _position = compile format ["_target selectionPosition ['%1', %2, 'AveragePoint']", _seatProxy select 0, _seatProxy select 1];
        _positionCrew = compile format [
            "_target selectionPosition ['%1', %2, 'AveragePoint'] vectorAdd [0, 0, %3]",
            _seatProxy select 0,
            _seatProxy select 1,
            CREW_HEIGHT_ABOVE_SEAT
        ];
    };

    private _action = [
        format ["%1%2%3empty", _role, _cargoIndex, _turretPath],
        _name, _icon, _statement, _condition, {}, _params, _position, ACTION_DISTANCE
    ] call EFUNC(interact_menu,createAction);
    [_vehicleClass, 0, [], _action] call EFUNC(interact_menu,addActionToClass);

    // modifier function needs icon color
    private _actionCrew = [
        format ["%1%2%3crew", _role, _cargoIndex, _turretPath],
        "", [_icon, "#FFFFFF"], {}, _conditionCrew, _insertChildrenCrew,
        _params, _positionCrew, ACTION_DISTANCE, nil, _modifierFunctionCrew
    ] call EFUNC(interact_menu,createAction);
    [_vehicleClass, 0, [], _actionCrew] call EFUNC(interact_menu,addActionToClass);
} forEach _allSeats;
