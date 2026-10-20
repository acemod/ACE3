#include "..\script_component.hpp"
/*
 * Author: Alganthe, johnb43
 * Accuracy text statement.
 *
 * Arguments:
 * 0: Stats array (not used) <ARRAY>
 * 1: Item config path <CONFIG>
 *
 * Return Value:
 * Stat Text <STRING>
 *
 * Public: No
*/

params ["", "_config"];
TRACE_1("statTextStatement_accuracy",_config);

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

if (!finite _dispersion || {_dispersion < 0}) then {
    _dispersion = 0;
};

format ["%1 MIL (%2 MOA)", (_dispersion * 1000) toFixed 2, (_dispersion / pi * 10800) toFixed 1]
