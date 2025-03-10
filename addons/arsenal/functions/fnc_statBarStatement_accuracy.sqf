#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Accuracy bar statement.
 *
 * Arguments:
 * 0: Not used
 * 1: Item config path <CONFIG>
 * 2: Args <ARRAY>
 * - 0: Stat limits <ARRAY of BOOLs>
 * - 1: Bar limits <ARRAY of NUMBERs>
 *
 * Return Value:
 * <NUMBER>
 *
 * Public: No
*/

params ["", "_config", "_args"];
_args params ["_statMinMax", "_barLimits"];

private _dispersion = [];

{
    if (getNumber (_config >> _x >> "showToPlayer") != 0) then {
        private _n = log (getNumber (_config >> _x >> "dispersion"));

        if (!finite _n) then {
            _n = 0;
        };

        _dispersion pushBackUnique _n;
    };
} forEach (getArray (_config >> "modes"));

_dispersion sort true;

linearConversion [_statMinMax select 0, _statMinMax select 1, _dispersion param [0, 0], _barLimits select 0, _barLimits select 1]
