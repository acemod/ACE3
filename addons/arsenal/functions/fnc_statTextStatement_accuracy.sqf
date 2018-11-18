#include "script_component.hpp"
/*
 * Author: Alganthe
 * Accuracy text statement.
 *
 * Arguments:
 * 0: stat (STRING)
 * 1: item config path (CONFIG)
 * 2: Args for configExtreme
 *  2.1: Stat limits (ARRAY of BOOL)
 *  2.2: Evaluate as a logarithmic number (BOOL)
 *
 * Return Value:
 * Number
 *
 * Public: No
*/

params ["_stat", "_config", "_args"];
_args params ["_statMinMax", "_configExtremeBool"];

private _fireModes = getArray (_config >> "modes");
private _dispersion = [];

{
    if (getNumber (_config >> _x >> "showToPlayer") != 0) then {
        _dispersion pushBackUnique (getNumber (_config >> _x >> "dispersion"));
    };
} foreach _fireModes;

_dispersion sort true;
_dispersion = _dispersion param [0, 0];

format ["%1 MIL (%2 MOA)", (_dispersion * 1000) toFixed 2, (_dispersion / pi * 10800) ToFixed 1];
