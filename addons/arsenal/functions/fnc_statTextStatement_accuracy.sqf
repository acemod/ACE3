/*
 * Author: Alganthe
 * Accuracy text statement.
 *
 * Arguments:
 * 0: stat (STRING)
 * 1: item config path (CONFIG)
 * 2: Args for configExtreme
 *  2.1: Stat limits (ARRAY of BOOL)
 *  2.2: Evaluate as a logarithmic number (BOOL)
 *
 * Return Value:
 * Number
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_stat", "_config", "_args"];
_args params ["_statMinMax", "_configExtremeBool"];

private _statValues = [
    [_config],
    [_stat],
    [_configExtremeBool],
    [_statMinMax select 0]
] call BIS_fnc_configExtremes;

private _dispersion = (_statValues select 1) select 0;

format ["%1 MIL (%2 MOA)", (_dispersion * 1000) toFixed 2, (_dispersion / pi * 10800) ToFixed 1];
