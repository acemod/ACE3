/*
 * Author: ?
 *
 * ?
 *
 * Arguments:
 * ?
 *
 * Return value:
 * ?
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"


diag_log text format["REGISTERED ACE PFH HANDLERS"];
diag_log text format["-------------------------------------------"];
if (!isNil "ACE_PFH_COUNTER") then {
    {
        _x params ["_pfh"];
        _pfh params ["_id","_pfh1","_pfh2"];
        diag_log text format["Registered PFH: id=%1, %1:%2", _id, _pfh1, _pfh2];
    } count ACE_PFH_COUNTER;
};

diag_log text format["ACE COUNTER RESULTS"];
diag_log text format["-------------------------------------------"];
{
    private ["_counterEntry", "_total", "_count", "_delta", "_averageResult"];
    _counterEntry = _x;
    _counterEntry params ["_entry"];
    _total = 0;
    _count = 0;
    _averageResult = 0;
    if( (count _counterEntry) > 3) then {
        // calc
        {
            if(_forEachIndex > 2) then {
                _x params ["_delta1", "_delta2"];
                _count = _count + 1;

                _total = _total + (_delta1 - _delta2);
            };
        } forEach _counterEntry;

        // results
        _averageResult = (_total / _count) * 1000;

        // dump results
        diag_log text format["%1: Average: %2s / %3 = %4ms", _entry, _total, _count, _averageResult];
    } else {
        diag_log text format["%1: No results", _entry];
    };
} count ACE_COUNTERS;

/*
// Dump PFH Trackers
diag_log text format["ACE_PERFORMANCE_EXCESSIVE_STEP_TRACKER"];
diag_log text format["-------------------------------------------"];
{
    private["_delay"];
    _delay = _x select 2;
    //if(_delay > 0) then { _delay = _delay / 1000; };

    diag_log text format["%1: %2s, delay=%3, handle=%4",(_x select 0), _delay, (_x select 3), (_x select 4)];
} forEach ACE_PERFORMANCE_EXCESSIVE_STEP_TRACKER;

// Dump PFH Trackers
diag_log text format["ACE_PERFORMANCE_EXCESSIVE_FRAME_TRACKER"];
diag_log text format["-------------------------------------------"];
{
    private["_delta"];
    _delta = _x select 1;
    //if(_delta > 0) then { _delta = _delta / 1000; };
    diag_log text format["  DELTA: %1s", _delta];
} forEach ACE_PERFORMANCE_EXCESSIVE_FRAME_TRACKER;

//{
//
//} forEach ACRE_EXCESSIVE_FRAME_TRACKER;

*/
