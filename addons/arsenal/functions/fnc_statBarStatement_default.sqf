#include "script_component.hpp"
/*
 * Author: Alganthe
 * Generic bar statement for stats.
 *
 * Arguments:
 * 0: stat (STRING)
 * 1: item config path (CONFIG)
 * 2: Args for configExtreme
 *  2.1: Stat limits (ARRAY of BOOL)
 *  2.2: Bar limits (ARRAY of SCALAR)
 *  2.3: Evaluate as a logarithmic number (BOOL)
 *
 * Return Value:
 * Number
 *
 * Public: Yes
*/

params ["_stat", "_config", "_args"];
_args params ["_statMinMax", "_barLimits", "_configExtremeBool"];

private _statValues = [
    [_config],
    [_stat],
    [_configExtremeBool],
    [_statMinMax select 0]
] call BIS_fnc_configExtremes;

linearConversion [_statMinMax select 0, _statMinMax select 1, (_statValues select 1) select 0, _barLimits select 0, _barLimits select 1]
