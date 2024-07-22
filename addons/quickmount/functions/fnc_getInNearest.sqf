#include "..\script_component.hpp"
/*
 * Author: Kingsley
 * Mount the player in the vehicle they are directly looking at based on their distance.
 *
 * Arguments:
 * 0: Target <OBJECT>(Optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_quickmount_fnc_getInNearest;
 *
 * Public: No
 */

if (!GVAR(enabled) ||
    {isNull ACE_player} ||
    {vehicle ACE_player != ACE_player} ||
    {!alive ACE_player} ||
    {ACE_player getVariable ["ace_unconscious", false]}
) exitWith {};

params [["_interactionTarget", objNull, [objNull]]];
TRACE_1("getInNearest",_interactionTarget);

private _start = ACE_player modelToWorldVisualWorld (ACE_player selectionPosition "pilot");
private _end = (_start vectorAdd (getCameraViewDirection ACE_player vectorMultiply GVAR(distance)));
private _objects = lineIntersectsSurfaces [_start, _end, ACE_player];
private _target = (_objects param [0, []]) param [2, objNull];

if ((isNull _target) && {alive _interactionTarget}) then {
    _end = _start vectorAdd ((_start vectorFromTo (aimPos _interactionTarget)) vectorMultiply GVAR(distance));
    _objects = lineIntersectsSurfaces [_start, _end, ACE_player];
    TRACE_1("2nd ray attempt at interaction target aim pos",_objects);
    _target = (_objects param [0, []]) param [2, objNull];
};

if (locked _target in [2,3] || {!simulationEnabled _target}) exitWith {
    [localize LSTRING(VehicleLocked)] call EFUNC(common,displayTextStructured);
    true
};

TRACE_2("",_target,typeOf _target);

if (!isNull _target &&
        {alive _target} &&
        {{_target isKindOf _x} count ["Air","LandVehicle","Ship","StaticMortar"] > 0} &&
        {([ACE_player, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith))} &&
        {speed _target <= GVAR(speed)}
        ) then {


    if (GVAR(priority) > 3 || GVAR(priority) < 0) then {
        GVAR(priority) = 0;
    };

    private _seats = ["Driver", "Gunner", "Commander", "Cargo"];
    private _sortedSeats = [_seats select GVAR(priority)];
    _seats deleteAt GVAR(priority);
    _sortedSeats append _seats;


    private _hasAction = false;
    scopeName "SearchForSeat";
    {
        private _desiredRole = _x;
        {
            _x params ["_unit", "_role", "_cargoIndex", "_turretPath"];
            if ((isNull _unit) || {!alive _unit}) then {
                private _effectiveRole = toLowerANSI _role;

                if ((_effectiveRole in ["driver", "gunner"]) && {unitIsUAV _target}) exitWith {}; // Ignoring UAV Driver/Gunner
                if ((_effectiveRole == "driver") && {(getNumber (configOf _target >> "hasDriver")) == 0}) exitWith {}; // Ignoring Non Driver (static weapons)

                // Seats can be locked independently of the main vehicle
                if ((_role == "driver") && {lockedDriver _target}) exitWith {TRACE_1("lockedDriver",_x);};
                if ((_cargoIndex >= 0) && {_target lockedCargo _cargoIndex}) exitWith {TRACE_1("lockedCargo",_x);};
                if ((_turretPath isNotEqualTo []) && {_target lockedTurret _turretPath}) exitWith {TRACE_1("lockedTurret",_x);};

                if (_effectiveRole == "turret") then {
                    private _turretConfig = [_target, _turretPath] call CBA_fnc_getTurret;
                    if (getNumber (_turretConfig >> "isCopilot") == 1) exitWith {
                        _effectiveRole = "driver";
                    };
                    if (
                        _cargoIndex >= 0 // FFV
                        || {"" isEqualTo getText (_turretConfig >> "gun")} // turret without weapon
                    ) exitWith {
                        _effectiveRole = "cargo";
                    };
                    _effectiveRole = "gunner"; // door gunners / 2nd turret
                };
                TRACE_2("",_effectiveRole,_x);
                if (_effectiveRole != _desiredRole) exitWith {};

                if (_turretPath isNotEqualTo []) then {
                     // Using GetInTurret seems to solve problems with incorrect GetInEH params when gunner/commander
                    ACE_player action ["GetInTurret", _target, _turretPath];
                    TRACE_3("Geting In Turret",_x,_role,_turretPath);
                } else {
                    if (_cargoIndex > -1) then {
                        // GetInCargo expects the index of the seat in the "cargo" array from fullCrew
                        // See description: https://community.bistudio.com/wiki/fullCrew
                        private _cargoActionIndex = -1;
                        {
                            if ((_x select 2) == _cargoIndex) exitWith {_cargoActionIndex = _forEachIndex};
                        } forEach (fullCrew [_target, "cargo", true]);

                        ACE_player action ["GetInCargo", _target, _cargoActionIndex];
                        TRACE_4("Geting In Cargo",_x,_role,_cargoActionIndex,_cargoIndex);
                    } else {
                        ACE_player action ["GetIn" + _role, _target];
                        TRACE_2("Geting In",_x,_role);
                    };
                };

                _hasAction = true;
                breakTo "SearchForSeat";
            };
        } forEach (fullCrew [_target, "", true]);
    } forEach _sortedSeats;

    if (!_hasAction) then {
        TRACE_1("no empty seats",_hasAction);
        [localize LSTRING(VehicleFull)] call EFUNC(common,displayTextStructured);
    };
};

true
