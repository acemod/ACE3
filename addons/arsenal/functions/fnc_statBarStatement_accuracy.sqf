#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Accuracy bar statement.
 *
 * Arguments:
 * 0: Item config path <CONFIG>
 * 1: Args <ARRAY>
 * - 0: Stat limits <ARRAY of NUMBERs>
 * - 1: Bar limits <ARRAY of NUMBERs>
 *
 * Return Value:
 * Accuracy <NUMBER>
 *
 * Public: No
*/

params ["_config", "_args"];
_args params ["_statMinMax", "_barLimits"];

private _dispersion = 1e40;

{
    private _weaponConfig = if (_x == "this") then {
        _config
    } else {
        _config >> _x
    };

    if (getNumber (_weaponConfig >> "showToPlayer") != 0) then {
        _dispersion = _dispersion min (getNumber (_weaponConfig >> "dispersion"));
    };
} forEach (getArray (_config >> "modes"));

_dispersion = if (finite _dispersion && {_dispersion > 0}) then {
    log _dispersion
} else {
    0
};

linearConversion [_statMinMax select 0, _statMinMax select 1, _dispersion, _barLimits select 0, _barLimits select 1]
