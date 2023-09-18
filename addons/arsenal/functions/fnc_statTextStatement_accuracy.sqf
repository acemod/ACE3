#include "..\script_component.hpp"
/*
 * Author: Alganthe, johnb43
 * Accuracy text statement.
 *
 * Arguments:
 * 0: Not used
 * 1: Item config path <CONFIG>
 *
 * Return Value:
 * Stat Text <STRING>
 *
 * Public: No
*/

params ["", "_config"];
TRACE_1("statTextStatement_accuracy",_config);

private _dispersion = [];

{
    if (getNumber (_config >> _x >> "showToPlayer") != 0) then {
        _dispersion pushBackUnique (getNumber (_config >> _x >> "dispersion"));
    };
} forEach (getArray (_config >> "modes"));

_dispersion sort true;
_dispersion = _dispersion param [0, 0];

format ["%1 MIL (%2 MOA)", (_dispersion * 1000) toFixed 2, (_dispersion / pi * 10800) toFixed 1];
