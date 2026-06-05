#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Rate of fire bar statement.
 *
 * Arguments:
 * 0: Item config path <CONFIG>
 * 1: Args <ARRAY>
 * - 0: Stat limits <ARRAY of NUMBERs>
 * - 1: Bar limits <ARRAY of NUMBERs>
 *
 * Return Value:
 * Number
 *
 * Public: No
*/

params ["_config", "_args"];
_args params ["_statMinMax", "_barLimits"];

private _fireRate = 1e40;

{
    private _weaponConfig = if (_x == "this") then {
        _config
    } else {
        _config >> _x
    };

    if (getNumber (_weaponConfig >> "showToPlayer") != 0) then {
        _fireRate = _fireRate min (getNumber (_weaponConfig >> "reloadTime"));
    };
} forEach (getArray (_config >> "modes"));

if (!finite _fireRate || {_fireRate < 0}) then {
    _fireRate = 0;
};

linearConversion [_statMinMax select 0, _statMinMax select 1, _fireRate, _barLimits select 0, _barLimits select 1]
