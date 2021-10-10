#include "script_component.hpp"
/*
 * Author: ?
 * Dumps performance counter statistics into Logs.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_common_fnc_dumpPerformanceCounters
 *
 * Public: No
 */

diag_log text format ["REGISTERED ACE PFH HANDLERS"];
diag_log text format ["-------------------------------------------"];

if (!isNil "ACE_PFH_COUNTER") then {
    {
        _x params ["_pfh", "_parameters"];

        private _isActive = ["ACTIVE", "REMOVED"] select isNil {CBA_common_PFHhandles select (_pfh select 0)};

        diag_log text format ["Registered PFH: id=%1 [%2, delay %3], %4:%5", _pfh select 0, _isActive, _parameters select 1, _pfh select 1, _pfh select 2];
        false
    } count ACE_PFH_COUNTER;
};

diag_log text format ["ACE COUNTER RESULTS"];
diag_log text format ["-------------------------------------------"];

{
    private _counterEntry = _x;
    private _iter = 0;
    private _total = 0;
    private _count = 0;
    private _averageResult = 0;

    if (count _counterEntry > 3) then {
        // calc
        {
            if (_iter > 2) then {
                _count = _count + 1;
                private _delta = (_x select 1) - (_x select 0);

                _total = _total + _delta;
            };

            _iter = _iter + 1;
            false
        } count _counterEntry;

        // results
        _averageResult = (_total / _count) * 1000;

        // dump results
        diag_log text format ["%1: Average: %2s / %3 = %4ms", _counterEntry select 0, _total, _count, _averageResult];
    } else {
        diag_log text format ["%1: No results", _counterEntry select 0];
    };
    false
} count ACE_COUNTERS;

/*
// Dump PFH Trackers
diag_log text format["ACE_PERFORMANCE_EXCESSIVE_STEP_TRACKER"];
diag_log text format["-------------------------------------------"];
{
    private _delay = _x select 2;
    //if(_delay > 0) then { _delay = _delay / 1000; };

    diag_log text format["%1: %2s, delay=%3, handle=%4",(_x select 0), _delay, (_x select 3), (_x select 4)];
} forEach ACE_PERFORMANCE_EXCESSIVE_STEP_TRACKER;

// Dump PFH Trackers
diag_log text format["ACE_PERFORMANCE_EXCESSIVE_FRAME_TRACKER"];
diag_log text format["-------------------------------------------"];
{
    private _delta = _x select 1;
    //if(_delta > 0) then { _delta = _delta / 1000; };
    diag_log text format["  DELTA: %1s", _delta];
} forEach ACE_PERFORMANCE_EXCESSIVE_FRAME_TRACKER;

//{
//
//} forEach ACRE_EXCESSIVE_FRAME_TRACKER;

*/
