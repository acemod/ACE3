#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Rate of fire bar statement.
 *
 * Arguments:
 * 0: Not used
 * 1: Item config path <CONFIG>
 * 2: Args <ARRAY>
 * - 0: Stat limits <ARRAY of BOOLs>
 * - 1: Bar limits <ARRAY of NUMBERs>
 *
 * Return Value:
 * Number
 *
 * Public: No
*/

params ["", "_config", "_args"];
_args params ["_statMinMax", "_barLimits"];

private _fireRate = [];

{
    private _n = log (getNumber (_config >> _x >> "reloadTime"));

    if (!finite _n) then {
        _n = 0;
    };

    _fireRate pushBackUnique _n;
} forEach (getArray (_config >> "modes"));

_fireRate sort true;

linearConversion [_statMinMax select 0, _statMinMax select 1, _fireRate param [0, 0], _barLimits select 0, _barLimits select 1]
