/*
 * Author: esteldunedain
 *
 * Executes a code once with a given game time delay, using a PFH
 *
 * Argument:
 * 0: Code to execute (Code)
 * 1: Parameters to run the code with (Array)
 * 2: Delay in seconds before executing the code (Number)
 * 3: Interval of time in which the execution is evaluated, 0 means every frame (Number)
 *
 * Return value:
 * PFH handler ID
 */
#include "script_component.hpp"

private ["_delay", "_found", "_pushedOnIndex", "_newArray"];
_delay = _this select 2;

if (isnil QGVAR(waitAndExecQueue)) then {
    GVAR(waitAndExecQueue) = [];
    GVAR(waitAndExecQueueSize) = 0;
};

_newArray = [];
_found = false;
_pushedOnIndex = -1;
{
    if (time + _delay < (_x select 1) && {!_found}) then {
        _found = true;
        _pushedOnIndex = _newArray pushback [_this, time + _delay];
    };
    _newArray pushback _x;
}foreach GVAR(waitAndExecQueue);

if (!_found) then {
    _pushedOnIndex = _newArray pushback [_this, time + _delay];
};

GVAR(waitAndExecQueue) = _newArray;
GVAR(waitAndExecQueueSize) = GVAR(waitAndExecQueueSize) + 1;

if (_pushedOnIndex == 0) then {
    [
        {
            private ["_lastExecuted", "_lastExecuted", "_func", "_params"];
            _lastExecuted = -1;

            {
                if (time < (_x select 1)) exitWith {};
                _lastExecuted = _foreachIndex;
                _func = (_x select 0) select 0;
                _params = (_x select 0) select 1;
                _params call _func;
            }foreach GVAR(waitAndExecQueue);

            if (_lastExecuted >= 0) then {
                GVAR(waitAndExecQueue) deleteRange [0, _lastExecuted + 1];
                GVAR(waitAndExecQueueSize) = GVAR(waitAndExecQueueSize) - (_lastExecuted + 1);
            };

            if (GVAR(waitAndExecQueueSize) <= 0) then {
                // Remove the PFH
                [(_this select 1)] call cba_fnc_removePerFrameHandler;
            };
        },
        0,
        []
    ] call CBA_fnc_addPerFrameHandler
};