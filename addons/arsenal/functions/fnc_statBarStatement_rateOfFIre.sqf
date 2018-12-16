#include "script_component.hpp"
/*
 * Author: Alganthe
 * Rate of fire bar statement.
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

private _fireModes = getArray (_config >> "modes");
private _fireRate = [];

{
    _fireRate pushBackUnique log (getNumber (_config >> _x >> "reloadTime"));
} foreach _fireModes;

_fireRate sort true;

linearConversion [_statMinMax select 0, _statMinMax select 1, _fireRate param [0, 0], _barLimits select 0, _barLimits select 1]
