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

private ["_delay", "_found", "_pushedOnIndex", "_element"];
_delay = _this select 2;

if (isnil QGVAR(waitAndExecQueue)) then {
    GVAR(waitAndExecQueue) = [];
    GVAR(addedWaitAndExecPFH) = false;
};


if (count GVAR(waitAndExecQueue) > 0) then {
    _element = GVAR(waitAndExecQueue);
    if (time + _delay < (_element select 1)) exitwith {
        GVAR(waitAndExecQueue) = [_this, time + _delay, _element];
    };

    while {true} do {
        _nextElement = _element select 2;
        if (count _nextElement == 0) exitwith { // last element
            _element set [2, [_this, time + _delay, []]];
        };
        if (time + _delay < (_nextElement select 1)) exitwith {
            _element set [2, [_this, time + _delay, _nextElement]];
        };
        _element = _nextElement;
    };
} else {
    GVAR(waitAndExecQueue) = [_this, time + _delay, []];
};

if !(GVAR(addedWaitAndExecPFH)) then {
    GVAR(addedWaitAndExecPFH) = true;
    [
        {
            private ["_element", "_nextElement", "_func","_params"];
            _element = GVAR(waitAndExecQueue);
            while {true} do {
                if (count _element == 0) exitwith {GVAR(waitAndExecQueue) = _element;}; // last element
                if (time < (_element select 1)) exitWith {GVAR(waitAndExecQueue) = _element;}; // all current valid elements have been executed
                _func = (_element select 0) select 0;
                _params = (_element select 0) select 1;
                _params call _func;
                _element = _element select 2;
            };
        },
        0,
        []
    ] call CBA_fnc_addPerFrameHandler
};