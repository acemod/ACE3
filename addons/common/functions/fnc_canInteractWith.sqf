/*
 * Author: commy2
 * Check if the unit can interact.
 *
 * Arguments:
 * 0: The player. <OBJECT>
 * 1: The interaction target. objNull to ignore. <OBJECT>
 * 2: Exceptions. What general conditions are to skip? (default: []) <ARRAY>
 *
 * Return Value:
 * Unit can interact?
 *
 * Public: Yes
 */
#include "script_component.hpp"

if (diag_frameno != GVAR(CanInteractCache) select 0) then {
    GVAR(CanInteractCache) = [diag_frameno, [], [], []];
};

params ["_unit", "_target", ["_exceptions", []]];

_exceptions = _exceptions apply {toLower _x};

private _owner = _target getVariable [QGVAR(owner), objNull];

// exit if the target is not free to interact
if (!isNull _owner && {_unit != _owner}) exitWith {false};

// check general conditions
private _conditions = missionNamespace getVariable [QGVAR(InteractionConditions), [[],[]]];
_conditions params ["_conditionNames", "_conditionFuncs"];

private _canInteract = true;

scopeName "main";

{
    // don't even bother when this canInteractWith call has this as an exception
    if !(_x in _exceptions) then {
        private _index = (GVAR(CanInteractCache) select 1) find _x;

        // not cached this frame. Do math and cache
        if (_index == -1) then {
            if !([_unit, _target] call (_conditionFuncs select _forEachIndex)) then {
                false breakOut "main";
            };

            (GVAR(CanInteractCache) select 1) pushBack _x;
            (GVAR(CanInteractCache) select 2) pushBack [_unit, _target];
            (GVAR(CanInteractCache) select 3) pushBack _canInteract;
        } else {
            private _index1 = (GVAR(CanInteractCache) select 2 select _index) find [_unit, _target];

            // already cached this frame. Check if the arguments were the same.
            if ([_unit, _target] isEqualTo (GVAR(CanInteractCache) select 2 select _index)) then {
                _canInteract = GVAR(CanInteractCache) select 3 select _index;
            } else {
                if (!(_x in _exceptions) && {!([_unit, _target] call (_conditionFuncs select _forEachIndex))}) then {
                    false breakOut "main";
                };

                (GVAR(CanInteractCache) select 1) set [_index, _x];
                (GVAR(CanInteractCache) select 2) set [_index, [_unit, _target]];
                (GVAR(CanInteractCache) select 3) set [_index, _canInteract];
            };

        };
    };
} forEach _conditionNames;

_canInteract
