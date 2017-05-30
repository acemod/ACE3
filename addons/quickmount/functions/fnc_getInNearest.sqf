/*
 * Author: Kingsley
 * Mount the player in the vehicle they are directly looking at based on their distance.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_quickmount_fnc_getInNearest;
 *
 * Public: No
 */
#include "script_component.hpp"

if (!GVAR(enabled) ||
    {isNull ACE_player} ||
    {vehicle ACE_player != ACE_player} ||
    {!alive ACE_player} ||
    {ACE_player getVariable ["ace_unconscious", false]}
) exitWith {};

private _start = AGLtoASL (ACE_player modelToWorldVisual (ACE_player selectionPosition "pilot"));
private _end = (_start vectorAdd (getCameraViewDirection ACE_player vectorMultiply GVAR(distance)));
private _objects = lineIntersectsSurfaces [_start, _end, ACE_player];
private _target = (_objects param [0, []]) param [2, objNull];

if (locked _target in [2,3]) exitWith {
    [localize LSTRING(VehicleLocked)] call EFUNC(common,displayTextStructured);
    true
};

TRACE_1("",_target);

if (!isNull _target &&
        {alive _target} &&
        {{_target isKindOf _x} count ["Air","LandVehicle","Ship","StaticMortar"] > 0} &&
        {([ACE_player, _target] call EFUNC(common,canInteractWith))} &&
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
                private _effectiveRole = toLower _role;

                if ((_effectiveRole in ["driver", "gunner"]) && {unitIsUAV _target}) exitWith {}; // Ignoring UAV Driver/Gunner
                if ((_effectiveRole == "driver") && {(getNumber (([_target] call CBA_fnc_getObjectConfig) >> "hasDriver")) == 0}) exitWith {}; // Ignoring Non Driver (static weapons)
                if (_effectiveRole == "turret") then {
                    if ((getNumber (([_target, _turretPath] call CBA_fnc_getTurret) >> "isCopilot")) == 1) exitWith {
                        _effectiveRole = "driver";
                    };
                    if (_cargoIndex < 0) exitWith {
                        _effectiveRole = "gunner"; // door gunners / 2nd turret
                    };
                    _effectiveRole = "cargo"; // probably a FFV
                };
                TRACE_2("",_effectiveRole,_x);
                if (_effectiveRole != _desiredRole) exitWith {};

                if (_role == "Turret") then {
                    ACE_player action ["GetIn" + _role, _target, _turretPath];
                    TRACE_3("Geting In",_x,_role,_turretPath);
                } else {
                    ACE_player action ["GetIn" + _role, _target];
                    TRACE_3("Geting In",_x,_role);
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
