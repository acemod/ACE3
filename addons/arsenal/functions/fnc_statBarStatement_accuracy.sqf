#include "script_component.hpp"
/*
 * Author: Alganthe
 * Accuracy bar statement.
 *
 * Arguments:
 * 0: stats array (ARRAY)
 * 1: item config path (CONFIG)
 * 2: Args
 *  2.1: Stat limits (ARRAY of BOOL)
 *  2.2: Bar limits (ARRAY of SCALAR)
 *
 * Return Value:
 * Number
 *
 * Public: No
*/

params ["_stat", "_config", "_args"];
_args params ["_statMinMax", "_barLimits"];
TRACE_4("statBarStatement_accuracy",_stat,_config,_statMinMax,_barLimits);

private _fireModes = getArray (_config >> "modes");
private _dispersion = [];

{
    private _n = log (getNumber (_config >> _x >> "dispersion"));
    if (!finite _n) then {_n = 0;};
    _dispersion pushBackUnique _n;
} foreach _fireModes;

_dispersion sort true;
TRACE_1("",_dispersion);

linearConversion [_statMinMax select 0, _statMinMax select 1, _dispersion param [0, 0], _barLimits select 0, _barLimits select 1]
