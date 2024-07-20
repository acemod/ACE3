#include "..\script_component.hpp"
/*
 * Author: Kingsley
 * Mounts the player in the vehicle they are directly looking at based on their distance.
 *
 * Arguments:
 * 0: Target <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_quickmount_fnc_getInNearest
 *
 * Public: No
 */

if (
    !GVAR(enabled) ||
    {isNull ACE_player} ||
    {!isNull objectParent ACE_player} ||
    {!(ACE_player call EFUNC(common,isAwake))}
) exitWith {};

params [["_target", objNull, [objNull]]];
TRACE_1("getInNearest",_target);

// If target is not defined (e.g. keybind was used), search for valid target
if (isNull _target) then {
    private _start = ACE_player modelToWorldVisualWorld (ACE_player selectionPosition "pilot");
    private _end = (_start vectorAdd (getCameraViewDirection ACE_player vectorMultiply GVAR(distance)));
    private _objects = lineIntersectsSurfaces [_start, _end, ACE_player];
    _target = (_objects param [0, []]) param [2, objNull];
};

if (!alive _target) exitWith {};

if (locked _target >= 2 || {!simulationEnabled _target}) exitWith {
    [LLSTRING(VehicleLocked)] call EFUNC(common,displayTextStructured);
};

TRACE_2("",_target,typeOf _target);

if (
    (speed _target > GVAR(speed)) ||
    {["Air", "LandVehicle", "Ship", "StaticMortar"] findIf {_target isKindOf _x} == -1} ||
    {!([ACE_player, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith))}
) exitWith {};

private _seats = ["driver", "gunner", "commander", "cargo"];
private _sortedSeats = [_seats select GVAR(priority)];
_seats deleteAt GVAR(priority);
_sortedSeats append _seats;

private _fullCrew = fullCrew [_target, "", true];

private _hasAction = false;
scopeName "SearchForSeat";

{
    private _desiredRole = _x;

    {
        _x params ["_unit", "_role", "_cargoIndex", "_turretPath"];

        if (!alive _unit) then {
            private _effectiveRole = _role;

            if ((_effectiveRole in ["driver", "gunner"]) && {unitIsUAV _target}) exitWith {}; // Ignoring UAV Driver/Gunner
            if ((_effectiveRole == "driver") && {(getNumber (configOf _target >> "hasDriver")) == 0}) exitWith {}; // Ignoring Non Driver (static weapons)

            // Seats can be locked independently of the main vehicle
            if ((_effectiveRole == "driver") && {lockedDriver _target}) exitWith {TRACE_1("lockedDriver",_x);};
            if ((_cargoIndex >= 0) && {_target lockedCargo _cargoIndex}) exitWith {TRACE_1("lockedCargo",_x);};
            if ((_turretPath isNotEqualTo []) && {_target lockedTurret _turretPath}) exitWith {TRACE_1("lockedTurret",_x);};

            if (_effectiveRole == "turret") then {
                private _turretConfig = [_target, _turretPath] call CBA_fnc_getTurret;

                if (getNumber (_turretConfig >> "isCopilot") == 1) exitWith {
                    _effectiveRole = "driver";
                };

                if (
                    _cargoIndex >= 0 || // FFV
                    {getText (_turretConfig >> "gun") == ""} // Turret without weapon
                ) exitWith {
                    _effectiveRole = "cargo";
                };

                _effectiveRole = "gunner"; // Door gunners / 2nd turret
            };

            TRACE_2("",_effectiveRole,_x);

            if (_effectiveRole != _desiredRole) exitWith {};

            if (_turretPath isNotEqualTo []) then {
                 // Using GetInTurret seems to solve problems with incorrect GetInEH params when gunner/commander
                ACE_player action ["GetInTurret", _target, _turretPath];
                TRACE_3("Getting In Turret",_x,_role,_turretPath);
            } else {
                if (_cargoIndex > -1) then {
                    // GetInCargo expects the index of the seat in the "cargo" array from fullCrew
                    // See description: https://community.bistudio.com/wiki/fullCrew
                    private _cargoActionIndex = (fullCrew [_target, "cargo", true]) findIf {(_x select 2) == _cargoIndex};

                    ACE_player action ["GetInCargo", _target, _cargoActionIndex];
                    TRACE_4("Getting In Cargo",_x,_role,_cargoActionIndex,_cargoIndex);
                } else {
                    ACE_player action ["GetIn" + _role, _target];
                    TRACE_2("Getting In",_x,_role);
                };
            };

            _hasAction = true;
            breakTo "SearchForSeat";
        };
    } forEach _fullCrew;
} forEach _sortedSeats;

if (!_hasAction) then {
    TRACE_1("no empty seats",_hasAction);
    [LLSTRING(VehicleFull)] call EFUNC(common,displayTextStructured);
};
