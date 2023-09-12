#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Generic bar statement for stats.
 *
 * Arguments:
 * 0: Stat <STRING>
 * 1: Item config path <CONFIG>
 * 2: Args for configExtreme <ARRAY>
 * - 0: Stat limits <ARRAY of BOOLS>
 * - 1: Bar limits <ARRAY of NUMBERS>
 * - 2: Evaluate as a logarithmic number <BOOL>
 *
 * Return Value:
 * Bar statement <NUMBER>
 *
 * Example:
 * ["ACE_maxZeroing", _config, [[0, 2500], [0.01, 1], false]] call ace_arsenal_fnc_statBarStatement_default
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
